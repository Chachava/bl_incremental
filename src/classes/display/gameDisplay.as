package classes.display {
	import classes.data.gameData;
	import classes.display.currencyDisplay;
	import flash.display.MovieClip;
	
	public class gameDisplay extends MovieClip {
		//	A container for all display objects. 
		
		public var _cDisplay:currencyDisplay;
		public var _bDisplay:buildingDisplay;
		public var _uDisplay:upgradeDisplay;
		public var _sDisplay:statsDisplay;
		public var _mButton:mainButton;
		
		public function gameDisplay() {
			var curDisplay:currencyDisplay = new currencyDisplay();
			curDisplay.x = 344;
			curDisplay.y = 10;
			addChild(curDisplay);
			var butDisplay:mainButton = new mainButton();
			butDisplay.x = 374;
			butDisplay.y = 144;
			addChild(butDisplay);
			var buildDisplay:buildingDisplay = new buildingDisplay();
			buildDisplay.x = 705;
			buildDisplay.y = 10;
			addChild(buildDisplay);
			var uDisplay:upgradeDisplay = new upgradeDisplay();
			uDisplay.x = 344;
			uDisplay.y = 390;
			addChild(uDisplay);
			var statDisplay:statsDisplay = new statsDisplay();
			statDisplay.x = 10;
			statDisplay.y = 368;
			addChild(statDisplay);
			
			_cDisplay = curDisplay;
			_bDisplay = buildDisplay;
			_uDisplay = uDisplay;
			_sDisplay = statDisplay;
			_mButton = butDisplay;
		}
		public function set currency(amt:Number){
			_cDisplay.currency_tf.text = amt.toString();
		}
		
		public function updateDisplay(gData:gameData):void{
			//	Updates the entire display based on the gameData object passed to it. 
			_cDisplay.updateDisplay(gData.cData);
			_bDisplay.updateDisplay(gData.bData, gData.cData)
			_sDisplay.updateDisplay(gData.cData, gData.mData);
		}

	}
	
}
