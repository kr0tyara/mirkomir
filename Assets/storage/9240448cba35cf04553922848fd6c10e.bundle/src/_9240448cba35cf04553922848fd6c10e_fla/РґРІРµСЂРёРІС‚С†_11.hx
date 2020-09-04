package _9240448cba35cf04553922848fd6c10e_fla; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class дверивтц_11 extends openfl.display.MovieClip {


	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("1NUxulzi9FhAr7XbsAZM")) {

			SWFLite.instances.set ("1NUxulzi9FhAr7XbsAZM", SWFLite.unserialize (Assets.getText ("1NUxulzi9FhAr7XbsAZM")));

		}
		*/

		var swfLite = SWFLite.instances.get ("1NUxulzi9FhAr7XbsAZM");
		var symbol = swfLite.symbols.get (23);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("_9240448cba35cf04553922848fd6c10e_fla.дверивтц_11") class дверивтц_11 extends openfl.display.MovieClip {


	

	public function new () {

		super ();

	}


}
#end