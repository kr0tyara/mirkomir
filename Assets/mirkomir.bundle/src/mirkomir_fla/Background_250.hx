package mirkomir_fla; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class Background_250 extends openfl.display.MovieClip {


	@:keep public var background (default, null):mirkomir_fla.LoadingScreenBackground_251;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("vKnlfD2buAHmQZ5zUojz")) {

			SWFLite.instances.set ("vKnlfD2buAHmQZ5zUojz", SWFLite.unserialize (Assets.getText ("vKnlfD2buAHmQZ5zUojz")));

		}
		*/

		var swfLite = SWFLite.instances.get ("vKnlfD2buAHmQZ5zUojz");
		var symbol = swfLite.symbols.get (805);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("mirkomir_fla.Background_250") class Background_250 extends openfl.display.MovieClip {


	@:keep public var background (default, null):mirkomir_fla.LoadingScreenBackground_251;
	

	public function new () {

		super ();

	}


}
#end