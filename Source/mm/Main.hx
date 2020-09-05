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
    public static var GameScreen:GameScreen;
    
    public static var SO:SharedObject = SharedObject.getLocal('mirkomir');
    public static var Version:String = '1.0.0';

	//Debug
	public static var Debug:Bool = true;
	public static var DZAllowed:Bool = false;
	public static var TestDomain:String = 'assets/';
	public static var MainDomain:String = 'https://mirkomir.com/';

	public static var LS:LoadingScreen;

	private var Rooms:Array<String> = ['forest', 'square', 'club_square'];
	private var R:Int = Math.round(Math.random() * 2);

	public function new():Void
	{
		super();
        M = this;
        Init();

        scaleX = 1;
        scaleY = 1;
	}

	public function Init():Void
	{
        Preloader('Подключение к серверу...', false, Rooms[R]);

        Config = new Map<String, Dynamic>();

        Config['host'] = 'connect.mirkomir.com';
        Config['webport'] = 80;
        Config['port'] = 9933;
        Config['useSSL'] = false;
        Config['zone'] = Debug ? 'mirkomirdebug' : 'mirkomir';
        Config['debug'] = Debug;

        if(Debug) {
        	var F:FPS = new FPS();
        	addChild(F);
        }

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

    public function BuddyListInit(E:SFSBuddyEvent):Void 
    {
        BuddyListInited = true;
        InitGame();
    }

   	public function RoomJoin(E:SFSEvent):Void
   	{
        addChildAt(GameScreen, 0);

        var R:Room = E.room;
   		trace('Joined room: ' + R.name);

        GameScreen.balancePanel.lblRegular.text = Std.string(SFS.mySelf.getVariable('balance_regular').getIntValue());
        GameScreen.balancePanel.lblDonate.text  = Std.string(SFS.mySelf.getVariable('balance_donate').getIntValue());
        GameScreen.locationPanel.lblName.text  = R.getVariable('name_ru').getStringValue();

   		Preloader(R.getVariable('name_ru').getStringValue() + ' загружается...', true);
   		var L:SWFLoader = new SWFLoader('/storage/' + R.getVariable('hash').getStringValue(), RoomLoad);
   	}

   	public function RoomLoad(E:Event):Void
   	{
        if(RoomScreen != null) {
            Main.GameScreen.removeChild(RoomScreen);
            RoomScreen.Destroy();
            RoomScreen = null;
        }
        
   		RoomScreen = new Location(cast(E.target, LoaderInfo).content, SFS.lastJoinedRoom);
   		//addChild(cast(E.target, LoaderInfo).content);
   	}

    public function ConnectionLost(E:SFSEvent):Void
    {
        trace('Connection lost: ' + E.reason);
    }

    public function Preloader(Txt:String, ProgressBar:Bool, Background:String = 'map'):Void
    {
    	if(LS == null)
    	{
    	    LS = new LoadingScreen(Background);
	    	addChild(LS);
    	}
	    
	    LS.lblTarget.text = Txt;
	    LS.lblProgress.text = (ProgressBar ? '0%' : '');
    }
    public function RemovePreloader():Void
    {
    	removeChild(LS);
    	LS = null;
    }

    public function InitGame():Void
    {
    	trace('Init');

        GameScreen = new GameScreen();
        
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
}
