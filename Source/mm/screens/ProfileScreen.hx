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
import mm.entities.*;

import haxe.crypto.*;
import motion.*;

import com.smartfoxserver.v2.core.*;
import com.smartfoxserver.v2.requests.*;
import com.smartfoxserver.v2.entities.data.*;

class ProfileScreen extends mm.screens.ProfileScreenSwf
{
	private var PORTRAITS:Array<String> = ['Мила', 'Пушик', 'Фенго'];
	
	private var D:ISFSObject;
	private var Wear:ISFSObject;
	private var Background:ISFSObject;
	private var House:ISFSObject;
	
	private var Pg:Int;
	private var Inventory:ISFSArray;
	
	private var A:Avatar;
	
	public function new(Data:ISFSObject):Void
	{
		super();
		
		D = Data;
		
        if (D.getUtfString('name') == Main.SFS.mySelf.name)
        {
            screen.btnInfo.visible = true;
            screen.btnInventory.visible = true;
            screen.btnBackgrounds.visible = true;
			
            screen.btnInfo.addEventListener(MouseEvent.CLICK, BtnInfoClick);
            screen.btnInventory.addEventListener(MouseEvent.CLICK, BtnInventoryClick);
            screen.btnBackgrounds.addEventListener(MouseEvent.CLICK, BtnBackgroundsClick);
            screen.btnHouses.addEventListener(MouseEvent.CLICK, BtnHousesClick);
        }
        else
        {
            screen.btnInfo.visible = false;
            screen.btnInventory.visible = false;
            screen.btnBackgrounds.visible = false;
        }
		
		// Background
		
        if (D.getInt('background') != 0)
        {
			var BLoader:SWFLoader = new SWFLoader('gameres/e850f8eeae83947d989e289d94a012d4/' + Md5.encode('background_' + Std.string(D.getInt('background'))), BackgroundLoaded, false);
		}
		
		// Avatar
		// костыль
		var AvatarData:ISFSObject = new SFSObject();
		var AvatarWear:ISFSObject = new SFSObject();
		
		for (i in 1...6)
		{
			AvatarWear.putInt(Std.string(i), D.getInt('wear_' + Std.string(i)));
		}
		
		AvatarData.putUtfString('color', D.getUtfString('avatar_color'));
		AvatarData.putSFSObject('wear',  AvatarWear);
		
		A = new Avatar(null, 100, AvatarData);
        A.avatar.x = 125;
        A.avatar.y = 150;
        A.avatar.scaleX = 1.25;
        A.avatar.scaleY = 1.25;
        screen.mcAvatar.addChild(A);
		
		// Portrait
		var Portrait:Int = (D.getUtfString('name') == Main.SFS.mySelf.name ? 1 : PORTRAITS.indexOf(D.getUtfString('name')) + 2);
		A.visible = Portrait == 1;
		screen.Maskot.gotoAndStop(Portrait);
		
        // Moderator
        if (Main.SFS.mySelf.privilegeId >= 2 && D.getUtfString("name") != Main.SFS.mySelf.name)
        {
            screen.btnReport.visible = true;
            //screen.btnReport.addEventListener(MouseEvent.CLICK, btnReportClick);
        }
		
		// Friends
		// TEMP
        var FStatus:Int = D.getInt('friend_status');
        
        if (Main.SFS.userManager.containsUserName(D.getUtfString('name')))
        {
            if (!Main.SFS.userManager.getUserByName(D.getUtfString('name')).isItMe)
            {
                if (FStatus == 2)
                {
                    screen.btnRemoveFriend.visible = true;
                    //profileScreen.screen.btnRemoveFriend.addEventListener(MouseEvent.CLICK, btnRemoveFriendClick);
                }
                else if (FStatus == 1)
                {
                    screen.btnApproveFriend.visible = true;
                    //profileScreen.screen.btnApproveFriend.addEventListener(MouseEvent.CLICK, btnApproveFriendClick);
                }
                else if (Main.SFS.buddyManager.containsBuddy(D.getUtfString('name')))
                {
                    screen.btnCancelFriend.visible = true;
                    //profileScreen.screen.btnCancelFriend.addEventListener(MouseEvent.CLICK, btnCancelFriendClick);
                }
                else if (!(Main.SFS.mySelf.privilegeId < 2 && D.getInt('permission') >= 2))
                {
                    //profileScreen.screen.btnAddFriend.addEventListener(MouseEvent.CLICK, btnAddFriendClick);
                    screen.btnAddFriend.visible = true;
                }
            }
        }
        else if (FStatus == 2)
        {
            screen.btnRemoveFriend.visible = true;
            //profileScreen.screen.btnRemoveFriend.addEventListener(MouseEvent.CLICK, btnRemoveFriendClick);
        }
        else if (FStatus == 1)
        {
            screen.btnApproveFriend.visible = true;
            //profileScreen.screen.btnApproveFriend.addEventListener(MouseEvent.CLICK, btnApproveFriendClick);
        }
        else if (Main.SFS.buddyManager.containsBuddy(D.getUtfString('name')))
        {
			screen.btnCancelFriend.visible = true;
			//screen.btnCancelFriend.addEventListener(MouseEvent.CLICK, btnCancelFriendClick);
        }
        else if (!(Main.SFS.mySelf.privilegeId < 2 && D.getInt('permission') >= 2))
        {
            //profileScreen.screen.btnAddFriend.addEventListener(MouseEvent.CLICK, btnAddFriendClick);
            screen.btnAddFriend.visible = true;
        }
		
		//House
        var HStatus:Int = D.getInt('house_status');
        
        if (D.getUtfString('name') != Main.SFS.mySelf.name)
        {
            if (HStatus == 3 || (HStatus == 2 && FStatus == 2) || Main.SFS.mySelf.privilegeId >= 2)
                screen.btnHouses.addEventListener(MouseEvent.CLICK, BtnHouseClick);
            else
                screen.btnHouses.visible = false;
        }
        
        overlay.addEventListener(MouseEvent.CLICK, OverlayClick);
		Main.SFS.addEventListener(SFSEvent.EXTENSION_RESPONSE, ExtensionResponse);
		
        Info();
	}
	
