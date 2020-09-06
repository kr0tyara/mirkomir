package mm.screens;

import openfl.display.*;
import openfl.events.*;
import openfl.ui.*;

import com.smartfoxserver.v2.requests.*;

class GameScreen extends mm.screens.GameScreenSwf {

	public function new () {
		super ();

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