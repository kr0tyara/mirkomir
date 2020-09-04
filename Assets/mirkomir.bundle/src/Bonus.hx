package ; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class Bonus extends openfl.display.MovieClip {


	@:keep public var bonus_1 (default, null):BtnBonus;
	@:keep public var bonus_2 (default, null):BtnBonus;
	@:keep public var bonus_3 (default, null):BtnBonus;
	@:keep public var lblMessage (default, null):openfl.text.TextField;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("vKnlfD2buAHmQZ5zUojz")) {

			SWFLite.instances.set ("vKnlfD2buAHmQZ5zUojz", SWFLite.unserialize (Assets.getText ("vKnlfD2buAHmQZ5zUojz")));

		}
		*/

		var swfLite = SWFLite.instances.get ("vKnlfD2buAHmQZ5zUojz");
		var symbol = swfLite.symbols.get (1249);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("Bonus") class Bonus extends openfl.display.MovieClip {


	@:keep public var bonus_1 (default, null):BtnBonus;
	@:keep public var bonus_2 (default, null):BtnBonus;
	@:keep public var bonus_3 (default, null):BtnBonus;
	@:keep public var lblMessage (default, null):openfl.text.TextField;
	

	public function new () {

		super ();

	}


}
#end