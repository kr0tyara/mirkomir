package mm.screens; 

import openfl.display.*;

class LoadingScreen extends mm.screens.LoadingScreenSwf {
	public static inline var OFFLINE:Int = -2;
	public static inline var ERROR:Int = -1;
	public static inline var CONNECTION:Int = 0;
	public static inline var LOCATION:Int = 1;
	public static inline var HOUSE:Int = 2;
	public static inline var GAME:Int = 3;
	
	public var OnScene:Bool = true;

	private var TP:Int;

	public function new():Void
	{
		super ();

		lblVersion.text = 'v.' + Main.Version;
		Type(CONNECTION);
	}

	public function Destroy():Void
	{
		OnScene = false;
		Main.M.removeChild(this);
	}

	public function Type(T:Int, Targ:String = ''):Void
	{
		TP = T;

		switch(TP) {
			case OFFLINE:
				icon.gotoAndStop('offline');
				lblTarget.text = 'Сервер недоступен, повторите попытку позже';
			case ERROR:
				icon.gotoAndStop('error');
				lblTarget.text = 'Ошибка подключения';
			case CONNECTION:
				lblTarget.text = 'Подключение к серверу...';
			case LOCATION, HOUSE:
				lblTarget.text = '$Targ загружается...';
			case GAME:
				lblTarget.text = 'Мини-игра $Targ загружается...';
		}

		if(TP >= LOCATION) {
			icon.gotoAndStop('loading');
			lblProgress.text = '0%';
		}
		else 
			lblProgress.text = '';
			
		if (!OnScene)
			Main.M.addChild(this);
	}

	public function Background(N:String):Void
	{
		Back.background.gotoAndStop(N);
	}

	public function Progress(L:Float, T:Float):Void
	{
		lblProgress.text = Std.string(Math.floor(L / T * 100)) + '%';
	}
}