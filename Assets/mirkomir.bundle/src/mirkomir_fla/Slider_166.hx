package mirkomir_fla; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class Slider_166 extends openfl.display.MovieClip {


	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("vKnlfD2buAHmQZ5zUojz")) {

			SWFLite.instances.set ("vKnlfD2buAHmQZ5zUojz", SWFLite.unserialize (Assets.getText ("vKnlfD2buAHmQZ5zUojz")));

		}
		*/

		var swfLite = SWFLite.instances.get ("vKnlfD2buAHmQZ5zUojz");
		var symbol = swfLite.symbols.get (1065);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("mirkomir_fla.Slider_166") class Slider_166 extends openfl.display.MovieClip {


	

	public function new () {

		super ();

	}


}
#end