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
		if (!SWFLite.instances.exists ("dVxygrvB1tL7vIVXAgLn")) {

			SWFLite.instances.set ("dVxygrvB1tL7vIVXAgLn", SWFLite.unserialize (Assets.getText ("dVxygrvB1tL7vIVXAgLn")));

		}
		*/

		var swfLite = SWFLite.instances.get ("dVxygrvB1tL7vIVXAgLn");
		var symbol = swfLite.symbols.get (1327);

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