package mm.screens; 

import openfl.display.*;

class LoadingScreen extends mm.screens.LoadingScreenSwf {
	public function new (Name:String = 'map') {

		super ();

		var Rooms = ['square', 'beach', 'forest', 'confectionery', 'shopping_mall', 'theatre', 'club_square', 'club'];
			
		lblVersion.text = 'v.' + Main.Version;
		if(Rooms.indexOf(Name) != -1)
			Back.background.gotoAndStop(Name);
	}


}