package src.classes.game {
	
	public class Map {
		
		private var mapName:String;
		private var mapId:String;
		private var mapEnemyTypes:Array;

		public function Map(map:XMLList) {
			mapName = map.name;
			mapId = map.@id;
			mapEnemyTypes = new Array();
			
			//	Parse true/false data for enemy types
			//	I'm sure there's a better way of doing this, but for now this'll do
			var len:int = map.enemies.children().length();
			for(var i:int = 0; i < len; i++){
				if(map.enemies.children()[i] == "true"){
					mapEnemyTypes.push(map.enemies.children()[i].@id);
				}
			}
		}
		
		public function get mName():String{
			return mapName;
		}
		public function get mId():String{
			return mapId;
		}
		public function get mEnemyTypes():Array{
			return mapEnemyTypes;
		}

	}
	
}
