package mm;

import com.smartfoxserver.v2.*;
import com.smartfoxserver.v2.core.*;
import com.smartfoxserver.v2.entities.*;
import com.smartfoxserver.v2.requests.*;
import com.smartfoxserver.v2.entities.data.*;
import com.smartfoxserver.v2.entities.variables.*;
import com.smartfoxserver.v2.requests.buddylist.*;

import haxe.Json;

import openfl.display.*;
import openfl.events.*;
import openfl.utils.*;
import openfl.ui.GameInput;
import openfl.net.*;

import mm.*;
import mm.screens.*;

class Auth
{    
    public function new()
    {
    }
    
    public static function Connection(e:SFSEvent):Void
    {
		var E:Dynamic;
		#if html5
			E = e;
		#else
			E = e.params;
		#end
        if (E.success)
        {
            trace('Connection Success!');
            
            var D:ISFSObject = new SFSObject();
            D.putUtfString('v', '0.9');
            D.putUtfString('v1', '0.89');
			
            if (Main.Debug)
                Main.SFS.send(new LoginRequest('Мила', 'vdVdVeojxFvkToIBJ2O9', Main.Config['zone'], D));
                //Main.SFS.send(new LoginRequest('Koca_ayi', '4b3opLtAlrtvKfpFqq1P', Main.Config['zone'], D));
            else
            {
                var ULoader:URLLoader = new URLLoader();
                var Vars:URLVariables = new URLVariables();
                var Req:URLRequest = new URLRequest('https://mirkomir.com/script/gettoken');  
                Req.method = URLRequestMethod.POST;
                Reflect.setField(Vars, '27e534fe98702739fc2d3b605ebadeaf', 1);
                Req.data = Vars;
                
                function Complete(E:Event):Void
                {
                    var Res = Json.parse(ULoader.data);
                    
                    if (Reflect.field(Res, 'username') != null && Reflect.field(Res, 'token') != null)
                    {
                        Main.SFS.send(new LoginRequest(Reflect.field(Res, 'username'), Reflect.field(Res, 'token'), Main.Config['zone'], D));
                    }
                    else
                    {
                        Main.SFS.disconnect();
                    }
                };

                ULoader.addEventListener(Event.COMPLETE, Complete);
                ULoader.load(Req);
            }
        }
        else
        {
            trace('Connection Failure: ' + E.errorMessage);

			if (Main.LS.OnScene)
				Main.LS.Type(LoadingScreen.OFFLINE);
        }
    }

    public static function Login(E:SFSEvent):Void
    {
        trace('You are logged in as ' + Main.SFS.mySelf.name);            
        Main.SFS.send(new InitBuddyListRequest());
    }
    
    public static function LoginError(E:SFSEvent) : Void
    {
        trace('Login error');

        if(Main.LS != null)
            Main.LS.Type(LoadingScreen.ERROR);
    }
}