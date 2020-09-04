package mm; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class Notification extends openfl.display.MovieClip {


	@:keep public var Head (default, null):openfl.text.TextField;
	@:keep public var Text (default, null):openfl.text.TextField;
	@:keep public var Icon (default, null):openfl.display.MovieClip;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("vKnlfD2buAHmQZ5zUojz")) {

			SWFLite.instances.set ("vKnlfD2buAHmQZ5zUojz", SWFLite.unserialize (Assets.getText ("vKnlfD2buAHmQZ5zUojz")));

		}
		*/

		var swfLite = SWFLite.instances.get ("vKnlfD2buAHmQZ5zUojz");
		var symbol = swfLite.symbols.get (680);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("mm.Notification") class Notification extends openfl.display.MovieClip {


	@:keep public var Head (default, null):openfl.text.TextField;
	@:keep public var Text (default, null):openfl.text.TextField;
	@:keep public var Icon (default, null):openfl.display.MovieClip;
	

	public function new () {

		super ();

	}


}
#end