package mm.screens.shop; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class CatalogItem extends openfl.display.MovieClip {


	@:keep public var background (default, null):openfl.display.MovieClip;
	@:keep public var shadow (default, null):openfl.display.MovieClip;
	@:keep public var mcBalance (default, null):openfl.display.MovieClip;
	@:keep public var lblPrice (default, null):openfl.text.TextField;
	@:keep public var mcIcon (default, null):openfl.display.MovieClip;
	@:keep public var mcNew (default, null):openfl.display.MovieClip;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("dVxygrvB1tL7vIVXAgLn")) {

			SWFLite.instances.set ("dVxygrvB1tL7vIVXAgLn", SWFLite.unserialize (Assets.getText ("dVxygrvB1tL7vIVXAgLn")));

		}
		*/

		var swfLite = SWFLite.instances.get ("dVxygrvB1tL7vIVXAgLn");
		var symbol = swfLite.symbols.get (154);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("mm.screens.shop.CatalogItem") class CatalogItem extends openfl.display.MovieClip {


	@:keep public var background (default, null):openfl.display.MovieClip;
	@:keep public var shadow (default, null):openfl.display.MovieClip;
	@:keep public var mcBalance (default, null):openfl.display.MovieClip;
	@:keep public var lblPrice (default, null):openfl.text.TextField;
	@:keep public var mcIcon (default, null):openfl.display.MovieClip;
	@:keep public var mcNew (default, null):openfl.display.MovieClip;
	

	public function new () {

		super ();

	}


}
#end