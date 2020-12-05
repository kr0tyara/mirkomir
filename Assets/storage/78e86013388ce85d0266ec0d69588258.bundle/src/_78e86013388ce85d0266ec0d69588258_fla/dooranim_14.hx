package _78e86013388ce85d0266ec0d69588258_fla; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class dooranim_14 extends openfl.display.MovieClip {


	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("ZqIbuOu3m5NIIv5E7RUq")) {

			SWFLite.instances.set ("ZqIbuOu3m5NIIv5E7RUq", SWFLite.unserialize (Assets.getText ("ZqIbuOu3m5NIIv5E7RUq")));

		}
		*/

		var swfLite = SWFLite.instances.get ("ZqIbuOu3m5NIIv5E7RUq");
		var symbol = swfLite.symbols.get (26);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("_78e86013388ce85d0266ec0d69588258_fla.dooranim_14") class dooranim_14 extends openfl.display.MovieClip {


	

	public function new () {

		super ();

	}


}
#end