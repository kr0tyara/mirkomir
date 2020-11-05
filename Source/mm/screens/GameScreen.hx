package mm.screens;

import openfl.display.*;
import openfl.events.*;
import openfl.media.*;
import openfl.geom.*;
import openfl.net.*;
import openfl.ui.*;

import mm.*;
import mm.ui.*;
import mm.screens.*;

import motion.*;

import com.smartfoxserver.v2.requests.*;

class GameScreen extends mm.screens.GameScreenSwf {

    private var MapScr:MapScreen;
	private var SChannel:SoundChannel;
    private var Volume:Float;

	public function new ()
    {
		super ();

		Volume = (Main.SO.data.SoundVolume != null ? Main.SO.data.SoundVolume : 0.5);
		
        Main.M.addEventListener(KeyboardEvent.KEY_DOWN, KeyDown);
        chatPanel.btnChat.addEventListener(MouseEvent.CLICK, ChatPanelBtnChatClick);

        chatHistoryPanel.visible = false;
        furniturePanel.visible = false;
        smilesPanel.visible = false;
        listPanel.visible = false;

        chatPanel.btnHouse.stop();
        chatPanel.btnHouse.mouseChildren = false;
        chatPanel.btnHouse.buttonMode = true;
        chatPanel.btnHouse.icon.gotoAndStop(4);
        
        chatPanel.btnVolume.stop();
        chatPanel.btnVolume.mouseChildren = false;
        chatPanel.btnVolume.buttonMode = true;
        chatPanel.btnVolume.icon.gotoAndStop(9);
		
        chatPanel.btnSmiles.addEventListener(MouseEvent.CLICK, BtnSmilesClick);
        chatPanel.btnVolume.addEventListener(MouseEvent.CLICK, BtnVolumeClick);
		
        smilesPanel.blendMode = BlendMode.LAYER;
        smilesPanel.visible = false;
        smilesPanel.Scroll.area.slider.stop();
        //var Scroll:ScrollBar = new ScrollBar(smilesPanel.Scroll, smilesPanel.Smiles, 40, 0, false, true);
        
        for (DO in 0...smilesPanel.Smiles.content.numChildren)
        {
            if (smilesPanel.Smiles.content.getChildAt(DO).name.indexOf('btn_') != -1)
            {
                smilesPanel.Smiles.content.getChildAt(DO).addEventListener(MouseEvent.CLICK, SmilesPanelBtnClick);
                
                var MC:MovieClip = cast(smilesPanel.Smiles.content.getChildAt(DO), MovieClip);
                MC.stop();
                MC.buttonMode = true;
            }
        }
		
        volumePanel.visible = false;
		
		volumePanel.sliderGroup.slider.buttonMode = true;
        volumePanel.sliderGroup.slider.tabEnabled = false;
        volumePanel.sliderGroup.sliderArea.buttonMode = true;
        volumePanel.sliderGroup.sliderArea.tabEnabled = false;
        volumePanel.sliderGroup.sliderArea.useHandCursor = true;
        
        volumePanel.sliderGroup.slider.addEventListener(MouseEvent.MOUSE_DOWN, VolumePanelSliderMouseDown);
        volumePanel.sliderGroup.sliderArea.addEventListener(MouseEvent.MOUSE_DOWN, VolumePanelSliderAreaMouseDown);

        chatPanel.btnFriendsNotification.visible = false;

        locationPanel.btnMap.addEventListener(MouseEvent.CLICK, LocationPanelBtnMapClick);

        if(Main.SFS.mySelf.privilegeId >= 2) {
            modPanel.visible = true;

            modPanel.btnMZ.addEventListener(MouseEvent.CLICK, ModPanelBtnMZClick);

            /*modPanel.btnMod.addEventListener(MouseEvent.CLICK, ModPanelBtnModClick);
            modPanel.btnInvisible.addEventListener(MouseEvent.CLICK, ModPanelBtnInvisibleClick);
            modPanel.btnNotification.addEventListener(MouseEvent.CLICK, ModPanelBtnNotificationClick);*/
        }
        else
            modPanel.visible = false;
	}

