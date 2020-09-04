package mm.screens.shop; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class ShopScreen extends openfl.display.MovieClip {


	@:keep public var sidebar (default, null):mm.screens.shop.Sidebar;
	@:keep public var preview (default, null):mm.screens.shop.Preview;
	@:keep public var navigation (default, null):mm.screens.shop.Navigation;
	@:keep public var exitPanel (default, null):mm.screens.shop.ExitPanel;
	@:keep public var balancePanel (default, null):BalancePanels;
	@:keep public var catalog (default, null):mm.screens.shop.Catalog;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("vKnlfD2buAHmQZ5zUojz")) {

			SWFLite.instances.set ("vKnlfD2buAHmQZ5zUojz", SWFLite.unserialize (Assets.getText ("vKnlfD2buAHmQZ5zUojz")));

		}
		*/

		var swfLite = SWFLite.instances.get ("vKnlfD2buAHmQZ5zUojz");
		var symbol = swfLite.symbols.get (115);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("mm.screens.shop.ShopScreen") class ShopScreen extends openfl.display.MovieClip {


	@:keep public var sidebar (default, null):mm.screens.shop.Sidebar;
	@:keep public var preview (default, null):mm.screens.shop.Preview;
	@:keep public var navigation (default, null):mm.screens.shop.Navigation;
	@:keep public var exitPanel (default, null):mm.screens.shop.ExitPanel;
	@:keep public var balancePanel (default, null):BalancePanels;
	@:keep public var catalog (default, null):mm.screens.shop.Catalog;
	

	public function new () {

		super ();

	}


}
#end