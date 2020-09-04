package ; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class CmbSortList extends openfl.display.MovieClip {


	@:keep public var list (default, null):CmbBtns;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("vKnlfD2buAHmQZ5zUojz")) {

			SWFLite.instances.set ("vKnlfD2buAHmQZ5zUojz", SWFLite.unserialize (Assets.getText ("vKnlfD2buAHmQZ5zUojz")));

		}
		*/

		var swfLite = SWFLite.instances.get ("vKnlfD2buAHmQZ5zUojz");
		var symbol = swfLite.symbols.get (342);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("CmbSortList") class CmbSortList extends openfl.display.MovieClip {


	@:keep public var list (default, null):CmbBtns;
	

	public function new () {

		super ();

	}


}
#end