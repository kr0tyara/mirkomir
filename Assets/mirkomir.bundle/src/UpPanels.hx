package ; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class UpPanels extends openfl.display.MovieClip {


	@:keep public var ArrangeSet (default, null):openfl.display.MovieClip;
	@:keep public var AddChar (default, null):openfl.display.SimpleButton;
	@:keep public var Save (default, null):openfl.display.SimpleButton;
	@:keep public var Close (default, null):openfl.display.SimpleButton;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("vKnlfD2buAHmQZ5zUojz")) {

			SWFLite.instances.set ("vKnlfD2buAHmQZ5zUojz", SWFLite.unserialize (Assets.getText ("vKnlfD2buAHmQZ5zUojz")));

		}
		*/

		var swfLite = SWFLite.instances.get ("vKnlfD2buAHmQZ5zUojz");
		var symbol = swfLite.symbols.get (1362);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("UpPanels") class UpPanels extends openfl.display.MovieClip {


	@:keep public var ArrangeSet (default, null):openfl.display.MovieClip;
	@:keep public var AddChar (default, null):openfl.display.SimpleButton;
	@:keep public var Save (default, null):openfl.display.SimpleButton;
	@:keep public var Close (default, null):openfl.display.SimpleButton;
	

	public function new () {

		super ();

	}


}
#end