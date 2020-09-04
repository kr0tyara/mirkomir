package ; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class ChatPanelMinimised extends openfl.display.MovieClip {


	@:keep public var btnVolume (default, null):BtnRight3;
	@:keep public var btnSmiles (default, null):openfl.display.SimpleButton;
	@:keep public var btnChatHistory (default, null):openfl.display.SimpleButton;
	@:keep public var btnChat (default, null):openfl.display.SimpleButton;
	@:keep public var txtChat (default, null):openfl.text.TextField;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("vKnlfD2buAHmQZ5zUojz")) {

			SWFLite.instances.set ("vKnlfD2buAHmQZ5zUojz", SWFLite.unserialize (Assets.getText ("vKnlfD2buAHmQZ5zUojz")));

		}
		*/

		var swfLite = SWFLite.instances.get ("vKnlfD2buAHmQZ5zUojz");
		var symbol = swfLite.symbols.get (995);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("ChatPanelMinimised") class ChatPanelMinimised extends openfl.display.MovieClip {


	@:keep public var btnVolume (default, null):BtnRight3;
	@:keep public var btnSmiles (default, null):openfl.display.SimpleButton;
	@:keep public var btnChatHistory (default, null):openfl.display.SimpleButton;
	@:keep public var btnChat (default, null):openfl.display.SimpleButton;
	@:keep public var txtChat (default, null):openfl.text.TextField;
	

	public function new () {

		super ();

	}


}
#end