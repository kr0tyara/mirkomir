package ; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class BalancePanels extends openfl.display.MovieClip {


	@:keep public var btnAdd (default, null):openfl.display.SimpleButton;
	@:keep public var lblRegular (default, null):openfl.text.TextField;
	@:keep public var lblDonate (default, null):openfl.text.TextField;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("vKnlfD2buAHmQZ5zUojz")) {

			SWFLite.instances.set ("vKnlfD2buAHmQZ5zUojz", SWFLite.unserialize (Assets.getText ("vKnlfD2buAHmQZ5zUojz")));

		}
		*/

		var swfLite = SWFLite.instances.get ("vKnlfD2buAHmQZ5zUojz");
		var symbol = swfLite.symbols.get (105);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("BalancePanels") class BalancePanels extends openfl.display.MovieClip {


	@:keep public var btnAdd (default, null):openfl.display.SimpleButton;
	@:keep public var lblRegular (default, null):openfl.text.TextField;
	@:keep public var lblDonate (default, null):openfl.text.TextField;
	

	public function new () {

		super ();

	}


}
#end