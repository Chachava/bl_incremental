package  src.classes.game{
	import src.classes.vhs.vaultHunter;
	import src.classes.vhs.vhSalvador;
	import src.classes.vhs.vhMaya;
	import src.classes.vhs.vhZero;
	import src.classes.vhs.vhAxton;
	import src.classes.game.Buildings;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.events.*;
	import flash.utils.Timer;
	
	public class gameState extends EventDispatcher {
		//	A class holding all the game state elements. 
		
		private var currentVH:vaultHunter;
		private var currentBuildings:Buildings;
		private var maps:Maps;
		private var enemies:Enemies;
		private var buildingTimer:Timer;
		private var bTimerTick:int;

		public function gameState() {
			currentBuildings = new Buildings();
			maps = new Maps();
			enemies = new Enemies();
			bTimerTick = 1000;
			buildingTimer = new Timer(bTimerTick, 0);
			buildingTimer.addEventListener(TimerEvent.TIMER, buildingTick);
		}

		public function set curVH(vh:vaultHunter):void{
			currentVH = vh;
		}
		public function get curVH():vaultHunter{
			return currentVH;
		}
		public function get curB():Buildings{
			return currentBuildings;
		}
		public function get curMap():Map{
			return maps.curMap;
		}
		public function get curEnemy():Enemy{
			return enemies.curEnemy;
		}
		
		public function startTimers():void{
			buildingTimer.start();
		}
		
		public function buyBuilding(e:Event):void{
			if(currentVH.vhMon >= e.target.cost){
				//	Buy the building if you have the money
				currentVH.vhMon = currentVH.vhMon - e.target.cost;
				currentBuildings.addBuilding(e.target.tier, 1);
				dispatchEvent(new Event("updateDisplay", true));
				
			} else {
				trace("Not enough money");
			}
		}
		
		private function buildingTick(e:TimerEvent):void{
			//	This triggers 5 times a second and updates the vault hunters currency based on the buildings owned
			var income:Number = currentBuildings.totalIncome / (1000 / bTimerTick);
			currentVH.addMoney(income);
			dispatchEvent(new Event("updateDisplay", true));
		}
		
		public function meleeDmg(e:MouseEvent):void{
			//	Calculates and applies melee damage to enemy
			var amt:Number = currentVH.melee.meleeDmg;
			enemies.currentEnemy.dmgEnemy(amt);
			if(enemies.currentEnemy.eHealth == 0){
				//	The enemy is dead and we needs a new one
				enemies.newEnemy(maps.curMap.mEnemyTypes);
				dispatchEvent(new Event("newEnemy", true));
			}
			dispatchEvent(new Event("updateDisplay", true));
		}

	}
	
}
