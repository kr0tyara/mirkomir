package ; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class ChatPanel extends openfl.display.MovieClip {


	@:keep public var btnSmiles (default, null):openfl.display.SimpleButton;
	@:keep public var btnList (default, null):openfl.display.SimpleButton;
	@:keep public var btnFriends (default, null):openfl.display.SimpleButton;
	@:keep public var btnHouse (default, null):BtnRight2;
	@:keep public var btnProfile (default, null):openfl.display.SimpleButton;
	@:keep public var btnVolume (default, null):BtnRight3;
	@:keep public var btnChatHistory (default, null):openfl.display.SimpleButton;
	@:keep public var btnChat (default, null):openfl.display.SimpleButton;
	@:keep public var txtChat (default, null):openfl.text.TextField;
	@:keep public var btnFriendsNotification (default, null):BtnLeft3_notification;
	@:keep public var counterValentine (default, null):BtnLeft3_notification;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("vKnlfD2buAHmQZ5zUojz")) {

			SWFLite.instances.set ("vKnlfD2buAHmQZ5zUojz", SWFLite.unserialize (Assets.getText ("vKnlfD2buAHmQZ5zUojz")));

		}
		*/

		var swfLite = SWFLite.instances.get ("vKnlfD2buAHmQZ5zUojz");
		var symbol = swfLite.symbols.get (1037);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("ChatPanel") class ChatPanel extends openfl.display.MovieClip {


	@:keep public var btnSmiles (default, null):openfl.display.SimpleButton;
	@:keep public var btnList (default, null):openfl.display.SimpleButton;
	@:keep public var btnFriends (default, null):openfl.display.SimpleButton;
	@:keep public var btnHouse (default, null):BtnRight2;
	@:keep public var btnProfile (default, null):openfl.display.SimpleButton;
	@:keep public var btnVolume (default, null):BtnRight3;
	@:keep public var btnChatHistory (default, null):openfl.display.SimpleButton;
	@:keep public var btnChat (default, null):openfl.display.SimpleButton;
	@:keep public var txtChat (default, null):openfl.text.TextField;
	@:keep public var btnFriendsNotification (default, null):BtnLeft3_notification;
	@:keep public var counterValentine (default, null):BtnLeft3_notification;
	

	public function new () {

		super ();

	}


}
#end