	private function ExtensionResponse(e:SFSEvent):Void
	{
		var E:Dynamic;
		#if html5
			E = e;
		#else
			E = e.params;
		#end
		
		switch(E.cmd)
		{
			case 'profile_inventory':
				Wear = E.params;
				Wardrobe();
			case 'profile_backgrounds':
				Background = E.params;
				Backgrounds();
		}
	}
	
	// Background
	private function BackgroundLoaded(E:Event):Void
	{
		var B:Background = new Background(cast(E.target, LoaderInfo).content);
		screen.mcAvatar.mcBackground.addChild(B.Back);
	}
	
	// Sections
	private function Info():Void
	{
		screen.gotoAndStop('info');
		
        // Info
        var TxtStatus:String = 'Статус: ' + D.getUtfString('online') + (D.containsKey('location') ? '\n\nЛокация: ' + Main.SFS.roomManager.getRoomByName(D.getUtfString('location')).getVariable('name_ru').getStringValue() : '');
        var IP:String = (Main.SFS.mySelf.privilegeId >= 2 ? '\nIP: ' + D.getUtfString('ip') : '');
        
        screen.lblName.text = D.getUtfString('name');
        screen.txtInfo.text = TxtStatus + '\n\nВ игре с: \n' + D.getUtfString('reg_date') + '\n\nДень рождения: \n' + D.getUtfString('birthday') + '\n' + IP;
	}
	
