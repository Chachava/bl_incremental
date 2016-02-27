package src.classes
{
	import src.classes.util.preLoader;
	import src.classes.display.vhIcon;
	import src.classes.display.gameDisplay;
	import src.classes.game.gameState;
	import src.classes.vhs.*;

	import flash.display.MovieClip;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.net.URLLoader;
	import flash.events.MouseEvent;
	import src.classes.game.Buildings;
	import flash.utils.Timer;
	import flash.events.TimerEvent;

	public class Game extends MovieClip
	{

		private var _preLoader:preLoader;
		private var vhLoader:URLLoader;
		private var _display:gameDisplay;
		private var _state:gameState;
		private var displayTimer:Timer;

		public function Game(){
			_display = new gameDisplay(this.root);
			_state = new gameState();
			displayTimer = new Timer(250,0);
			displayTimer.addEventListener(TimerEvent.TIMER, updateDisplay);

			var test = new Buildings();
			_preLoader = new preLoader(593, this.loaderInfo);;
			_preLoader.x = 199;
			_preLoader.y = 306;
			stage.addChild(_preLoader);
			_preLoader.addEventListener("loadComplete", onLoaded);
		}

		private function onLoaded(e:Event):void
		{
			//Remove the preLoader
			stage.removeChild(_preLoader);
			
			//A check will go here to see if a save game is present, if it is it goes to frame 4 and updates
			//the display, if not it goes to the character select screen on frame 3

			gotoAndStop(3);
			//Load the VH XML data
			vhLoader = new URLLoader();
			var url:URLRequest = new URLRequest("data/vaultHunters.xml");
			vhLoader.load(url);
			vhLoader.addEventListener(Event.COMPLETE, _display.displayVHSelect);
			vhSelect.addEventListener(MouseEvent.CLICK, onVHSelect);
		}

		private function onVHSelect(e:MouseEvent):void{
			var vhSelected:String = vhDescrip.vhName_tf.text.toLowerCase();
			switch (vhSelected)
			{
				case "salvador" :
					_state.curVH = new vhSalvador();
					break;
				case "maya" :
					_state.curVH = new vhMaya();
					break;
				case "zero" :
					_state.curVH = new vhZero();
					break;
				case "axton" :
					_state.curVH = new vhAxton();
					break;
			}
			gotoAndStop(4);
			addListeners();
			_display.initBuildings(_state.curB);
			_display.newEnemy(_state.curEnemy);
			_display.updateDisplay(_state.curVH, _state.curB, _state.curMap, _state.curEnemy);
			_state.startTimers();
			displayTimer.start();
		}
		private function addListeners(){
			//Just a more convenient place to store all game event listeners
			addEventListener("buildingClick", _state.buyBuilding);
			_state.addEventListener("updateDisplay", updateDisplay);
			_state.addEventListener("newEnemy", updateEnemy);
			mainStage.enemyImage.addEventListener(MouseEvent.CLICK, _state.meleeDmg);
		}

		private function updateDisplay(e:Event){
			//Updates the display
			_display.updateDisplay(_state.curVH, _state.curB, _state.curMap, _state.curEnemy);
		}
		
		private function updateEnemy(e:Event):void{
			_display.newEnemy(_state.curEnemy);
			updateDisplay(e);
		}
	}

}