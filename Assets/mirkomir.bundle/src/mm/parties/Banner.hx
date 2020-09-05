package mm.parties; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class Banner extends openfl.display.MovieClip {


	@:keep public var Close (default, null):openfl.display.SimpleButton;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("dVxygrvB1tL7vIVXAgLn")) {

			SWFLite.instances.set ("dVxygrvB1tL7vIVXAgLn", SWFLite.unserialize (Assets.getText ("dVxygrvB1tL7vIVXAgLn")));

		}
		*/

		var swfLite = SWFLite.instances.get ("dVxygrvB1tL7vIVXAgLn");
		var symbol = swfLite.symbols.get (448);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("mm.parties.Banner") class Banner extends openfl.display.MovieClip {


	@:keep public var Close (default, null):openfl.display.SimpleButton;
	

	public function new () {

		super ();

	}


}
#end