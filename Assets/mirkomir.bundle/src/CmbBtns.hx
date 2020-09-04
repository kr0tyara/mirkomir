package ; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class CmbBtns extends openfl.display.MovieClip {


	@:keep public var btn6 (default, null):openfl.display.SimpleButton;
	@:keep public var btn5 (default, null):openfl.display.SimpleButton;
	@:keep public var btn4 (default, null):openfl.display.SimpleButton;
	@:keep public var btn3 (default, null):openfl.display.SimpleButton;
	@:keep public var btn2 (default, null):openfl.display.SimpleButton;
	@:keep public var btn1 (default, null):openfl.display.SimpleButton;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("vKnlfD2buAHmQZ5zUojz")) {

			SWFLite.instances.set ("vKnlfD2buAHmQZ5zUojz", SWFLite.unserialize (Assets.getText ("vKnlfD2buAHmQZ5zUojz")));

		}
		*/

		var swfLite = SWFLite.instances.get ("vKnlfD2buAHmQZ5zUojz");
		var symbol = swfLite.symbols.get (341);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("CmbBtns") class CmbBtns extends openfl.display.MovieClip {


	@:keep public var btn6 (default, null):openfl.display.SimpleButton;
	@:keep public var btn5 (default, null):openfl.display.SimpleButton;
	@:keep public var btn4 (default, null):openfl.display.SimpleButton;
	@:keep public var btn3 (default, null):openfl.display.SimpleButton;
	@:keep public var btn2 (default, null):openfl.display.SimpleButton;
	@:keep public var btn1 (default, null):openfl.display.SimpleButton;
	

	public function new () {

		super ();

	}


}
#end