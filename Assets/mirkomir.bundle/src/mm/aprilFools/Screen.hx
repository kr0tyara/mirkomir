package mm.aprilFools; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class Screen extends openfl.display.MovieClip {


	@:keep public var Container (default, null):AprilContainer;
	@:keep public var UpPanel (default, null):UpPanels;
	@:keep public var RightPanel (default, null):openfl.display.MovieClip;
	@:keep public var DownPanel (default, null):DownPanels;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("dVxygrvB1tL7vIVXAgLn")) {

			SWFLite.instances.set ("dVxygrvB1tL7vIVXAgLn", SWFLite.unserialize (Assets.getText ("dVxygrvB1tL7vIVXAgLn")));

		}
		*/

		var swfLite = SWFLite.instances.get ("dVxygrvB1tL7vIVXAgLn");
		var symbol = swfLite.symbols.get (1437);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("mm.aprilFools.Screen") class Screen extends openfl.display.MovieClip {


	@:keep public var Container (default, null):AprilContainer;
	@:keep public var UpPanel (default, null):UpPanels;
	@:keep public var RightPanel (default, null):openfl.display.MovieClip;
	@:keep public var DownPanel (default, null):DownPanels;
	

	public function new () {

		super ();

	}


}
#end