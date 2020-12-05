package mm.ui;

import openfl.text.*;

class Label extends LabelSwf
{
	public function new(Txt:String):Void 
	{
		super();
		
		txtLabel.text = Txt;
		txtLabel.autoSize = TextFieldAutoSize.LEFT;
		background.width = txtLabel.width;
	}
}