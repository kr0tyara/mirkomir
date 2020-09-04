package ; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class DownPanels extends openfl.display.MovieClip {


	@:keep public var Line (default, null):openfl.display.MovieClip;
	@:keep public var Resize_Plus (default, null):openfl.display.SimpleButton;
	@:keep public var Resize_Minus (default, null):openfl.display.MovieClip;
	@:keep public var SetEmotion (default, null):openfl.display.MovieClip;
	@:keep public var Rotate (default, null):openfl.display.SimpleButton;
	@:keep public var Remove (default, null):openfl.display.SimpleButton;
	@:keep public var smilesPanel (default, null):SmilesPanel;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("vKnlfD2buAHmQZ5zUojz")) {

			SWFLite.instances.set ("vKnlfD2buAHmQZ5zUojz", SWFLite.unserialize (Assets.getText ("vKnlfD2buAHmQZ5zUojz")));

		}
		*/

		var swfLite = SWFLite.instances.get ("vKnlfD2buAHmQZ5zUojz");
		var symbol = swfLite.symbols.get (1356);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("DownPanels") class DownPanels extends openfl.display.MovieClip {


	@:keep public var Line (default, null):openfl.display.MovieClip;
	@:keep public var Resize_Plus (default, null):openfl.display.SimpleButton;
	@:keep public var Resize_Minus (default, null):openfl.display.MovieClip;
	@:keep public var SetEmotion (default, null):openfl.display.MovieClip;
	@:keep public var Rotate (default, null):openfl.display.SimpleButton;
	@:keep public var Remove (default, null):openfl.display.SimpleButton;
	@:keep public var smilesPanel (default, null):SmilesPanel;
	

	public function new () {

		super ();

	}


}
#end