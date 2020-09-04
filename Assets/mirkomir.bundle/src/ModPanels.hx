package ; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class ModPanels extends openfl.display.MovieClip {


	@:keep public var btnNotification (default, null):openfl.display.SimpleButton;
	@:keep public var btnInvisible (default, null):openfl.display.SimpleButton;
	@:keep public var btnMZ (default, null):openfl.display.SimpleButton;
	@:keep public var btnMod (default, null):openfl.display.SimpleButton;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("vKnlfD2buAHmQZ5zUojz")) {

			SWFLite.instances.set ("vKnlfD2buAHmQZ5zUojz", SWFLite.unserialize (Assets.getText ("vKnlfD2buAHmQZ5zUojz")));

		}
		*/

		var swfLite = SWFLite.instances.get ("vKnlfD2buAHmQZ5zUojz");
		var symbol = swfLite.symbols.get (1013);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("ModPanels") class ModPanels extends openfl.display.MovieClip {


	@:keep public var btnNotification (default, null):openfl.display.SimpleButton;
	@:keep public var btnInvisible (default, null):openfl.display.SimpleButton;
	@:keep public var btnMZ (default, null):openfl.display.SimpleButton;
	@:keep public var btnMod (default, null):openfl.display.SimpleButton;
	

	public function new () {

		super ();

	}


}
#end