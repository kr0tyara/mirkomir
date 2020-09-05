package mm.holders;
import openfl.display.*;

class WearHolder extends MovieClip
{

	public var MC:MovieClip;
	public var Icon:MovieClip;
	public var Wear:MovieClip;

	public function new(mc:DisplayObject):Void
	{
		super();

		MC = cast(mc, MovieClip);
		Icon = cast(MC.getChildByName('item'), MovieClip);
		Wear = cast(MC.getChildByName('wear'), MovieClip);
	}
}