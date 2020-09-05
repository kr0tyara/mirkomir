package ; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class Profile extends openfl.display.MovieClip {


	@:keep public var btnInventory (default, null):openfl.display.SimpleButton;
	@:keep public var btnInfo (default, null):openfl.display.SimpleButton;
	@:keep public var btnBackgrounds (default, null):openfl.display.SimpleButton;
	@:keep public var btnHouses (default, null):openfl.display.SimpleButton;
	@:keep public var btnAddFriend (default, null):openfl.display.SimpleButton;
	@:keep public var btnReport (default, null):openfl.display.SimpleButton;
	@:keep public var btnApproveFriend (default, null):openfl.display.SimpleButton;
	@:keep public var btnRemoveFriend (default, null):openfl.display.SimpleButton;
	@:keep public var btnCancelFriend (default, null):openfl.display.SimpleButton;
	@:keep public var txtInfo (default, null):openfl.text.TextField;
	@:keep public var mcAvatar (default, null):McAvatar;
	@:keep public var lblName (default, null):openfl.text.TextField;
	@:keep public var Maskot (default, null):openfl.display.MovieClip;
	@:keep public var btnSave (default, null):openfl.display.SimpleButton;
	@:keep public var btnCancel (default, null):openfl.display.SimpleButton;
	@:keep public var lblPage (default, null):openfl.text.TextField;
	@:keep public var btnNext (default, null):openfl.display.SimpleButton;
	@:keep public var btnPrev (default, null):openfl.display.SimpleButton;
	@:keep public var cmbSort (default, null):CmbSort;
	@:keep public var inventoryList (default, null):Inv;
	@:keep public var cmbSortList (default, null):CmbSortList;
	@:keep public var btnEnterHouse (default, null):openfl.display.SimpleButton;
	@:keep public var btnStatusMe (default, null):openfl.display.SimpleButton;
	@:keep public var btnStatusFriends (default, null):openfl.display.SimpleButton;
	@:keep public var btnStatusAll (default, null):openfl.display.SimpleButton;
	

	public function new () {

		super ();

		/*
		if (!SWFLite.instances.exists ("dVxygrvB1tL7vIVXAgLn")) {

			SWFLite.instances.set ("dVxygrvB1tL7vIVXAgLn", SWFLite.unserialize (Assets.getText ("dVxygrvB1tL7vIVXAgLn")));

		}
		*/

		var swfLite = SWFLite.instances.get ("dVxygrvB1tL7vIVXAgLn");
		var symbol = swfLite.symbols.get (363);

		__fromSymbol (swfLite, cast symbol);

	}


}


#else
@:bind @:native("Profile") class Profile extends openfl.display.MovieClip {


	@:keep public var btnInventory (default, null):openfl.display.SimpleButton;
	@:keep public var btnInfo (default, null):openfl.display.SimpleButton;
	@:keep public var btnBackgrounds (default, null):openfl.display.SimpleButton;
	@:keep public var btnHouses (default, null):openfl.display.SimpleButton;
	@:keep public var btnAddFriend (default, null):openfl.display.SimpleButton;
	@:keep public var btnReport (default, null):openfl.display.SimpleButton;
	@:keep public var btnApproveFriend (default, null):openfl.display.SimpleButton;
	@:keep public var btnRemoveFriend (default, null):openfl.display.SimpleButton;
	@:keep public var btnCancelFriend (default, null):openfl.display.SimpleButton;
	@:keep public var txtInfo (default, null):openfl.text.TextField;
	@:keep public var mcAvatar (default, null):McAvatar;
	@:keep public var lblName (default, null):openfl.text.TextField;
	@:keep public var Maskot (default, null):openfl.display.MovieClip;
	@:keep public var btnSave (default, null):openfl.display.SimpleButton;
	@:keep public var btnCancel (default, null):openfl.display.SimpleButton;
	@:keep public var lblPage (default, null):openfl.text.TextField;
	@:keep public var btnNext (default, null):openfl.display.SimpleButton;
	@:keep public var btnPrev (default, null):openfl.display.SimpleButton;
	@:keep public var cmbSort (default, null):CmbSort;
	@:keep public var inventoryList (default, null):Inv;
	@:keep public var cmbSortList (default, null):CmbSortList;
	@:keep public var btnEnterHouse (default, null):openfl.display.SimpleButton;
	@:keep public var btnStatusMe (default, null):openfl.display.SimpleButton;
	@:keep public var btnStatusFriends (default, null):openfl.display.SimpleButton;
	@:keep public var btnStatusAll (default, null):openfl.display.SimpleButton;
	

	public function new () {

		super ();

	}


}
#end