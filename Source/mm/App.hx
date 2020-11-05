package mm;

import openfl.display.*;
import openfl.Assets;
import mm.*;

class App extends MovieClip
{
	public static var MM:Main;

	public function new():Void
	{
		super();

		stage.scaleMode = StageScaleMode.EXACT_FIT;
		stage.quality = StageQuality.BEST;
		
		Assets.loadLibrary ('mirkomir').onComplete (function (F) {
			trace ('SWF loaded!');

			MM = new Main();
			addChild(MM);
		});
	}
}
