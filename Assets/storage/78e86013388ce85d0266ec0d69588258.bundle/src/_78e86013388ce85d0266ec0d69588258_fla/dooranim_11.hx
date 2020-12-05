package _78e86013388ce85d0266ec0d69588258_fla; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class dooranim_11 extends openfl.display.MovieClip {


	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("18141mxY55bAKJ5UTim0")) {

			SWFLite.instances.set ("18141mxY55bAKJ5UTim0", SWFLite.unserialize (Assets.getText ("18141mxY55bAKJ5UTim0")));

		}
		*/

		var swfLite = SWFLite.instances.get ("18141mxY55bAKJ5UTim0");
		var symbol = swfLite.symbols.get (26);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("_78e86013388ce85d0266ec0d69588258_fla.dooranim_11") class dooranim_11 extends openfl.display.MovieClip {


	

	public function new () {

		super ();

	}


}
#end