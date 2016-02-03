package classes.display {
	
	import flash.display.MovieClip;
	import flash.events.*;
	import classes.events.gameEvent;
	
	public class mainButton extends MovieClip {
		
		private var tempEnemies:Array = ["Skag", "Loader", "Stalker", "Goliath", "Bandit", "Constructor", "Varkid"];
		
		public function mainButton() {
			
			var enemyId = Math.floor(Math.random()* tempEnemies.length);
			mainButtonName_tf.text = tempEnemies[enemyId];
			
			addEventListener(MouseEvent.CLICK, onClick);
		}
		
		public function changeEnemy(){
			var enemyId = Math.floor(Math.random()* tempEnemies.length);
			mainButtonName_tf.text = tempEnemies[enemyId];
		}
		
		private function onClick(e:MouseEvent):void{
			dispatchEvent(new gameEvent(gameEvent.BTN_CLICK));
		}

	}
	
}
