package d1726616031b41eb680ff93e175b8990_fla; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class Symbol3_8 extends openfl.display.MovieClip {


	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("bu8xkChRTJjhMqNuGtui")) {

			SWFLite.instances.set ("bu8xkChRTJjhMqNuGtui", SWFLite.unserialize (Assets.getText ("bu8xkChRTJjhMqNuGtui")));

		}
		*/

		var swfLite = SWFLite.instances.get ("bu8xkChRTJjhMqNuGtui");
		var symbol = swfLite.symbols.get (32);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("d1726616031b41eb680ff93e175b8990_fla.Symbol3_8") class Symbol3_8 extends openfl.display.MovieClip {


	

	public function new () {

		super ();

	}


}
#end