package mm.screens; #if !flash


import openfl._internal.formats.swf.SWFLite;
import openfl.utils.Assets;
import openfl.display.*;
import openfl.events.*;
import openfl.ui.*;

import com.smartfoxserver.v2.requests.*;

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

		var swfLite = SWFLite.instances.get ("dVxygrvB1tL7vIVXAgLn");
		var symbol = swfLite.symbols.get (1156);

		__fromSymbol (swfLite, cast symbol);

        Main.M.addEventListener(KeyboardEvent.KEY_DOWN, KeyDown);

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

    private function BtnChatClick (E:MouseEvent) : Void
    {
        SendMessage();
    }
    private function KeyDown (E:KeyboardEvent)
    {
        if (E.keyCode == Keyboard.ENTER)
            SendMessage();
    }

    private function SendMessage(Msg:String = '')
    {
        if (Msg == '')
        {
            if (chatPanel.txtChat.text != '')
            {
				Main.SFS.send(new PublicMessageRequest(chatPanel.txtChat.text));
                chatPanel.txtChat.text = '';
            }
        }
        else
        {
            Main.SFS.send(new PublicMessageRequest(Msg));
        }
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