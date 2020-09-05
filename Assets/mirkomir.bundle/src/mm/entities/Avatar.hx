package mm.entities; #if !flash

import openfl._internal.formats.swf.SWFLite;
import openfl.utils.Assets;
import openfl.geom.*;
import openfl.display.*;
import openfl.text.*;
import openfl.filters.*;
import openfl.events.*;

import motion.*;
import mm.*;
import mm.holders.*;

import haxe.crypto.*;

import com.smartfoxserver.v2.entities.*;
import com.smartfoxserver.v2.entities.data.*;

class Avatar extends openfl.display.MovieClip {


	@:keep public var avatar (default, null):Ava;
	@:keep public var lblName (default, null):openfl.text.TextField;
	@:keep public var bubble (default, null):mirkomir_fla.Bubble_94;
	@:keep public var badge (default, null):openfl.display.MovieClip;
	
	private var U:User;
	private var Dir:String;
	private var Color:String;
	private var Badge:Int;
	private var Scale:Float;

	private var R:Int = 0;
	private var G:Int = 0;
	private var B:Int = 0;
    private var rTact:Bool = false;
    private var gTact:Bool = false;
    private var bTact:Bool = false;

    private var Wear:ISFSObject;
    private var WearItems:Map<String, WearHolder>;

	public function new (u:User, scale:Int = 100) {

		super ();

		var swfLite = SWFLite.instances.get ("dVxygrvB1tL7vIVXAgLn");
		var symbol = swfLite.symbols.get (1319);

		__fromSymbol (swfLite, cast symbol);

		U = u;
		name = 'avt_' + Std.string(U.id);
        WearItems = new Map<String, WearHolder>();

		Color = U.getVariable('color').getStringValue();
		Wear = U.getVariable('wear').getSFSObjectValue();
		Dir = U.getVariable('dir').getStringValue();
		Badge = (U.containsVariable('badge') ? U.getVariable('badge').getIntValue() : 0);

		if(Color == 'rainbow')
            addEventListener(Event.ENTER_FRAME, ColorUpdate);

        lblName.autoSize = TextFieldAutoSize.CENTER;
        lblName.filters = [ new GlowFilter(0x000000, 1, 2, 2, 255, BitmapFilterQuality.HIGH, true, true) ];
		lblName.text = U.name;
        
        bubble.visible = false;
        
        Scale = scale / 100;
        scaleX = Scale;
        scaleY = Scale;
        
        if (Badge != 0)
        {
            badge.gotoAndStop(Badge);
            badge.x = -(this.lblName.width / 2) - 4;
            badge.visible = true;
        }

        SetWear(Wear.toObject());
        SetDirection(Dir);
	}

    public function SetWear(W:Dynamic):Void
    {
        var I:Int;
        var L:SWFLoader;

        for(i in 1...6) {
            I = W.get(Std.string(i));

            if(I != 0) {
                function WearLoaded(E:Event):Void
                {
                    Reflect.setField(WearItems, Std.string(i), new WearHolder(cast(E.target, LoaderInfo).content));
                    SetDirection();
                }

                L = new SWFLoader('gameres/ff07673105bd3e6790eaec3b1d9deb88/' + Md5.encode('wear_' + Std.string(I)), WearLoaded);
            }
        }
    }

	public function SetDirection(D:String = ''):Void
	{
        if(D != '')
            Dir = D;
        else
            D = Dir;

        avatar.gotoAndStop(D);
        
        var i:Int = 5;
        while (i > 0)
        {
            if (Reflect.field(WearItems, Std.string(i)) != null)
            {
                var MC:MovieClip = Reflect.field(WearItems, Std.string(i)).Wear;
                MC.gotoAndStop(D);
                this.avatar.addChild(MC);
            }

            i--;
        }
        
        var CTrans:ColorTransform;

        if(Color == 'rainbow')
			CTrans = new ColorTransform(1, 1, 1, 1, R, G, B, 1);
        else 
        {
        	CTrans = new ColorTransform();
       		CTrans.color = Std.parseInt(Color);
        }
        
        avatar.character.background.transform.colorTransform = CTrans;
	}


    public function SetBubble(Msg:String, FrameLabel:Bool = false, AutoRemove:Bool = true, Anim:Bool = true):Void
    {
        if (FrameLabel)
        {
            bubble.gotoAndStop(Msg);
            if (lblName.text == "Фенго" && bubble.Fengo != null)
            {
                bubble.Fengo.visible = true;
                bubble.Fengo.gotoAndStop(bubble.currentFrame - 2);
            }
            else if (bubble.Fengo != null)
                bubble.Fengo.visible = false;
        }
        else
        {
            var Format:TextFormat = new TextFormat();
            Format.color = 0x00042B;
            
            bubble.gotoAndStop(1);
            
            bubble.message.defaultTextFormat = Format;
            bubble.message.wordWrap = true;
            bubble.message.autoSize = TextFieldAutoSize.CENTER;
            bubble.message.text = Msg;
            
            bubble.background.height = bubble.message.height + 10;
            bubble.background.y = -bubble.background.height;
            bubble.message.y = bubble.background.y + 5;
        }
        
        bubble.y = -160;
        
        if (Anim)
        {
            bubble.alpha = 0;
            bubble.y = -140;
            bubble.visible = true;

            Actuate.tween(bubble, .3, {
                alpha: 1,
                y: -160
            });
        }
        else
        {
            bubble.alpha = 1;
            bubble.visible = true;
        }
        if (AutoRemove)
        {
            Actuate.tween(bubble, .3, {
                alpha: 0,
                visible: false
            }, false).delay(5.3);
        }
    }
    
	private function ColorUpdate(E:Event):Void
	{
        if (!rTact)
        {
            R++;
            if (R > 150)
                rTact = true;
        }
        else
        {
            R--;
            if (R < -150)
                rTact = false;
        }
        if (!gTact)
        {
            G++;
            if (G > 100)
                gTact = true;
        }
        else
        {
            G--;
            if (G < -100)
                gTact = false;
        }
        if (!bTact)
        {
            B++;
            if (R > 50)
                bTact = true;
        }
        else
        {
            B--;
            if (B < -50)
                bTact = false;
        }
        
        var CTrans:ColorTransform = new ColorTransform(1, 1, 1, 1, R, G, B, 1);
        avatar.character.background.transform.colorTransform = CTrans;
    }
}


#else
@:bind @:native("mm.entities.Avatar") class Avatar extends openfl.display.MovieClip {


	@:keep public var avatar (default, null):Ava;
	@:keep public var lblName (default, null):openfl.text.TextField;
	@:keep public var bubble (default, null):mirkomir_fla.Bubble_94;
	@:keep public var badge (default, null):openfl.display.MovieClip;
	

	public function new () {

		super ();

	}


}
#end