package mm.screens.shop; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class Catalog extends openfl.display.MovieClip {


	@:keep public var field (default, null):openfl.display.MovieClip;
	@:keep public var loader (default, null):openfl.display.MovieClip;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("vKnlfD2buAHmQZ5zUojz")) {

			SWFLite.instances.set ("vKnlfD2buAHmQZ5zUojz", SWFLite.unserialize (Assets.getText ("vKnlfD2buAHmQZ5zUojz")));

		}
		*/

		var swfLite = SWFLite.instances.get ("vKnlfD2buAHmQZ5zUojz");
		var symbol = swfLite.symbols.get (114);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("mm.screens.shop.Catalog") class Catalog extends openfl.display.MovieClip {


	@:keep public var field (default, null):openfl.display.MovieClip;
	@:keep public var loader (default, null):openfl.display.MovieClip;
	

	public function new () {

		super ();

	}


}
#end