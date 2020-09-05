package _9240448cba35cf04553922848fd6c10e_fla; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class дверивтц_14 extends openfl.display.MovieClip {


	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("v0rQ76mKg5rl6jnJM8ec")) {

			SWFLite.instances.set ("v0rQ76mKg5rl6jnJM8ec", SWFLite.unserialize (Assets.getText ("v0rQ76mKg5rl6jnJM8ec")));

		}
		*/

		var swfLite = SWFLite.instances.get ("v0rQ76mKg5rl6jnJM8ec");
		var symbol = swfLite.symbols.get (31);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("_9240448cba35cf04553922848fd6c10e_fla.дверивтц_14") class дверивтц_14 extends openfl.display.MovieClip {


	

	public function new () {

		super ();

	}


}
#end