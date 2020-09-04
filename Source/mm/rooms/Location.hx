package mm.rooms;

import openfl.display.*;
import openfl.events.*;

import com.smartfoxserver.v2.entities.*;

import mm.*;
import mm.rooms.*;

class Location extends MovieClip
{
    public var Loc:LocationSWF;
    public var R:Room;

	public function new(mc:DisplayObject, r:Room):Void
	{
		super();

		Loc = new LocationSWF(cast(mc, MovieClip));
		R = r;

		//TODO
        //Main.SFS.addEventListener(SFSEvent.USER_VARIABLES_UPDATE, UserVarsUpdate);
        //Main.SFS.addEventListener(SFSEvent.USER_EXIT_ROOM, UserExitRoom);
        //Main.SFS.addEventListener(SFSEvent.PUBLIC_MESSAGE, PublicMessage);

        //MC.addEventListener(MouseEvent.MOUSE_DOWN, LocationMouseDown);
        Loc.mouseChildren = true;
        Loc.dynamicObjects.mouseChildren = true;

        /*
		TODO
        Main.gameScreen.setSound(_room.getVariable("hash").getStringValue());
        */

        var Child:DisplayObject;
        var MCHandler:MovieClip;

        for(i in 0...Loc.dynamicObjects.numChildren) {
            Child = Loc.dynamicObjects.getChildAt(i);

            if (Child.name.indexOf("_dm") >= 0)
            {
                MCHandler = cast(Child, MovieClip);
                MCHandler.mouseEnabled = false;
            }
            if (Child.name.indexOf("gminfo") >= 0)
            {
                MCHandler = cast(Child, MovieClip);
                MCHandler.gotoAndStop(1);
                MCHandler.buttonMode = true;
            }
        }

        for(i in 0...Loc.staticObjects.numChildren) {
            Child = Loc.staticObjects.getChildAt(i);
            if (Child.name.indexOf("gm") >= 0)
            {
                MCHandler = cast(Child, MovieClip);
                MCHandler.gotoAndStop(1);
                MCHandler.buttonMode = true;
            }
        }

        for (U in R.getUserList())
        {
            CreateAvatar(U);
            trace(U.name);
        }

        Arrange();
        
        Main.GameScreen.addChildAt(mc, 0);
        Main.M.RemovePreloader();
	}

	private function CreateAvatar(U:User):Void
	{
		//TODO
	}

	private function Arrange():Void
	{
		//TODO
	}
}