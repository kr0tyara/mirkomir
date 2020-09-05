package mm.entities; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class Avatar extends openfl.display.MovieClip {


	@:keep public var character (default, null):openfl.display.MovieClip;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("ng0GsNnZN0zTpgrGDKY5")) {

			SWFLite.instances.set ("ng0GsNnZN0zTpgrGDKY5", SWFLite.unserialize (Assets.getText ("ng0GsNnZN0zTpgrGDKY5")));

		}
		*/

		var swfLite = SWFLite.instances.get ("ng0GsNnZN0zTpgrGDKY5");
		var symbol = swfLite.symbols.get (6);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("mm.entities.Avatar") class Avatar extends openfl.display.MovieClip {


	@:keep public var character (default, null):openfl.display.MovieClip;
	

	public function new () {

		super ();

	}


}
#end