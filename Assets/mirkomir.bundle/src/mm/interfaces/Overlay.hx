package mm.interfaces; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.SimpleButton;
import openfl.utils.Assets;


class Overlay extends openfl.display.SimpleButton {


	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("dVxygrvB1tL7vIVXAgLn")) {

			SWFLite.instances.set ("dVxygrvB1tL7vIVXAgLn", SWFLite.unserialize (Assets.getText ("dVxygrvB1tL7vIVXAgLn")));

		}
		*/

		var swfLite = SWFLite.instances.get ("dVxygrvB1tL7vIVXAgLn");
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