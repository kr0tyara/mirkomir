package ; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class ProfileScreen extends openfl.display.MovieClip {


	@:keep public var overlay (default, null):mm.interfaces.Overlay;
	@:keep public var screen (default, null):Profile;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("dVxygrvB1tL7vIVXAgLn")) {

			SWFLite.instances.set ("dVxygrvB1tL7vIVXAgLn", SWFLite.unserialize (Assets.getText ("dVxygrvB1tL7vIVXAgLn")));

		}
		*/

		var swfLite = SWFLite.instances.get ("dVxygrvB1tL7vIVXAgLn");
		var symbol = swfLite.symbols.get (364);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("ProfileScreen") class ProfileScreen extends openfl.display.MovieClip {


	@:keep public var overlay (default, null):mm.interfaces.Overlay;
	@:keep public var screen (default, null):Profile;
	

	public function new () {

		super ();

	}


}
#end