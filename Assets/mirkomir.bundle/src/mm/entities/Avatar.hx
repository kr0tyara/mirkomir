package mm.entities; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class Avatar extends openfl.display.MovieClip {


	@:keep public var avatar (default, null):Ava;
	@:keep public var lblName (default, null):openfl.text.TextField;
	@:keep public var bubble (default, null):mirkomir_fla.Bubble_94;
	@:keep public var badge (default, null):openfl.display.MovieClip;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("vKnlfD2buAHmQZ5zUojz")) {

			SWFLite.instances.set ("vKnlfD2buAHmQZ5zUojz", SWFLite.unserialize (Assets.getText ("vKnlfD2buAHmQZ5zUojz")));

		}
		*/

		var swfLite = SWFLite.instances.get ("vKnlfD2buAHmQZ5zUojz");
		var symbol = swfLite.symbols.get (1318);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("mm.entities.Avatar") class Avatar extends openfl.display.MovieClip {


	@:keep public var avatar (default, null):Ava;
	@:keep public var lblName (default, null):openfl.text.TextField;
	@:keep public var bubble (default, null):mirkomir_fla.Bubble_94;
	@:keep public var badge (default, null):openfl.display.MovieClip;
	

	public function new () {

		super ();

	}


}
#end