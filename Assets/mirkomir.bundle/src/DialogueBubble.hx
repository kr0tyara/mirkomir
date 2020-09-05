package ; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class DialogueBubble extends openfl.display.MovieClip {


	@:keep public var Bubble (default, null):openfl.display.MovieClip;
	@:keep public var Txt (default, null):openfl.text.TextField;
	@:keep public var TwoTxt (default, null):openfl.text.TextField;
	@:keep public var Next (default, null):openfl.display.SimpleButton;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("dVxygrvB1tL7vIVXAgLn")) {

			SWFLite.instances.set ("dVxygrvB1tL7vIVXAgLn", SWFLite.unserialize (Assets.getText ("dVxygrvB1tL7vIVXAgLn")));

		}
		*/

		var swfLite = SWFLite.instances.get ("dVxygrvB1tL7vIVXAgLn");
		var symbol = swfLite.symbols.get (644);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("DialogueBubble") class DialogueBubble extends openfl.display.MovieClip {


	@:keep public var Bubble (default, null):openfl.display.MovieClip;
	@:keep public var Txt (default, null):openfl.text.TextField;
	@:keep public var TwoTxt (default, null):openfl.text.TextField;
	@:keep public var Next (default, null):openfl.display.SimpleButton;
	

	public function new () {

		super ();

	}


}
#end