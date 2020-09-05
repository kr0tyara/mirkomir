package ; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class ChatHistoryPanel extends openfl.display.MovieClip {


	@:keep public var lblEmpty (default, null):openfl.text.TextField;
	@:keep public var field (default, null):HistoryPanel;
	@:keep public var scrollbar (default, null):ChatHistoryPanel_scrollbar;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("dVxygrvB1tL7vIVXAgLn")) {

			SWFLite.instances.set ("dVxygrvB1tL7vIVXAgLn", SWFLite.unserialize (Assets.getText ("dVxygrvB1tL7vIVXAgLn")));

		}
		*/

		var swfLite = SWFLite.instances.get ("dVxygrvB1tL7vIVXAgLn");
		var symbol = swfLite.symbols.get (1084);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("ChatHistoryPanel") class ChatHistoryPanel extends openfl.display.MovieClip {


	@:keep public var lblEmpty (default, null):openfl.text.TextField;
	@:keep public var field (default, null):HistoryPanel;
	@:keep public var scrollbar (default, null):ChatHistoryPanel_scrollbar;
	

	public function new () {

		super ();

	}


}
#end