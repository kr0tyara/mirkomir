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
		if (!SWFLite.instances.exists ("dVxygrvB1tL7vIVXAgLn")) {

			SWFLite.instances.set ("dVxygrvB1tL7vIVXAgLn", SWFLite.unserialize (Assets.getText ("dVxygrvB1tL7vIVXAgLn")));

		}
		*/

		var swfLite = SWFLite.instances.get ("dVxygrvB1tL7vIVXAgLn");
		var symbol = swfLite.symbols.get (1357);

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