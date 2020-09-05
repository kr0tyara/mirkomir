package mm.parties; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class Dialog extends openfl.display.MovieClip {


	@:keep public var Backrooms (default, null):openfl.display.MovieClip;
	@:keep public var Close (default, null):openfl.display.SimpleButton;
	@:keep public var First (default, null):openfl.display.MovieClip;
	@:keep public var Second (default, null):openfl.display.MovieClip;
	@:keep public var Dialogue (default, null):DialogueBubble;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("dVxygrvB1tL7vIVXAgLn")) {

			SWFLite.instances.set ("dVxygrvB1tL7vIVXAgLn", SWFLite.unserialize (Assets.getText ("dVxygrvB1tL7vIVXAgLn")));

		}
		*/

		var swfLite = SWFLite.instances.get ("dVxygrvB1tL7vIVXAgLn");
		var symbol = swfLite.symbols.get (645);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("mm.parties.Dialog") class Dialog extends openfl.display.MovieClip {


	@:keep public var Backrooms (default, null):openfl.display.MovieClip;
	@:keep public var Close (default, null):openfl.display.SimpleButton;
	@:keep public var First (default, null):openfl.display.MovieClip;
	@:keep public var Second (default, null):openfl.display.MovieClip;
	@:keep public var Dialogue (default, null):DialogueBubble;
	

	public function new () {

		super ();

	}


}
#end