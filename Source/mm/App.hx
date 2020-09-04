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

		Assets.loadLibrary ('assets/mirkomir.bundle').onComplete (function (F) {
			trace ('SWF loaded!');

			MM = new Main();
			addChild(MM);
		});
	}
}
