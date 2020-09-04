package mm.screens; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class LoadingScreen extends openfl.display.MovieClip {


	@:keep public var Back (default, null):mirkomir_fla.Background_250;
	@:keep public var lblTarget (default, null):openfl.text.TextField;
	@:keep public var lblProgress (default, null):openfl.text.TextField;
	@:keep public var icon (default, null):mirkomir_fla.LoadingScreenIcon_252;
	@:keep public var lblVersion (default, null):openfl.text.TextField;
	

	public function new (Name:String = 'map') {

		super ();

		/*
		if (!SWFLite.instances.exists ("vKnlfD2buAHmQZ5zUojz")) {

			SWFLite.instances.set ("vKnlfD2buAHmQZ5zUojz", SWFLite.unserialize (Assets.getText ("vKnlfD2buAHmQZ5zUojz")));

		}
		*/

		var swfLite = SWFLite.instances.get ("vKnlfD2buAHmQZ5zUojz");
		var symbol = swfLite.symbols.get (815);

		__fromSymbol (swfLite, cast symbol);

		var Rooms = ['square', 'beach', 'forest', 'confectionery', 'shopping_mall', 'theatre', 'club_square', 'club'];
			
		lblVersion.text = 'v.' + Main.Version;
		if(Rooms.indexOf(Name) != -1)
			Back.background.gotoAndStop(Name);
	}


}


#else
@:bind @:native("mm.screens.LoadingScreen") class LoadingScreen extends openfl.display.MovieClip {


	@:keep public var Back (default, null):mirkomir_fla.Background_250;
	@:keep public var lblTarget (default, null):openfl.text.TextField;
	@:keep public var lblProgress (default, null):openfl.text.TextField;
	@:keep public var icon (default, null):mirkomir_fla.LoadingScreenIcon_252;
	@:keep public var lblVersion (default, null):openfl.text.TextField;
	

	public function new () {

		super ();

	}


}
#end