	//Smiles Panel
	private function BtnSmilesClick(E:MouseEvent = null):Void
	{
		if (smilesPanel.visible)
        {
			Actuate.tween(smilesPanel, .3, {
				y: 447,
				alpha: 0,
				visible: false
			});
        }
        else
        {
			smilesPanel.y = 447;
			smilesPanel.alpha = 0;
			smilesPanel.visible = true;
			
			Actuate.tween(smilesPanel, .3, {
				y: 427,
				alpha: 1
			});
        }
	}
	private function SmilesPanelBtnClick(E:MouseEvent):Void
	{
		BtnSmilesClick();
        
        SendMessage('#BUBBLE#::' + cast(E.target, DisplayObject).name.substr(4));
	}
	
	//Volume Panel
	private function BtnVolumeClick(E:MouseEvent):Void
	{
        if (volumePanel.visible)
        {
			Actuate.tween(volumePanel, .3, {
				y: 520,
				alpha: 0,
				visible: false
			});
        }
        else
        {
			volumePanel.y = 520;
			volumePanel.alpha = 0;
			volumePanel.visible = true;
			
			Actuate.tween(volumePanel, .3, {
				y: 500,
				alpha: 1
			});
        }

	}
    private function VolumePanelSliderMouseDown(E:MouseEvent):Void
    {
        var sg = volumePanel.sliderGroup;
        var bounds = new Rectangle(0, sg.sliderArea.y, 0, sg.sliderArea.height);
        sg.slider.startDrag(true, bounds);
        
        mouseChildren = false;
        addEventListener(MouseEvent.MOUSE_UP, SliderUp);
        addEventListener(MouseEvent.MOUSE_MOVE, SliderMove);
    }
	private function VolumePanelSliderAreaMouseDown(E:MouseEvent):Void
    {
        var sg = volumePanel.sliderGroup;
        sg.slider.y = E.localY + sg.sliderArea.y;
        SliderChangePos();
    }

    private function SliderUp(E:MouseEvent):Void
    {
        var sg = volumePanel.sliderGroup;
        sg.slider.stopDrag();
        mouseChildren = true;
        removeEventListener(MouseEvent.MOUSE_UP, SliderUp);
        removeEventListener(MouseEvent.MOUSE_MOVE, SliderMove);
    }
    
    private function SliderMove(E:MouseEvent):Void
    {
        SliderChangePos();
    }
    
    private function volumePanelSliderAreaMouseDown(E:MouseEvent):Void
    {
        var sg = volumePanel.sliderGroup;
        sg.slider.y = E.localY + sg.sliderArea.y;
        SliderChangePos();
    }
    
    public function SliderChangePos():Void
    {
        var sg = volumePanel.sliderGroup;
        sg.slider.gotoAndStop('_down');
        UpdateVolume(Math.abs((sg.slider.y + sg.sliderArea.y) / sg.sliderArea.height));
    }
	
	public function UpdateVolume(Vol:Float):Void
	{
		Volume = Vol;
		
		chatPanel.btnVolume.icon.gotoAndStop(8 + 5 - (Math.floor((100 - Volume * 100) / 33) + 1));
        chatPanelMinimised.btnVolume.icon.gotoAndStop(8 + 5 - (Math.floor((100 - Volume * 100) / 33) + 1));
        volumePanel.sliderGroup.slider.y = -Volume * volumePanel.sliderGroup.sliderArea.height + 27;
        SChannel.soundTransform = new SoundTransform(Volume, 0);
		
        Main.SO.setProperty('SoundVolume', Volume);
		Main.SO.flush();
	}
	
    public function SetSound(Hash:String):Void
    {
		var S:Sound;
        var Host:String = (Main.Debug ? Main.TestDomain : Main.MainDomain);
		
		S = new Sound(new URLRequest('$Host/storage/$Hash.mp3'));
        
        SChannel = S.play(0, 999);
		UpdateVolume(Volume);
    }
	public function DestroySound():Void
	{
        SChannel.stop();
	}
	
    //Chat Panel
    private function ChatPanelBtnChatClick (E:MouseEvent):Void
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

    //Mod Panel
    private function ModPanelBtnMZClick(E:MouseEvent):Void
    {
        Main.SO.setProperty('ModMZ', Main.DZAllowed = !Main.DZAllowed);
		Main.SO.flush();
    }

    //Location Panel
    private function LocationPanelBtnMapClick(E:MouseEvent):Void
    {
        if(MapScr != null) {
            MapScr.Destroy();
            MapScr = null;
        }

        MapScr = new MapScreen();
        Main.M.addChild(MapScr);
    }
}