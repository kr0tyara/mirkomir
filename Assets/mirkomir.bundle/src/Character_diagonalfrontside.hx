package ; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class Character_diagonalfrontside extends openfl.display.MovieClip {


	@:keep public var background (default, null):openfl.display.MovieClip;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("vKnlfD2buAHmQZ5zUojz")) {

			SWFLite.instances.set ("vKnlfD2buAHmQZ5zUojz", SWFLite.unserialize (Assets.getText ("vKnlfD2buAHmQZ5zUojz")));

		}
		*/

		var swfLite = SWFLite.instances.get ("vKnlfD2buAHmQZ5zUojz");
		var symbol = swfLite.symbols.get (1268);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("Character_diagonalfrontside") class Character_diagonalfrontside extends openfl.display.MovieClip {


	@:keep public var background (default, null):openfl.display.MovieClip;
	

	public function new () {

		super ();

	}


}
#end