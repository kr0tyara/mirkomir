package ; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class Slider extends openfl.display.MovieClip {


	@:keep public var sliderArea (default, null):openfl.display.MovieClip;
	@:keep public var slider (default, null):mirkomir_fla.Slider_166;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("vKnlfD2buAHmQZ5zUojz")) {

			SWFLite.instances.set ("vKnlfD2buAHmQZ5zUojz", SWFLite.unserialize (Assets.getText ("vKnlfD2buAHmQZ5zUojz")));

		}
		*/

		var swfLite = SWFLite.instances.get ("vKnlfD2buAHmQZ5zUojz");
		var symbol = swfLite.symbols.get (1066);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("Slider") class Slider extends openfl.display.MovieClip {


	@:keep public var sliderArea (default, null):openfl.display.MovieClip;
	@:keep public var slider (default, null):mirkomir_fla.Slider_166;
	

	public function new () {

		super ();

	}


}
#end