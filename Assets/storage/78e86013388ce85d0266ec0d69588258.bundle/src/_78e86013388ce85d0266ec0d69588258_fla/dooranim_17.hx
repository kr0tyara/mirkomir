package _78e86013388ce85d0266ec0d69588258_fla; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class dooranim_17 extends openfl.display.MovieClip {


	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("qDeLJfVQXSFOsvemNEij")) {

			SWFLite.instances.set ("qDeLJfVQXSFOsvemNEij", SWFLite.unserialize (Assets.getText ("qDeLJfVQXSFOsvemNEij")));

		}
		*/

		var swfLite = SWFLite.instances.get ("qDeLJfVQXSFOsvemNEij");
		var symbol = swfLite.symbols.get (31);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("_78e86013388ce85d0266ec0d69588258_fla.dooranim_17") class dooranim_17 extends openfl.display.MovieClip {


	

	public function new () {

		super ();

	}


}
#end