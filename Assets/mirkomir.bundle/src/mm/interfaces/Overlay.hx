package mm.interfaces; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.SimpleButton;
import openfl.utils.Assets;


class Overlay extends openfl.display.SimpleButton {


	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("vKnlfD2buAHmQZ5zUojz")) {

			SWFLite.instances.set ("vKnlfD2buAHmQZ5zUojz", SWFLite.unserialize (Assets.getText ("vKnlfD2buAHmQZ5zUojz")));

		}
		*/

		var swfLite = SWFLite.instances.get ("vKnlfD2buAHmQZ5zUojz");
		var symbol = swfLite.symbols.get (4);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("mm.interfaces.Overlay") class Overlay extends openfl.display.SimpleButton {


	public function new () {

		super ();

	}


}
#end