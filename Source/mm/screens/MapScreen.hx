package mm.screens;

import openfl.display.*;
import openfl.events.*;
import openfl.ui.*;

import motion.*;

import mm.*;

import com.smartfoxserver.v2.requests.*;
import com.smartfoxserver.v2.entities.*;
import com.smartfoxserver.v2.entities.data.*;

class MapScreen extends mm.screens.ScreenMapSwf {
	public function new():Void
	{
		super();

        overlay.addEventListener(MouseEvent.CLICK, Destroy);

        var DOHandler:DisplayObject;

        for (i in 0...screen.numChildren)
        {
        	DOHandler = screen.getChildAt(i);
            if (DOHandler.name.indexOf('bubble') != -1)
            {
                DOHandler.visible = false;
                cast(DOHandler, MovieClip).enabled = false;
            }

            if (DOHandler.name.indexOf('btn') != -1)
            {                
                DOHandler.addEventListener(MouseEvent.CLICK, BtnClick);
                DOHandler.addEventListener(MouseEvent.MOUSE_OVER, BtnOver);
                DOHandler.addEventListener(MouseEvent.MOUSE_OUT, BtnOut);
            }
        }
	}

    public function Destroy(E = null):Void
    {
		var DOHandler:DisplayObject;

        for (i in 0...screen.numChildren)
        {
        	DOHandler = screen.getChildAt(i);
            if (DOHandler.name.indexOf('btn') != -1)
            {                
                DOHandler.removeEventListener(MouseEvent.CLICK, BtnClick);
                DOHandler.removeEventListener(MouseEvent.MOUSE_OVER, BtnOver);
                DOHandler.removeEventListener(MouseEvent.MOUSE_OUT, BtnOut);
            }
        }
        
        overlay.removeEventListener(MouseEvent.CLICK, Destroy);
        Main.M.removeChild(this);
    }
    
    private function BtnClick(E:MouseEvent):Void
    {
		var DOHandler:DisplayObject = E.target;
        if (Main.SFS.lastJoinedRoom.name != DOHandler.name.substr(4))
        {
            var D:ISFSObject = new SFSObject();
            D.putUtfString('location', DOHandler.name.substr(4));
            Main.SFS.send(new ExtensionRequest('joinroom', D));
        }
        
        Destroy();
    }
    
    private function BtnOver(E:MouseEvent):Void
    {
		var DOHandler:DisplayObject = E.target;
        var Loc:String = DOHandler.name.substr(4);
        var Bubble:BubbleMap = cast(screen.getChildByName('bubble_' + Loc), BubbleMap);
        var R:Room = Main.SFS.roomManager.getRoomByName(Loc);
        
        Bubble.lblName.text = R.getVariable('name_ru').getStringValue();
        Bubble.lblCount.text = Std.string(R.userCount);
        
		Bubble.alpha = 0;
		Bubble.visible = true;

		Actuate.tween(Bubble, .3, {
			alpha: 1
		});
    }
    
    private function BtnOut(E:MouseEvent):Void
    {
		var DOHandler:DisplayObject = E.target;
        var Loc:String = DOHandler.name.substr(4);
        var Bubble:BubbleMap = cast(screen.getChildByName('bubble_' + Loc), BubbleMap);
        
		Actuate.tween(Bubble, .3, {
			alpha: 0,
			visible: false
		});
    }
}