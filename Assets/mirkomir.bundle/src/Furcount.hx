package ; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class Furcount extends openfl.display.MovieClip {


	@:keep public var lblCount (default, null):openfl.text.TextField;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("vKnlfD2buAHmQZ5zUojz")) {

			SWFLite.instances.set ("vKnlfD2buAHmQZ5zUojz", SWFLite.unserialize (Assets.getText ("vKnlfD2buAHmQZ5zUojz")));

		}
		*/

		var swfLite = SWFLite.instances.get ("vKnlfD2buAHmQZ5zUojz");
		var symbol = swfLite.symbols.get (1161);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("Furcount") class Furcount extends openfl.display.MovieClip {


	@:keep public var lblCount (default, null):openfl.text.TextField;
	

	public function new () {

		super ();

	}


}
#end