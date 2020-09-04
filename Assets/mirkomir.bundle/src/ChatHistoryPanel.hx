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
		if (!SWFLite.instances.exists ("vKnlfD2buAHmQZ5zUojz")) {

			SWFLite.instances.set ("vKnlfD2buAHmQZ5zUojz", SWFLite.unserialize (Assets.getText ("vKnlfD2buAHmQZ5zUojz")));

		}
		*/

		var swfLite = SWFLite.instances.get ("vKnlfD2buAHmQZ5zUojz");
		var symbol = swfLite.symbols.get (1083);

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