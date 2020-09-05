package ; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class FriendlistItem extends openfl.display.MovieClip {


	@:keep public var btnRemove (default, null):openfl.display.SimpleButton;
	@:keep public var lblName (default, null):openfl.text.TextField;
	@:keep public var mcState (default, null):openfl.display.MovieClip;
	@:keep public var btnAccept (default, null):openfl.display.SimpleButton;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("dVxygrvB1tL7vIVXAgLn")) {

			SWFLite.instances.set ("dVxygrvB1tL7vIVXAgLn", SWFLite.unserialize (Assets.getText ("dVxygrvB1tL7vIVXAgLn")));

		}
		*/

		var swfLite = SWFLite.instances.get ("dVxygrvB1tL7vIVXAgLn");
		var symbol = swfLite.symbols.get (1212);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("FriendlistItem") class FriendlistItem extends openfl.display.MovieClip {


	@:keep public var btnRemove (default, null):openfl.display.SimpleButton;
	@:keep public var lblName (default, null):openfl.text.TextField;
	@:keep public var mcState (default, null):openfl.display.MovieClip;
	@:keep public var btnAccept (default, null):openfl.display.SimpleButton;
	

	public function new () {

		super ();

	}


}
#end