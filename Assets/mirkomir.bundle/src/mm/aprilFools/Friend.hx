package mm.aprilFools; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class Friend extends openfl.display.MovieClip {


	@:keep public var Cont (default, null):mm.aprilFools.Cont;
	@:keep public var Scroll (default, null):mm.aprilFools.Scroll;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("vKnlfD2buAHmQZ5zUojz")) {

			SWFLite.instances.set ("vKnlfD2buAHmQZ5zUojz", SWFLite.unserialize (Assets.getText ("vKnlfD2buAHmQZ5zUojz")));

		}
		*/

		var swfLite = SWFLite.instances.get ("vKnlfD2buAHmQZ5zUojz");
		var symbol = swfLite.symbols.get (1326);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("mm.aprilFools.Friend") class Friend extends openfl.display.MovieClip {


	@:keep public var Cont (default, null):mm.aprilFools.Cont;
	@:keep public var Scroll (default, null):mm.aprilFools.Scroll;
	

	public function new () {

		super ();

	}


}
#end