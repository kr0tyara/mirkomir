package ; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class FriendsScr extends openfl.display.MovieClip {


	@:keep public var btnFriendlist (default, null):openfl.display.SimpleButton;
	@:keep public var btnIncomingRequests (default, null):openfl.display.SimpleButton;
	@:keep public var btnOutcomingRequests (default, null):openfl.display.SimpleButton;
	@:keep public var lblTitle (default, null):openfl.text.TextField;
	@:keep public var txtSearch (default, null):openfl.text.TextField;
	@:keep public var lblEmpty (default, null):openfl.text.TextField;
	@:keep public var scrollbar (default, null):FriendsScroll;
	@:keep public var FriendsNotifications (default, null):openfl.display.MovieClip;
	@:keep public var field (default, null):FriendsField;
	@:keep public var dataLoadingAnim (default, null):openfl.display.MovieClip;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("dVxygrvB1tL7vIVXAgLn")) {

			SWFLite.instances.set ("dVxygrvB1tL7vIVXAgLn", SWFLite.unserialize (Assets.getText ("dVxygrvB1tL7vIVXAgLn")));

		}
		*/

		var swfLite = SWFLite.instances.get ("dVxygrvB1tL7vIVXAgLn");
		var symbol = swfLite.symbols.get (1197);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("FriendsScr") class FriendsScr extends openfl.display.MovieClip {


	@:keep public var btnFriendlist (default, null):openfl.display.SimpleButton;
	@:keep public var btnIncomingRequests (default, null):openfl.display.SimpleButton;
	@:keep public var btnOutcomingRequests (default, null):openfl.display.SimpleButton;
	@:keep public var lblTitle (default, null):openfl.text.TextField;
	@:keep public var txtSearch (default, null):openfl.text.TextField;
	@:keep public var lblEmpty (default, null):openfl.text.TextField;
	@:keep public var scrollbar (default, null):FriendsScroll;
	@:keep public var FriendsNotifications (default, null):openfl.display.MovieClip;
	@:keep public var field (default, null):FriendsField;
	@:keep public var dataLoadingAnim (default, null):openfl.display.MovieClip;
	

	public function new () {

		super ();

	}


}
#end