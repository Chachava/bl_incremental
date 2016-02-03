package classes {
	import classes.data.gameData;
	import classes.display.currencyDisplay;
	import classes.display.gameDisplay;
	import classes.display.mainButton;
	import classes.display.buildingDisplay;
	import classes.display.upgradeDisplay;
	import classes.display.statsDisplay;
	import classes.events.gameEvent;
	import classes.events.gameNEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.utils.Timer;
	
	public class Game extends MovieClip {
		//	Document class which communicates between the gameDisplay and the gameData
		private var dataLoader:URLLoader;
		private var _gameData:gameData;
		private var _gameDisplay:gameDisplay;
		private var gTimer:Timer;
		private var gTick:Number;
		
		public function Game() {
			//	Creates a gameData instance and an empty object to hold the display objects
			_gameData = new gameData();
			_gameDisplay = new gameDisplay();
			addChild(_gameDisplay);
			
			// Gather the building data from the XML file and send an XML list to the building display
			var url:URLRequest = new URLRequest("../bin/data/buildings.xml");
			dataLoader = new URLLoader(url);
			dataLoader.addEventListener(Event.COMPLETE, loadBuildings);
			
			//	Add Event listeners
			addEventListener(gameEvent.BTN_CLICK, mButtonClick);
			addEventListener(gameNEvent.BLD_CLICK, buildingClick);
			
			gTick = 50
			gTimer = new Timer(gTick, 0);
			gTimer.addEventListener(TimerEvent.TIMER, gameLoop);
			gTimer.start();
			_gameDisplay.updateDisplay(_gameData);
		}
		
		private function loadBuildings(e:Event):void{
			var xml:XML = new XML(dataLoader.data);
			var buildings:XMLList = xml.building;
			_gameDisplay._bDisplay.displayBuildings(buildings);
			_gameData.buildingDataSetup(buildings)
		}
		
		private function mButtonClick(e:gameEvent):void{
			//trace("mButton click : " + e.toString());
			_gameData.addCurrency();
			_gameData.addClicks();
			_gameDisplay.updateDisplay(_gameData);
		}
		private function buildingClick(e:gameEvent):void{
			var bTier = e.target.tier;
			//	Check to see if the building can be afforded, if it can, buy it
			if( _gameData.buyBuilding(bTier, 1) ){
				_gameDisplay.updateDisplay(_gameData);
			}
		}
		
		private function gameLoop(e:TimerEvent):void{
			var tick = 1000 / gTick
			_gameData.addBIncome(tick);
			_gameDisplay.updateDisplay(_gameData);
		}
	}
	
}
