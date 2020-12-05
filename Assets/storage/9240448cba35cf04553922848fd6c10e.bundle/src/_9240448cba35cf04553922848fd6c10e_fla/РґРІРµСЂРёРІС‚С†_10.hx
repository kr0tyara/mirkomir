package _9240448cba35cf04553922848fd6c10e_fla; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class дверивтц_10 extends openfl.display.MovieClip {


	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("8wR7PwhyzCh0fW1yjKes")) {

			SWFLite.instances.set ("8wR7PwhyzCh0fW1yjKes", SWFLite.unserialize (Assets.getText ("8wR7PwhyzCh0fW1yjKes")));

		}
		*/

		var swfLite = SWFLite.instances.get ("8wR7PwhyzCh0fW1yjKes");
		var symbol = swfLite.symbols.get (23);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("_9240448cba35cf04553922848fd6c10e_fla.дверивтц_10") class дверивтц_10 extends openfl.display.MovieClip {


	

	public function new () {

		super ();

	}


}
#end