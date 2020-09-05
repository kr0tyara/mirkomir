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
		if (!SWFLite.instances.exists ("dVxygrvB1tL7vIVXAgLn")) {

			SWFLite.instances.set ("dVxygrvB1tL7vIVXAgLn", SWFLite.unserialize (Assets.getText ("dVxygrvB1tL7vIVXAgLn")));

		}
		*/

		var swfLite = SWFLite.instances.get ("dVxygrvB1tL7vIVXAgLn");
		var symbol = swfLite.symbols.get (1250);

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