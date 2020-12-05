package mm;

import mm.*;


import com.smartfoxserver.v2.*;
import com.smartfoxserver.v2.core.*;
import com.smartfoxserver.v2.entities.*;
import com.smartfoxserver.v2.entities.data.*;
import com.smartfoxserver.v2.entities.variables.*;
import com.smartfoxserver.v2.requests.buddylist.*;
import com.smartfoxserver.v2.requests.*;
import com.smartfoxserver.v2.util.*;

import openfl.display.*;
import openfl.events.*;
import openfl.utils.*;
import openfl.net.*;

import haxe.crypto.Md5;

import mm.*;
import mm.screens.*;
import mm.rooms.*;
/*import mm.screens.shop.*;
import mm.aprilFools.*;
import mm.parties.*;*/
import com.greensock.*;
import com.greensock.easing.*;

class Main extends MovieClip
{

    public static var Quest:Int = 0;
    public static var M:Main;
    
    public static var SFS:SmartFox = null;
    public static var Config:Map<String, Dynamic>;
    public static var BuddyListInited:Bool;
        
    public static var RoomScreen:Dynamic;
    public static var GMScreen:GameScreen;
    
    public static var SO:SharedObject = SharedObject.getLocal('mirkomir');
    public static var Version:String = '1.0.0';

	//Debug
	public static var Debug:Bool = false;
	public static var DZAllowed:Bool = false;
	public static var TestDomain:String = 'assets';
	public static var MainDomain:String = 'https://mirkomir.com';

	public static var LS:LoadingScreen;
	public static var DLS:DataLoadingScreen;

	private static var Rooms:Array<String> = ['forest', 'club_square', 'beach', 'square'];
	private var R:Int = Math.round(Math.random() * 3);

	public function new():Void
	{
		super();
        M = this;
		
		#if debug
		Debug = true;
		#end
		
        //изменить для лучшего разрешения игры
        scaleX = 1;
        scaleY = 1;
		
        Init();
	}
	
	private function Init():Void
	{
        LS = new LoadingScreen();
        LS.Background(Rooms[R]);
        addChild(LS);

        Config = new Map<String, Dynamic>();

        Config['host'] = 'connect.mirkomir.com';
        Config['webport'] = 80;
        Config['port'] = 9933;
        Config['useSSL'] = false;
        Config['zone'] = Debug ? 'mirkomirdebug' : 'mirkomir';
        Config['debug'] = Debug;

        if(Debug) 
            addChild(new FPS());

		SFS = new SmartFox();
        //SFS.debug = Debug;
        #if html5
        SFS.connect(Config['host'], Config['webport'], Config['useSSL']);
        #else
        SFS.connect(Config['host'], Config['port']);
        #end

        SFS.addEventListener(SFSEvent.LOGIN, Auth.Login);
        SFS.addEventListener(SFSEvent.CONNECTION, Auth.Connection);
        SFS.addEventListener(SFSEvent.LOGIN_ERROR, Auth.LoginError);
		
		SFS.addEventListener(SFSEvent.EXTENSION_RESPONSE, ExtensionResponse);

        //SFS.addEventListener(SFSEvent.ADMIN_MESSAGE, AdminMessage);
        //SFS.addEventListener(SFSEvent.MODERATOR_MESSAGE, AdminMessage);
        SFS.addEventListener(SFSEvent.CONNECTION_LOST, ConnectionLost);

        SFS.addEventListener(SFSBuddyEvent.BUDDY_LIST_INIT, BuddyListInit);

        /*SFS.addEventListener(SFSBuddyEvent.BUDDY_ERROR, BuddyError);
        SFS.addEventListener(SFSBuddyEvent.BUDDY_ADD, BuddyListUpdate);
        SFS.addEventListener(SFSBuddyEvent.BUDDY_BLOCK, BuddyListUpdate);
        SFS.addEventListener(SFSBuddyEvent.BUDDY_REMOVE, BuddyListUpdate);
        SFS.addEventListener(SFSBuddyEvent.BUDDY_VARIABLES_UPDATE, BuddyListUpdate);
        SFS.addEventListener(SFSBuddyEvent.BUDDY_ONLINE_STATE_UPDATE, BuddyOnline);*/

        SFS.addEventListener(SFSEvent.ROOM_JOIN, RoomJoin);
	}

	private function ExtensionResponse(e:SFSEvent):Void
	{
		var E:Dynamic;
		#if html5
			E = e;
		#else
			E = e.params;
		#end
		
        if (E.cmd == 'profile_info')
        {
			//TEMP
			var P:ProfileScreen = new ProfileScreen(E.params);
			addChild(P);
        }
	}
	
    private function BuddyListInit(e:SFSBuddyEvent):Void 
    {
        BuddyListInited = true;
        InitGame();
    }

   	private function RoomJoin(e:SFSEvent):Void
   	{
        addChildAt(GMScreen, 0);

		var E:Dynamic;
		#if html5
			E = e;
		#else
			E = e.params;
		#end
		
        var R:Room = E.room;
   		//trace('Joined room: ' + R.name);

        GMScreen.balancePanel.lblRegular.text = Std.string(SFS.mySelf.getVariable('balance_regular').getIntValue());
        GMScreen.balancePanel.lblDonate.text  = Std.string(SFS.mySelf.getVariable('balance_donate').getIntValue());
        GMScreen.locationPanel.lblName.text   = R.getVariable('name_ru').getStringValue();
		
        LS.Background(R.name);
        LS.Type(LoadingScreen.LOCATION, R.getVariable('name_ru').getStringValue());

   		var L:SWFLoader = new SWFLoader('/storage/' + R.getVariable('hash').getStringValue(), RoomLoad);
   	}

   	private function RoomLoad(E:Event):Void
   	{
        if(RoomScreen != null) {
            GMScreen.removeChild(RoomScreen);
            RoomScreen.Destroy();
            RoomScreen = null;
        }
        
   		RoomScreen = new Location(cast(E.target, LoaderInfo).content, SFS.lastJoinedRoom);
   		//addChild(cast(E.target, LoaderInfo).content);
   	}

    private function ConnectionLost(e:SFSEvent):Void
    {
		var E:Dynamic;
		#if html5
			E = e;
		#else
			E = e.params;
		#end
		
        trace('Connection lost: ' + E.reason);

        if(LS.OnScene)
            LS.Type(LoadingScreen.ERROR);
    }

    private function InitGame():Void
    {
        DZAllowed = (SFS.mySelf.privilegeId >= 2 && SO.data.ModMZ);

        GMScreen = new GameScreen();
        
        /* TODO:
        if (Main.sfs.mySelf.getVariable("bonus").getBoolValue() == true)
        {
            BonusScreenUtils.init();
        }*/
        
        
        var D:ISFSObject = new SFSObject();
        D.putUtfString('location', Rooms[R]);
        SFS.send(new ExtensionRequest('joinroom', D));

        //SFS.addEventListener(SFSEvent.EXTENSION_RESPONSE, sfsExtensionResponse);
        //SFS.send(new ExtensionRequest("friendlist.incoming_requests_count"));
    }
	
	public static function ShowDLS():Void
	{
		DLS = new DataLoadingScreen();
		//addChild(DLS);
	}
	public static function HideDLS():Void
	{
		//removeChild(DLS);
		DLS = null;
	}
}
