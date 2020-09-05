package ; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class BtnBonus extends openfl.display.MovieClip {


	@:keep public var btnBonus (default, null):openfl.display.SimpleButton;
	@:keep public var mcAnim (default, null):mirkomir_fla.SundukMC_101;
	@:keep public var lblBonus (default, null):openfl.text.TextField;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("dVxygrvB1tL7vIVXAgLn")) {

			SWFLite.instances.set ("dVxygrvB1tL7vIVXAgLn", SWFLite.unserialize (Assets.getText ("dVxygrvB1tL7vIVXAgLn")));

		}
		*/

		var swfLite = SWFLite.instances.get ("dVxygrvB1tL7vIVXAgLn");
		var symbol = swfLite.symbols.get (1247);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("BtnBonus") class BtnBonus extends openfl.display.MovieClip {


	@:keep public var btnBonus (default, null):openfl.display.SimpleButton;
	@:keep public var mcAnim (default, null):mirkomir_fla.SundukMC_101;
	@:keep public var lblBonus (default, null):openfl.text.TextField;
	

	public function new () {

		super ();

	}


}
#end