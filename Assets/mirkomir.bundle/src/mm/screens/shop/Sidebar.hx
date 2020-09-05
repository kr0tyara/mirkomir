package mm.screens.shop; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class Sidebar extends openfl.display.MovieClip {


	@:keep public var btnNext (default, null):openfl.display.SimpleButton;
	@:keep public var btnPrev (default, null):openfl.display.SimpleButton;
	@:keep public var lblPage (default, null):openfl.text.TextField;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("dVxygrvB1tL7vIVXAgLn")) {

			SWFLite.instances.set ("dVxygrvB1tL7vIVXAgLn", SWFLite.unserialize (Assets.getText ("dVxygrvB1tL7vIVXAgLn")));

		}
		*/

		var swfLite = SWFLite.instances.get ("dVxygrvB1tL7vIVXAgLn");
		var symbol = swfLite.symbols.get (77);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("mm.screens.shop.Sidebar") class Sidebar extends openfl.display.MovieClip {


	@:keep public var btnNext (default, null):openfl.display.SimpleButton;
	@:keep public var btnPrev (default, null):openfl.display.SimpleButton;
	@:keep public var lblPage (default, null):openfl.text.TextField;
	

	public function new () {

		super ();

	}


}
#end