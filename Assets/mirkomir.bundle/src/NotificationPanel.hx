package ; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class NotificationPanel extends openfl.display.MovieClip {


	@:keep public var Send (default, null):openfl.display.SimpleButton;
	@:keep public var I_3 (default, null):openfl.display.SimpleButton;
	@:keep public var I_2 (default, null):openfl.display.SimpleButton;
	@:keep public var txtHead (default, null):openfl.text.TextField;
	@:keep public var txtMessage (default, null):openfl.text.TextField;
	@:keep public var I_1 (default, null):openfl.display.SimpleButton;
	@:keep public var Recipient (default, null):openfl.display.MovieClip;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("vKnlfD2buAHmQZ5zUojz")) {

			SWFLite.instances.set ("vKnlfD2buAHmQZ5zUojz", SWFLite.unserialize (Assets.getText ("vKnlfD2buAHmQZ5zUojz")));

		}
		*/

		var swfLite = SWFLite.instances.get ("vKnlfD2buAHmQZ5zUojz");
		var symbol = swfLite.symbols.get (675);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("NotificationPanel") class NotificationPanel extends openfl.display.MovieClip {


	@:keep public var Send (default, null):openfl.display.SimpleButton;
	@:keep public var I_3 (default, null):openfl.display.SimpleButton;
	@:keep public var I_2 (default, null):openfl.display.SimpleButton;
	@:keep public var txtHead (default, null):openfl.text.TextField;
	@:keep public var txtMessage (default, null):openfl.text.TextField;
	@:keep public var I_1 (default, null):openfl.display.SimpleButton;
	@:keep public var Recipient (default, null):openfl.display.MovieClip;
	

	public function new () {

		super ();

	}


}
#end