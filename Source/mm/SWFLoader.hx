package mm;

import openfl.net.*;
import openfl.display.*;
import openfl.events.*;
import openfl.system.*;
import mm.*;

class SWFLoader {

	private var L:Loader;
	private var U:URLRequest;
	private var HProg:Bool;
	private var Completed:Event->Void;

	public function new (URL:String, Comp:Event->Void, HandleProgress:Bool = true):Void
	{
		var Host:String = (Main.Debug ? Main.TestDomain : Main.MainDomain);
		
		L = new Loader();
		U = new URLRequest('$Host/$URL.bundle');
		Completed = Comp;
		HProg = HandleProgress;

		L.contentLoaderInfo.addEventListener(Event.COMPLETE, Complete);
		L.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, Error);
		if (HProg)
			L.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, Progress);

		L.load(U);
	}
	public function Progress (E:ProgressEvent):Void
	{
		if (Main.LS.OnScene)
			Main.LS.Progress(E.bytesLoaded, E.bytesTotal);
	}
	public function Complete (E:Event):Void
	{
		L.contentLoaderInfo.removeEventListener(Event.COMPLETE, Complete);
		L.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, Error);
		if (HProg)
			L.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, Progress);

		Completed(E);
	}
	
	public function Destroy():Void
	{
		L.unload();
		L.contentLoaderInfo.removeEventListener(Event.COMPLETE, Complete);
		L.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, Error);
		if (HProg)
			L.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, Progress);
	}
	
	public function Error (E:IOErrorEvent):Void
	{
		trace('Load error!', E);
	}
}