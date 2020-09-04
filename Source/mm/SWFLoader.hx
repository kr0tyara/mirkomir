package mm;

import openfl.net.*;
import openfl.display.*;
import openfl.events.*;
import openfl.system.*;
import mm.*;

class SWFLoader {

	private var L:Loader;
	private var U:URLRequest;
	private var Completed:Event->Void;

	public function new (URL:String, Comp:Event->Void):Void
	{
		L = new Loader();
		U = new URLRequest((Main.Debug ? Main.TestDomain : Main.MainDomain) + URL + '.bundle');
		Completed = Comp;

		L.contentLoaderInfo.addEventListener(Event.COMPLETE, Complete);
		L.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, Progress);
		L.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, Error);

		L.load(U);
	}
	public function Progress (E:ProgressEvent):Void
	{
		if(Main.LS != null)
			Main.LS.lblProgress.text = Std.string(Math.floor(E.bytesLoaded / E.bytesTotal * 100)) + '%';
	}
	public function Complete (E:Event):Void
	{
		L.contentLoaderInfo.removeEventListener(Event.COMPLETE, Complete);
		L.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, Progress);
		L.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, Error);

		Completed(E);
	}
	public function Error (E:IOErrorEvent):Void
	{
		trace('Load error!', E);
	}
}