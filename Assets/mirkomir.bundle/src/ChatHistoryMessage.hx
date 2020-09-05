package ; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class ChatHistoryMessage extends openfl.display.MovieClip {


	@:keep public var background (default, null):openfl.display.MovieClip;
	@:keep public var btnProfile (default, null):BtnProfile;
	@:keep public var lblMsg (default, null):openfl.text.TextField;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("dVxygrvB1tL7vIVXAgLn")) {

			SWFLite.instances.set ("dVxygrvB1tL7vIVXAgLn", SWFLite.unserialize (Assets.getText ("dVxygrvB1tL7vIVXAgLn")));

		}
		*/

		var swfLite = SWFLite.instances.get ("dVxygrvB1tL7vIVXAgLn");
		var symbol = swfLite.symbols.get (1223);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("ChatHistoryMessage") class ChatHistoryMessage extends openfl.display.MovieClip {


	@:keep public var background (default, null):openfl.display.MovieClip;
	@:keep public var btnProfile (default, null):BtnProfile;
	@:keep public var lblMsg (default, null):openfl.text.TextField;
	

	public function new () {

		super ();

	}


}
#end