package ; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class ListPanel extends openfl.display.MovieClip {


	@:keep public var btnHelp (default, null):openfl.display.SimpleButton;
	@:keep public var btnFullScreen (default, null):openfl.display.SimpleButton;
	@:keep public var btnRating (default, null):openfl.display.SimpleButton;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("vKnlfD2buAHmQZ5zUojz")) {

			SWFLite.instances.set ("vKnlfD2buAHmQZ5zUojz", SWFLite.unserialize (Assets.getText ("vKnlfD2buAHmQZ5zUojz")));

		}
		*/

		var swfLite = SWFLite.instances.get ("vKnlfD2buAHmQZ5zUojz");
		var symbol = swfLite.symbols.get (1059);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("ListPanel") class ListPanel extends openfl.display.MovieClip {


	@:keep public var btnHelp (default, null):openfl.display.SimpleButton;
	@:keep public var btnFullScreen (default, null):openfl.display.SimpleButton;
	@:keep public var btnRating (default, null):openfl.display.SimpleButton;
	

	public function new () {

		super ();

	}


}
#end