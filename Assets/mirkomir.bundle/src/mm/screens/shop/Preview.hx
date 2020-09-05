package mm.screens.shop; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class Preview extends openfl.display.MovieClip {


	@:keep public var btnNext (default, null):openfl.display.SimpleButton;
	@:keep public var btnPrev (default, null):openfl.display.SimpleButton;
	@:keep public var showcase (default, null):openfl.display.MovieClip;
	@:keep public var info (default, null):openfl.display.MovieClip;
	@:keep public var desc (default, null):openfl.display.MovieClip;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("dVxygrvB1tL7vIVXAgLn")) {

			SWFLite.instances.set ("dVxygrvB1tL7vIVXAgLn", SWFLite.unserialize (Assets.getText ("dVxygrvB1tL7vIVXAgLn")));

		}
		*/

		var swfLite = SWFLite.instances.get ("dVxygrvB1tL7vIVXAgLn");
		var symbol = swfLite.symbols.get (64);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("mm.screens.shop.Preview") class Preview extends openfl.display.MovieClip {


	@:keep public var btnNext (default, null):openfl.display.SimpleButton;
	@:keep public var btnPrev (default, null):openfl.display.SimpleButton;
	@:keep public var showcase (default, null):openfl.display.MovieClip;
	@:keep public var info (default, null):openfl.display.MovieClip;
	@:keep public var desc (default, null):openfl.display.MovieClip;
	

	public function new () {

		super ();

	}


}
#end