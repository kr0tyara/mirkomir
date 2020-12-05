package mm.ui;

import haxe.crypto.*;
import motion.*;

import openfl.display.*;
import openfl.events.*;

import mm.SWFLoader;
import mm.entities.Wear;

import com.smartfoxserver.v2.entities.data.*;

class InventoryItem extends InventoryItemSwf
{
	public var L:SWFLoader;
	public var La:Label;
	public var DLA:DataLoadingAnim;
	public var WearF:Wear;
	
	public function new(Id):Void 
	{
		super();
		
		buttonMode = true;
		mouseChildren = false;
		gotoAndStop(1);
		
		DLA = new DataLoadingAnim();
		DLA.scaleX = 0.3;
		DLA.scaleY = 0.3;
		icon.addChild(DLA);
		
		L = new SWFLoader('gameres/ff07673105bd3e6790eaec3b1d9deb88/' + Md5.encode('wear_' + Std.string(Id)), IconLoaded, false);
		
		addEventListener(MouseEvent.MOUSE_OVER, MouseOver);
		addEventListener(MouseEvent.MOUSE_OUT,  MouseOut);
		addEventListener(MouseEvent.CLICK,      Click);
	}
	
	public function MouseOver(E:MouseEvent):Void
	{
		gotoAndStop('_over');
		
		La.alpha = 0;
		La.visible = true;
		
		Actuate.tween(La, .3, {
			alpha: 1
		});
	}
	public function MouseOut(E:MouseEvent):Void
	{
		gotoAndStop('_up');
		
		Actuate.tween(La, .3, {
			alpha: 0,
			visible: false
		});
	}
	public function Click(E:MouseEvent):Void
	{
		gotoAndStop('_down');
	}
	
	private function IconLoaded(E:Event):Void
	{
		WearF = new Wear(cast(E.target, LoaderInfo).content);
		icon.removeChild(DLA);
		icon.addChild(WearF.Icon);
		WearF.Icon.x = WearF.Icon.y = 0;
	}
}