package mm.rooms;

import haxe.ds.*;

import openfl.display.*;
import openfl.events.*;
import openfl.geom.*;

import com.smartfoxserver.v2.*;
import com.smartfoxserver.v2.core.*;
import com.smartfoxserver.v2.entities.*;
import com.smartfoxserver.v2.entities.data.*;
import com.smartfoxserver.v2.entities.variables.*;
import com.smartfoxserver.v2.requests.buddylist.*;
import com.smartfoxserver.v2.requests.*;
import com.smartfoxserver.v2.util.*;

import motion.*;
import motion.easing.*;

import mm.*;
import mm.rooms.*;
import mm.entities.*;

class Location extends MovieClip
{
    public var MC:MovieClip;

    public var DynamicObjects:MovieClip;
    public var StaticObjects:MovieClip;
    public var MoveArea:MovieClip;

    public var R:Room;

    private var LocationObjects:Array<DisplayObject>;

	public function new(mc:DisplayObject, r:Room):Void
	{
		super();

        LocationObjects = new Array<DisplayObject>();
		MC = cast(mc, MovieClip);
		R = r;

        DynamicObjects = cast(MC.getChildByName('dynamicObjects'), MovieClip);
        StaticObjects = cast(MC.getChildByName('staticObjects'), MovieClip);
        MoveArea = cast(MC.getChildByName('moveArea'), MovieClip);

		//TODO
        Main.SFS.addEventListener(SFSEvent.USER_VARIABLES_UPDATE, UserVarsUpdate);
        Main.SFS.addEventListener(SFSEvent.USER_EXIT_ROOM, UserExitRoom);
        Main.SFS.addEventListener(SFSEvent.PUBLIC_MESSAGE, PublicMessage);

        MC.addEventListener(MouseEvent.MOUSE_DOWN, LocationMouseDown);
        MC.mouseChildren = true;
        DynamicObjects.mouseChildren = true;

        /*
		TODO
        Main.gameScreen.setSound(_room.getVariable('hash').getStringValue());
        */

        var Child:DisplayObject;
        var MCHandler:MovieClip;

        for(i in 0...DynamicObjects.numChildren) {
            Child = DynamicObjects.getChildAt(i);
            LocationObjects.push(Child);

            if (Child.name.indexOf('_dm') >= 0)
            {
                MCHandler = cast(Child, MovieClip);
                MCHandler.mouseEnabled = false;
            }
            if (Child.name.indexOf('gminfo') >= 0)
            {
                MCHandler = cast(Child, MovieClip);
                MCHandler.gotoAndStop(1);
                MCHandler.buttonMode = true;
            }
        }

        for(i in 0...StaticObjects.numChildren) {
            Child = StaticObjects.getChildAt(i);
            if (Child.name.indexOf('gm') >= 0)
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
        
        Main.GameScreen.addChildAt(MC, 0);
        Main.M.RemovePreloader();
	}

    public function Destroy() : Void
    {
        Main.SFS.removeEventListener(SFSEvent.USER_VARIABLES_UPDATE, UserVarsUpdate);
        Main.SFS.removeEventListener(SFSEvent.USER_EXIT_ROOM, UserExitRoom);
        Main.SFS.removeEventListener(SFSEvent.PUBLIC_MESSAGE, PublicMessage);
        
        MC.removeEventListener(MouseEvent.MOUSE_DOWN, LocationMouseDown);
        
        for (U in R.getUserList())
        {
            RemoveAvatar(GetAvatar(U.id));
        }
        //TODO
        //Main.GameScreen.destroySound();
        Main.GameScreen.removeChild(MC);
    }


	private function LocationMouseDown(E:MouseEvent):Void
	{
        var A : Avatar = GetAvatar(Main.SFS.mySelf.id);
            
        var ClickPoint:Point = new Point(Math.round(E.stageX / Main.M.scaleX), Math.round(E.stageY / Main.M.scaleY));
        var StartPoint:Point = new Point(A.x, A.y);
        var GoPoint = MoveZone(ClickPoint, StartPoint);
            
        SetPosition(Math.round(GoPoint.x), Math.round(GoPoint.y));
	}

    private function MoveZone(Pos:Point, stP:Point):Point
    {
        var StartPoint:Point = new Point(Math.round(stP.x), Math.round(stP.y));
        var Dist:Float = Math.round(Point.distance(Pos, StartPoint));
        var xx:Float = (Pos.x - StartPoint.x) / Dist;
        var yy:Float = (Pos.y - StartPoint.y) / Dist;
        var EndPoint : Point = StartPoint.clone();

        var i = Dist;
        while (i > 0)
        {
            var yy2:Float = EndPoint.y + yy;
            var xx2:Float = EndPoint.x + xx;
            if (!MoveArea.hitTestPoint(Math.round(xx2), Math.round(yy2), true) && !Main.DZAllowed)
                break;

            EndPoint.x = xx2;
            EndPoint.y = yy2;
            i--;
        }
        
        EndPoint.x = Math.round(EndPoint.x);
        EndPoint.y = Math.round(EndPoint.y);

        return EndPoint;
    }

    private function SetPosition(x:Int, y:Int):Void
    {
        var Vars:Array<SFSUserVariable> = [];
        Vars.push(new SFSUserVariable('pos_x', x));
        Vars.push(new SFSUserVariable('pos_y', y));
        Main.SFS.send(new SetUserVariablesRequest(Vars));
    }

    private function PublicMessage(E:SFSEvent):Void
    {
        trace(E.sender.name + ': ' + E.message);

        var A:Avatar = GetAvatar(E.sender.id);
            
        if (A == null)
            return;
        if (E.message.indexOf('#BUBBLE#::') >= 0)
            A.SetBubble(E.message.substr(10), true);
        else
            A.SetBubble(E.message);
            //TODO
            //Main.gameScreen.chpAddMessage(E.sender.name, E.messages);
    }

    private function UserVarsUpdate(E:SFSEvent):Void
    {
        var U:User = cast(E.user, User);

        if(GetAvatar(U.id) == null) {
            if (U.isJoinedInRoom(R))
            {
                CreateAvatar(U);
            }
        }
        else
        {
            var A:Avatar = GetAvatar(U.id);
            //TODO: wear, state, invisible

            if (Lambda.indexOf(E.changedVars, 'pos_x') != -1 || Lambda.indexOf(E.changedVars, 'pos_x') != -1 || Lambda.indexOf(E.changedVars, 'dir') != -1)
            {
                var px:Int = U.getVariable('pos_x').getIntValue();
                var py:Int = U.getVariable('pos_y').getIntValue();
                var Dir:String = U.getVariable('dir').getStringValue();
                
                MoveAvatar(A, px, py, Dir, U.isItMe);
            }

            if (Lambda.indexOf(E.changedVars, 'balance_regular') != -1 && U.isItMe)
                Main.GameScreen.balancePanel.lblRegular.text = Std.string(Main.SFS.mySelf.getVariable('balance_regular').getIntValue());

            if (Lambda.indexOf(E.changedVars, 'balance_donate') != -1 && U.isItMe)
                Main.GameScreen.balancePanel.lblDonate.text  = Std.string(Main.SFS.mySelf.getVariable('balance_donate').getIntValue());

        }
    }

    private function UserExitRoom(E:SFSEvent):Void
    {
        if (E.room == R)
        {            
            if (!E.user.isItMe)
            {
                var A:Avatar = GetAvatar(E.user.id);
                
                if (A != null)
                {
                    RemoveAvatar(A);
                }
            }
            else
            {
                Destroy();
            }
        }
    }

    private function MoveAvatar(A:Avatar, px:Int, py:Int, Dir:String, IsItMe:Bool)
    {
        if (A.x == px && A.y == py)
            A.SetDirection(Dir);
        else {
            if (IsItMe && Main.SFS.mySelf.privilegeId < 2)
            {
                if (MoveArea.x != 0 || MoveArea.y != 0 || !MoveArea.hitTestPoint(px, py, true))
                {
                    Main.SFS.send(new ExtensionRequest('ban'));
                }
            }
            
            var NDir:String = GetAvatarDirection(A, px, py);
            A.SetDirection(NDir);
                        
            var Speed:Float = 150;
            var StartPoint:Point = new Point(A.x, A.y);
            var EndPoint:Point = new Point(px, py);
            var Dis:Float = Point.distance(StartPoint, EndPoint);
            var Time = Dis / Speed;
            

            Actuate.tween(A, Time, {
                x: px,
                y: py
            }).ease(Cubic.easeOut).onUpdate(Arrange).onComplete(TweenFinish, [A, Dir, IsItMe]);
        }
    }

    private function TweenFinish(A:Avatar, Dir:String, IsItMe:Bool):Void
    {
        if(IsItMe) {
            A.SetDirection(Dir);

            var DO:DisplayObject;
            for (i in 0...StaticObjects.numChildren)
            {
                DO = StaticObjects.getChildAt(i);

                if (DO.name.indexOf('pt_') != -1 && DO.hitTestPoint(A.x, A.y, true))
                {
                    Main.SFS.removeEventListener(SFSEvent.USER_VARIABLES_UPDATE, UserVarsUpdate);
                    MC.removeEventListener(MouseEvent.MOUSE_DOWN, LocationMouseDown);
                            
                    var D:ISFSObject = new SFSObject();
                    D.putInt('pointer_id', Std.parseInt(DO.name.substr(3)));
                    Main.SFS.send(new ExtensionRequest('joinroom', D));
                }
            }
        }
    }

	private function LocationMouseMove(E:MouseEvent):Void
	{
        var A:Avatar = GetAvatar(Main.SFS.mySelf.id);
        
        var Dir:String = GetAvatarDirection(A, E.stageX / Main.M.scaleX, E.stageY / Main.M.scaleY);
        
        if (Main.SFS.mySelf.getVariable('dir').getStringValue() != Dir)
            SetDirection(Dir);
	}

    private function SetDirection(Dir:String):Void
    {
        var D:ISFSObject = new SFSObject();
        D.putUtfString('dir', Dir);
        Main.SFS.send(new ExtensionRequest('uservars_set.direction', D));
    }

	private function AvatarClick(E:MouseEvent):Void
	{
        var D:ISFSObject = new SFSObject();
        D.putUtfString('name', cast(cast(E.target, MovieClip).parent, Avatar).lblName.text);
        Main.SFS.send(new ExtensionRequest('profile', D));
        
        trace('Профиль', cast(cast(E.target, MovieClip).parent, Avatar).lblName.text);
	}

	private function GetAvatar(Id:Int):Avatar
	{
		return cast(DynamicObjects.getChildByName('avt_' + Std.string(Id)), Avatar);
	}

    private function RemoveAvatar(A:Avatar):Void
    {
        var i:Int = Lambda.indexOf(LocationObjects, A);
        LocationObjects.splice(i, 1);
        DynamicObjects.removeChild(A);

    }
	private function CreateAvatar(U:User):Void
	{
		if (U.containsVariable('pos_x') && U.containsVariable('pos_y'))
        {
            var A:Avatar = new Avatar(U, R.getVariable('scale').getIntValue());
            
            A.x = U.getVariable('pos_x').getIntValue();
            A.y = U.getVariable('pos_y').getIntValue();
            
            if (!U.isItMe)
            {
                A.mouseEnabled = false;
                A.mouseChildren = true;
                A.lblName.mouseEnabled = false;
                A.bubble.mouseEnabled = false;
                A.badge.mouseEnabled = false;
                
                A.avatar.mouseEnabled = true;
                A.avatar.mouseChildren = false;
                
                A.avatar.addEventListener(MouseEvent.CLICK, AvatarClick);
            }
            else
            {
                A.mouseEnabled = false;
                A.mouseChildren = false;
                
                //TODO
                MC.addEventListener(MouseEvent.MOUSE_MOVE, LocationMouseMove);
            }
            
            /*TODO
            var invis : Bool = false;
            
            if (user.containsVariable('invisible'))
            {
                invis = user.getVariable('invisible').getBoolValue();
            }
            
            setInvis(avatar, invis, false);
            
            if (user.containsVariable('state'))
            {
                avatar.state = user.getVariable('state').getStringValue();
            }*/
            
            LocationObjects.push(A);
            DynamicObjects.addChild(A);
			Arrange();
        }

	}

	private function Arrange():Void
	{
        ArraySort.sort(LocationObjects, (x, y) -> Math.round(x.y - y.y));
        
        var i:Int = LocationObjects.length;
        
        while (i-- >= 0)
        {
            if (DynamicObjects.getChildIndex(LocationObjects[i]) != i)
                DynamicObjects.setChildIndex(LocationObjects[i], i);
        }

	}

    private function GetAvatarDirection(A:Avatar, px:Float, py:Float):String
    {
        var Dir:String;
        var DistX:Float;
        var DistY:Float;
        var Calc:Float;
        
        DistX = px - A.x;
        DistY = py - A.y;
        
        Calc = Math.atan2(-DistY, DistX);
        
        if (Calc > -7 * Math.PI / 8 && Calc <= -5 * Math.PI / 8)
        {
            Dir = 'SW';
        }
        else if (Calc > -5 * Math.PI / 8 && Calc <= -3 * Math.PI / 8)
        {
            Dir = 'S';
        }
        else if (Calc > -3 * Math.PI / 8 && Calc <= (-Math.PI) / 8)
        {
            Dir = 'SE';
        }
        else if (Calc > (-Math.PI) / 8 && Calc <= Math.PI / 8)
        {
            Dir = 'E';
        }
        else if (Calc > Math.PI / 8 && Calc <= 3 * Math.PI / 8)
        {
            Dir = 'NE';
        }
        else if (Calc > 3 * Math.PI / 8 && Calc <= 5 * Math.PI / 8)
        {
            Dir = 'N';
        }
        else if (Calc > 5 * Math.PI / 8 && Calc <= 7 * Math.PI / 8)
        {
            Dir = 'NW';
        }
        else
        {
            Dir = 'W';
        }
        
        return Dir;
    }

}