package ; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class FurniturePanelListItem extends openfl.display.MovieClip {


	@:keep public var background (default, null):openfl.display.MovieClip;
	@:keep public var icon (default, null):openfl.display.MovieClip;
	@:keep public var counter (default, null):Furcount;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("dVxygrvB1tL7vIVXAgLn")) {

			SWFLite.instances.set ("dVxygrvB1tL7vIVXAgLn", SWFLite.unserialize (Assets.getText ("dVxygrvB1tL7vIVXAgLn")));

		}
		*/

		var swfLite = SWFLite.instances.get ("dVxygrvB1tL7vIVXAgLn");
		var symbol = swfLite.symbols.get (1165);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("FurniturePanelListItem") class FurniturePanelListItem extends openfl.display.MovieClip {


	@:keep public var background (default, null):openfl.display.MovieClip;
	@:keep public var icon (default, null):openfl.display.MovieClip;
	@:keep public var counter (default, null):Furcount;
	

	public function new () {

		super ();

	}


}
#end