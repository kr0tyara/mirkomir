package ; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class ChatHistoryPanel_scrollbar extends openfl.display.MovieClip {


	@:keep public var area (default, null):ChatHistoryPanel_area;
	@:keep public var up (default, null):openfl.display.SimpleButton;
	@:keep public var down (default, null):openfl.display.SimpleButton;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("dVxygrvB1tL7vIVXAgLn")) {

			SWFLite.instances.set ("dVxygrvB1tL7vIVXAgLn", SWFLite.unserialize (Assets.getText ("dVxygrvB1tL7vIVXAgLn")));

		}
		*/

		var swfLite = SWFLite.instances.get ("dVxygrvB1tL7vIVXAgLn");
		var symbol = swfLite.symbols.get (1083);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("ChatHistoryPanel_scrollbar") class ChatHistoryPanel_scrollbar extends openfl.display.MovieClip {


	@:keep public var area (default, null):ChatHistoryPanel_area;
	@:keep public var up (default, null):openfl.display.SimpleButton;
	@:keep public var down (default, null):openfl.display.SimpleButton;
	

	public function new () {

		super ();

	}


}
#end