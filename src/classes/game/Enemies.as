package src.classes.game {
	import src.classes.util.gameUtils;
	
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.events.*;
	
	public class Enemies {
		
		private var enemyList:Object;
		public var currentEnemy:Enemy;				//	An enemy object for the current enemy
		private var enemyXML:XML;					//	XML data from the enemies.xml file
		private var enemyImages:Object;				//	id/Bitmap pairing for all loaded images

		public function Enemies() {
			enemyList = new Object();
			//	Load enemy data from the XML file
			var xmlLoader:URLLoader = new URLLoader();
			var url:URLRequest = new URLRequest("data/enemies.xml");
			xmlLoader.load(url);
			xmlLoader.addEventListener(Event.COMPLETE, onEnemyLoad);
		}
		
		public function get curEnemy():Enemy{
			return currentEnemy;
		}
		
		private function onEnemyLoad(e:Event):void{
			//	Put the enemy xml data into the enemyList object
			enemyXML = new XML(e.target.data);
			newEnemy(["bullymong", "bandit"]);
		}
		public function newEnemy(types:Array){
			//	Picks a random enemy from the type given
			//	An array is passed in from the current map which holds the enemy types available
			//	It we first randomly pick a type, then from that type we pick a specific enemy
			var randType:int = gameUtils.randomNumber(0, types.length);
			var type:String = types[randType];
			//	After picking the type we need to then pick an individual enemy
			var newEnemyList:XMLList = enemyXML.enemy.(attribute("type") == type);
			var randEnemy:int = gameUtils.randomNumber(0, newEnemyList.length());
			var enemy:XML = newEnemyList[randEnemy];
			currentEnemy = new Enemy(newEnemyList[randEnemy]);
		}
		
	}
	
}
