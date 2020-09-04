package mm.screens; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class SmScroll extends openfl.display.MovieClip {


	@:keep public var area (default, null):Fasfdsadf;
	@:keep public var up (default, null):openfl.display.SimpleButton;
	@:keep public var down (default, null):openfl.display.SimpleButton;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("vKnlfD2buAHmQZ5zUojz")) {

			SWFLite.instances.set ("vKnlfD2buAHmQZ5zUojz", SWFLite.unserialize (Assets.getText ("vKnlfD2buAHmQZ5zUojz")));

		}
		*/

		var swfLite = SWFLite.instances.get ("vKnlfD2buAHmQZ5zUojz");
		var symbol = swfLite.symbols.get (1088);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("mm.screens.SmScroll") class SmScroll extends openfl.display.MovieClip {


	@:keep public var area (default, null):Fasfdsadf;
	@:keep public var up (default, null):openfl.display.SimpleButton;
	@:keep public var down (default, null):openfl.display.SimpleButton;
	

	public function new () {

		super ();

	}


}
#end