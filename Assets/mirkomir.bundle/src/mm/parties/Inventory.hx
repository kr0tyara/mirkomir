package mm.parties; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class Inventory extends openfl.display.MovieClip {


	@:keep public var Close (default, null):openfl.display.SimpleButton;
	@:keep public var Win (default, null):openfl.display.MovieClip;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("dVxygrvB1tL7vIVXAgLn")) {

			SWFLite.instances.set ("dVxygrvB1tL7vIVXAgLn", SWFLite.unserialize (Assets.getText ("dVxygrvB1tL7vIVXAgLn")));

		}
		*/

		var swfLite = SWFLite.instances.get ("dVxygrvB1tL7vIVXAgLn");
		var symbol = swfLite.symbols.get (424);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("mm.parties.Inventory") class Inventory extends openfl.display.MovieClip {


	@:keep public var Close (default, null):openfl.display.SimpleButton;
	@:keep public var Win (default, null):openfl.display.MovieClip;
	

	public function new () {

		super ();

	}


}
#end