	private function Wardrobe():Void
	{
		Pg = 0;
		Inventory = Wear.getSFSArray('inventory');
		
		screen.gotoAndStop('inventory');
		
		// Combo Sort
        var CmbSort = screen.cmbSort;
        var CmbSortList = screen.cmbSortList.list;
        
        CmbSort.stop();
        CmbSort.mouseChildren = false;
        CmbSort.buttonMode = true;
        CmbSort.tabEnabled = false;
		CmbSort.lblName.mouseEnabled = false;
		
        CmbSortList.y = -204;
        CmbSortList.visible = false;
		
        CmbSort.addEventListener(MouseEvent.CLICK, CmbSortBtnListClick);
		
        screen.btnNext.addEventListener(MouseEvent.CLICK, BtnNextClick);
        screen.btnPrev.addEventListener(MouseEvent.CLICK, BtnPrevClick);
		
        if (Wear.containsKey('sort'))
        {
            CmbSort.lblName.text = Wear.getUtfString('sort');
            CmbSortList.y = 34;
            CmbSortList.visible = true;
            Actuate.tween(CmbSortList, .3, 
			{
				y: '-238',
				visible: false
			});
        }
		
		Page();
	}
	private function Backgrounds():Void
	{
		Pg = 0;
		Inventory = Background.getSFSArray('backgrounds');
		screen.gotoAndStop('backgrounds');
		Page();
	}
	
	
	private function Page():Void
	{
		var PageCount:Int = Math.ceil(Inventory.size() / 16);
		
		var Start:Int = Pg * 16;
		var End:Int = (Start + 16 > Inventory.size() ? Inventory.size() : Start + 16);
		
		screen.inventoryList.items.removeChildren();
		screen.inventoryList.labels.removeChildren();
		
		for (i in Start...End)
		{
			var Item:InventoryItem = new InventoryItem(Inventory.getSFSObject(i).getInt('wear_id'));
			Item.x = 70 * ((i - Start) % 4);
			Item.y = 70 * Math.floor((i - Start) / 4);
				
			var La = new Label(Inventory.getSFSObject(i).getUtfString('name'));
			La.x = Item.x + Item.width / 2 - La.background.width / 2;
			La.y = Item.y - 30;
			La.visible = false;
				
			Item.La = La;
				
			screen.inventoryList.items.addChild(Item);
			screen.inventoryList.labels.addChild(La);
		}
		
		screen.btnNext.visible = End < Inventory.size();
		screen.btnPrev.visible = Pg != 0;
		
        screen.lblPage.text = (Pg + 1) + '/' + PageCount;
	}
	
	// Buttons
	private function CmbSortBtnListClick(E:MouseEvent):Void
	{
		trace('wtf');
        var CmbSortList = screen.cmbSortList.list;
		
		if (CmbSortList.visible)
		{
			Actuate.tween(CmbSortList, .3,
			{
				y: '238',
				visible: false
			});
		}
		else
		{
			CmbSortList.visible = true;
			Actuate.tween(CmbSortList, .3,
			{
				y: '-238'
			});
		}
	}
	
	private function BtnNextClick(E:MouseEvent):Void
	{
		Pg++;
		Page();
	}
	private function BtnPrevClick(E:MouseEvent):Void
	{
		Pg--;
		Page();
	}
	
    private function BtnInfoClick(E:MouseEvent):Void
    {
        if (screen.currentFrameLabel != 'info')
            Info();
    }
	private function BtnInventoryClick(E:MouseEvent):Void
	{
		
        if (screen.currentFrameLabel != 'inventory')
		{
			if (Wear != null)
				Wardrobe();
			else
				Main.SFS.send(new ExtensionRequest('profile_inventory'));
		}
	}
    private function BtnBackgroundsClick(E:MouseEvent):Void
    {
        if (screen.currentFrameLabel != 'backgrounds')
        {
            if (Background != null)
            {
                Backgrounds();
            }
            else
                Main.SFS.send(new ExtensionRequest('profile_backgrounds'));
        }
    }
    private function BtnHousesClick(E:MouseEvent):Void
    {
        if (screen.currentFrameLabel != 'houses')
        {
            if (House != null)
            {
                //Houses();
            }
            else
                Main.SFS.send(new ExtensionRequest('profile_houses'));
        }
    }
	
	private function BtnHouseClick(E:MouseEvent):Void
	{
		var D:ISFSObject = new SFSObject();
		D.putUtfString('location', 'house_' + D.getUtfString('name'));
		Main.SFS.send(new ExtensionRequest('joinroom', D));
	}
	
	private function OverlayClick(E:MouseEvent):Void
	{
		overlay.removeEventListener(MouseEvent.CLICK, OverlayClick);
		
        Main.M.removeChild(this);
	}
}