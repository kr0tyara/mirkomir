package mm.parties.games; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class Pot extends openfl.display.MovieClip {


	@:keep public var A4 (default, null):openfl.display.SimpleButton;
	@:keep public var A5 (default, null):openfl.display.SimpleButton;
	@:keep public var A3 (default, null):openfl.display.SimpleButton;
	@:keep public var A2 (default, null):openfl.display.SimpleButton;
	@:keep public var A1 (default, null):openfl.display.SimpleButton;
	@:keep public var Score_lbl (default, null):openfl.text.TextField;
	@:keep public var Porridge (default, null):openfl.display.MovieClip;
	@:keep public var Level_lbl (default, null):openfl.text.TextField;
	@:keep public var Turn (default, null):openfl.text.TextField;
	@:keep public var Close (default, null):openfl.display.SimpleButton;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("vKnlfD2buAHmQZ5zUojz")) {

			SWFLite.instances.set ("vKnlfD2buAHmQZ5zUojz", SWFLite.unserialize (Assets.getText ("vKnlfD2buAHmQZ5zUojz")));

		}
		*/

		var swfLite = SWFLite.instances.get ("vKnlfD2buAHmQZ5zUojz");
		var symbol = swfLite.symbols.get (576);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("mm.parties.games.Pot") class Pot extends openfl.display.MovieClip {


	@:keep public var A4 (default, null):openfl.display.SimpleButton;
	@:keep public var A5 (default, null):openfl.display.SimpleButton;
	@:keep public var A3 (default, null):openfl.display.SimpleButton;
	@:keep public var A2 (default, null):openfl.display.SimpleButton;
	@:keep public var A1 (default, null):openfl.display.SimpleButton;
	@:keep public var Score_lbl (default, null):openfl.text.TextField;
	@:keep public var Porridge (default, null):openfl.display.MovieClip;
	@:keep public var Level_lbl (default, null):openfl.text.TextField;
	@:keep public var Turn (default, null):openfl.text.TextField;
	@:keep public var Close (default, null):openfl.display.SimpleButton;
	

	public function new () {

		super ();

	}


}
#end