package mm.rooms;

import openfl.display.*;

class LocationSWF extends MovieClip
{

	public var dynamicObjects:MovieClip;
	public var staticObjects:MovieClip;
	public var moveArea:MovieClip;

	public var MC:MovieClip;

	public function new(mc:MovieClip):Void
	{
		super();

		MC = mc;

		dynamicObjects = cast(MC.getChildByName('dynamicObjects'), MovieClip);
		staticObjects = cast(MC.getChildByName('staticObjects'), MovieClip);
		moveArea = cast(MC.getChildByName('moveArea'), MovieClip);
	}
}