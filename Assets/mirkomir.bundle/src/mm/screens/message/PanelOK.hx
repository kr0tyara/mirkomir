package mm.screens.message; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class PanelOK extends openfl.display.MovieClip {


	@:keep public var btnOk (default, null):openfl.display.SimpleButton;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("dVxygrvB1tL7vIVXAgLn")) {

			SWFLite.instances.set ("dVxygrvB1tL7vIVXAgLn", SWFLite.unserialize (Assets.getText ("dVxygrvB1tL7vIVXAgLn")));

		}
		*/

		var swfLite = SWFLite.instances.get ("dVxygrvB1tL7vIVXAgLn");
		var symbol = swfLite.symbols.get (727);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("mm.screens.message.PanelOK") class PanelOK extends openfl.display.MovieClip {


	@:keep public var btnOk (default, null):openfl.display.SimpleButton;
	

	public function new () {

		super ();

	}


}
#end