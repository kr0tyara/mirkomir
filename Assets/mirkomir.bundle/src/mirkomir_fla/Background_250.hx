package mirkomir_fla; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class Background_250 extends openfl.display.MovieClip {


	@:keep public var background (default, null):mirkomir_fla.LoadingScreenBackground_251;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("dVxygrvB1tL7vIVXAgLn")) {

			SWFLite.instances.set ("dVxygrvB1tL7vIVXAgLn", SWFLite.unserialize (Assets.getText ("dVxygrvB1tL7vIVXAgLn")));

		}
		*/

		var swfLite = SWFLite.instances.get ("dVxygrvB1tL7vIVXAgLn");
		var symbol = swfLite.symbols.get (806);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("mirkomir_fla.Background_250") class Background_250 extends openfl.display.MovieClip {


	@:keep public var background (default, null):mirkomir_fla.LoadingScreenBackground_251;
	

	public function new () {

		super ();

	}


}
#end