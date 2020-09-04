package mm.screens; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.display.MovieClip;
import openfl.utils.Assets;


class GameScreen extends openfl.display.MovieClip {
	@:keep public var chatHistoryPanel (default, null):ChatHistoryPanel;
	@:keep public var smilesPanel (default, null):SmilesPanel;
	@:keep public var volumePanel (default, null):VolumePanel;
	@:keep public var listPanel (default, null):ListPanel;
	@:keep public var locationPanel (default, null):LocationPanel;
	@:keep public var balancePanel (default, null):BalancePanels;
	@:keep public var chatPanel (default, null):ChatPanel;
	@:keep public var modPanel (default, null):ModPanels;
	@:keep public var chatPanelMinimised (default, null):ChatPanelMinimised;
	@:keep public var furniturePanel (default, null):FurniturePanel;
	

	public function new () {

		super ();

		var swfLite = SWFLite.instances.get ("vKnlfD2buAHmQZ5zUojz");
		var symbol = swfLite.symbols.get (1155);

		__fromSymbol (swfLite, cast symbol);

        furniturePanel.visible = false;
        chatHistoryPanel.visible = false;
        smilesPanel.visible = false;
        volumePanel.visible = false;
        listPanel.visible = false;

        chatPanel.btnHouse.stop();
        chatPanel.btnHouse.mouseChildren = false;
        chatPanel.btnHouse.buttonMode = true;
        chatPanel.btnHouse.icon.gotoAndStop(4);
        
        chatPanel.btnVolume.stop();
        chatPanel.btnVolume.mouseChildren = false;
        chatPanel.btnVolume.buttonMode = true;
        chatPanel.btnVolume.icon.gotoAndStop(9);

        chatPanel.btnFriendsNotification.visible = false;
	}

    public function SetLocation(Val:String):Void
    {
        locationPanel.lblName.text = Val;
    }
    
    public function SetBalanceRegular(Val:String):Void
    {
        balancePanel.lblRegular.text = Val;
    }
    
    public function SetBalanceDonate(Val:String):Void
    {
        balancePanel.lblDonate.text = Val;
    }

}


#else
@:bind @:native("mm.screens.GameScreen") class GameScreen extends openfl.display.MovieClip {


	@:keep public var chatHistoryPanel (default, null):ChatHistoryPanel;
	@:keep public var smilesPanel (default, null):SmilesPanel;
	@:keep public var volumePanel (default, null):VolumePanel;
	@:keep public var listPanel (default, null):ListPanel;
	@:keep public var locationPanel (default, null):LocationPanel;
	@:keep public var balancePanel (default, null):BalancePanels;
	@:keep public var chatPanel (default, null):ChatPanel;
	@:keep public var modPanel (default, null):ModPanels;
	@:keep public var chatPanelMinimised (default, null):ChatPanelMinimised;
	@:keep public var furniturePanel (default, null):FurniturePanel;
	

	public function new () {

		super ();

	}


}
#end