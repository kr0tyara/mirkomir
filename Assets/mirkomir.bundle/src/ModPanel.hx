package ; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class ModPanel extends openfl.display.MovieClip {


	@:keep public var txtResponse (default, null):openfl.text.TextField;
	@:keep public var lblTarget (default, null):openfl.text.TextField;
	@:keep public var txtTarget (default, null):openfl.text.TextField;
	@:keep public var txtReason (default, null):openfl.text.TextField;
	@:keep public var txtDay (default, null):openfl.text.TextField;
	@:keep public var txtHour (default, null):openfl.text.TextField;
	@:keep public var txtMinute (default, null):openfl.text.TextField;
	@:keep public var btnBanUser (default, null):openfl.display.SimpleButton;
	@:keep public var btnKickUser (default, null):openfl.display.SimpleButton;
	@:keep public var btnBanIP (default, null):openfl.display.SimpleButton;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("vKnlfD2buAHmQZ5zUojz")) {

			SWFLite.instances.set ("vKnlfD2buAHmQZ5zUojz", SWFLite.unserialize (Assets.getText ("vKnlfD2buAHmQZ5zUojz")));

		}
		*/

		var swfLite = SWFLite.instances.get ("vKnlfD2buAHmQZ5zUojz");
		var symbol = swfLite.symbols.get (707);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("ModPanel") class ModPanel extends openfl.display.MovieClip {


	@:keep public var txtResponse (default, null):openfl.text.TextField;
	@:keep public var lblTarget (default, null):openfl.text.TextField;
	@:keep public var txtTarget (default, null):openfl.text.TextField;
	@:keep public var txtReason (default, null):openfl.text.TextField;
	@:keep public var txtDay (default, null):openfl.text.TextField;
	@:keep public var txtHour (default, null):openfl.text.TextField;
	@:keep public var txtMinute (default, null):openfl.text.TextField;
	@:keep public var btnBanUser (default, null):openfl.display.SimpleButton;
	@:keep public var btnKickUser (default, null):openfl.display.SimpleButton;
	@:keep public var btnBanIP (default, null):openfl.display.SimpleButton;
	

	public function new () {

		super ();

	}


}
#end