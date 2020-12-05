package mm.entities;
import openfl.display.*;

class Background extends MovieClip
{

	public var MC:MovieClip;
	public var Icon:MovieClip;
	public var Back:MovieClip;

	public function new(mc:DisplayObject):Void
	{
		super();

		MC = cast(mc, MovieClip);
		Icon = cast(MC.getChildByName('item'), MovieClip);
		Back = cast(MC.getChildByName('background'), MovieClip);
	}
}