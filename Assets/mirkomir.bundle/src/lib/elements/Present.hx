package lib.elements; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class Present extends openfl.display.MovieClip {


	@:keep public var G (default, null):openfl.display.MovieClip;
	@:keep public var IsNew (default, null):NewIndicator;
	@:keep public var IsGift (default, null):openfl.display.MovieClip;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("vKnlfD2buAHmQZ5zUojz")) {

			SWFLite.instances.set ("vKnlfD2buAHmQZ5zUojz", SWFLite.unserialize (Assets.getText ("vKnlfD2buAHmQZ5zUojz")));

		}
		*/

		var swfLite = SWFLite.instances.get ("vKnlfD2buAHmQZ5zUojz");
		var symbol = swfLite.symbols.get (893);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("lib.elements.Present") class Present extends openfl.display.MovieClip {


	@:keep public var G (default, null):openfl.display.MovieClip;
	@:keep public var IsNew (default, null):NewIndicator;
	@:keep public var IsGift (default, null):openfl.display.MovieClip;
	

	public function new () {

		super ();

	}


}
#end