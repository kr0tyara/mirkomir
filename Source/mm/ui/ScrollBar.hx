package mm.ui;

import openfl.display.*;
import openfl.events.*;
import motion.*;
import mm.*;

class ScrollBar extends MovieClip
{
	private var Field:Dynamic;
	private var Scrolls:mm.ui.ScrollBarSwf;
	
	private var Step:Int;
    private var GoStep:Int;
	private var SizeModifier:Int;
	
	private var FieldLength:Float;
	private var ContentSize:Float;
	private var MaskSize:Float;
	private var TrackSize:Float;
	
	private var AddStep:Bool;
	private var Horizontal:Bool;
    
    private function set_SliderSize(S:Float):Float
    {
		return (Horizontal ? Scrolls.area.slider.width : Scrolls.area.slider.height) = S;
    }
    private function set_SliderPos(Pos:Float):Float
    {
		return (Horizontal ? Scrolls.area.slider.x : Scrolls.area.slider.y) = Pos;
    }
    private function set_ContentPos(Pos:Float):Float
    {
        return (Horizontal ? Field.content.x : Field.content.y) = Pos;
    }
	
	private var SliderSize(get, set):Float;
    private var ContentPos(get, set):Float;
    private var SliderPos(get, set):Float;
	
	public function new(SB:mm.ui.ScrollBarSwf, F:Dynamic, S:Int, SM:Int, AS:Bool = false, H:Bool = false):Void
	{
		super();
		
		Field = F;
		Scrolls = SB;
		SizeModifier = SM;
		AddStep = AS;
		Horizontal = H;
        
        if (H)
        {
            ContentSize = F.content.width;
            MaskSize = F.msk.width;
            TrackSize = Scrolls.area.track.width;
        }
        else
        {
            ContentSize = F.content.height;
            MaskSize = F.msk.height;
            TrackSize = Scrolls.area.track.height;
        }
		
        FieldLength = -(ContentSize - MaskSize - SizeModifier);
		Step = (S != 0 ? S : cast((-FieldLength) / 10, Int));
        
        if (-ContentSize + MaskSize < 0)
            Init();
	}
	
    private function get_SliderSize():Float
    {        
        return (Horizontal ? Scrolls.area.slider.width : Scrolls.area.slider.height);
    }
    private function get_SliderPos():Float
    {
        return (Horizontal ? Scrolls.area.slider.x : Scrolls.area.slider.y);
    }
    private function get_ContentPos():Float
    {
		return (Horizontal ? Field.content.x : Field.content.y);
    }
    
    public function Destroy():Void
    {
        Scrolls.down.removeEventListener(MouseEvent.CLICK, DownClick);
        Scrolls.up.removeEventListener(MouseEvent.CLICK, UpClick);
        removeEventListener(MouseEvent.MOUSE_WHEEL, MouseWheel);
        Scrolls.area.slider.removeEventListener(MouseEvent.MOUSE_DOWN, SliderMouseDown);
        Field.removeEventListener(MouseEvent.MOUSE_WHEEL, MouseWheel);
    }
    
    private function Init():Void
    {
        Scrolls.down.useHandCursor = false;
        Scrolls.up.useHandCursor = false;
        
        Scrolls.area.slider.stop();
        Scrolls.area.slider.buttonMode = true;
        Scrolls.area.slider.useHandCursor = false;
        
        Scrolls.down.addEventListener(MouseEvent.CLICK, DownClick);
        Scrolls.up.addEventListener(MouseEvent.CLICK, UpClick);
        addEventListener(MouseEvent.MOUSE_WHEEL, MouseWheel);
        Field.addEventListener(MouseEvent.MOUSE_WHEEL, MouseWheel);
        Scrolls.area.slider.addEventListener(MouseEvent.MOUSE_DOWN, SliderMouseDown);
                
        if (FieldLength >= 0)
            SliderSize = TrackSize;
        else
        {
            SliderSize = (MaskSize / (ContentSize - SizeModifier)) * TrackSize;
            
            if (SliderSize < 20)
                SliderSize = 20;
        }
        
        TrackLength = TrackSize - SliderSize;
        
        GoStep = ContentPos;
        
        if (AddStep)
            GoStep -= Step;
        
        SliderPos = (GoStep * (TrackLength)) / (FieldLength);
    }
    
    private function DownClick(E:MouseEvent):Void
    {
        GoStep -= Step;
        Scroll();
    }
    
    private function UpClick(E:MouseEvent):Void
    {
        GoStep += Step;
        Scroll();
    }
    
    private function MouseWheel(E:MouseEvent):Void
    {
        if (E.delta > 0)
        {
			GoStep += Step;
			Scroll();
        }
        else
        {
			GoStep -= Step;
			Scroll();
        }
    }
    
    private function SliderMouseDown(E:MouseEvent):Void
    {
        var Bounds:Rectangle;
		
        if (Horizontal)
            Bounds = new Rectangle(0, 0, TrackLength, 0);
        else
            Bounds = new Rectangle(0, 0, 0, TrackLength);
        
        Scrolls.area.slider.startDrag(false, Bounds);
        
        Main.M.mouseChildren = false;
        Main.M.addEventListener(MouseEvent.MOUSE_UP, ScrollSliderUp);
        Main.M.addEventListener(MouseEvent.MOUSE_MOVE, ScrollSliderMove);
        
    }
	
	private function ScrollSliderUp(E:MouseEvent):Void
	{
		Scrolls.area.slider.stopDrag();
		
		Main.M.mouseChildren = true;
		Main.M.removeEventListener(MouseEvent.MOUSE_UP, ScrollSliderUp);
		Main.M.removeEventListener(MouseEvent.MOUSE_MOVE, ScrollSliderMove);
	}
        
	private function ScrollSliderMove(E:MouseEvent):Void
	{
		ContentPos = FieldLength * (SliderPos / TrackLength);
		GoStep = ContentPos;
	}
    
    private function Scroll():Void
    {
        if (GoStep > 0)
            GoStep = 0;
        else if (GoStep < FieldLength)
            GoStep = FieldLength;
        
        var SliderGo:Float = (GoStep * (TrackLength)) / (FieldLength);
        
		if (Horizontal)
		{
			Actuate.tween(Field.content, .3, {
				x: GoStep
			});
				
			Actuate.tween(Scrolls.area.slider, .3, {
				y: SliderGo
			});
		}
		else
		{
			Actuate.tween(Field.content, .3, {
				y: GoStep
			});
				
			Actuate.tween(Scrolls.area.slider, .3, {
				y: SliderGo
			});
		}
    }
}