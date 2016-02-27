package src.classes.game {
	
	public class mapData {
		//	Holds data and statistics relevant to a map, things like it's unlock status and times played etc. 
		
		private var unlocked:Boolean;
		private var mapName:String;
		private var mapId:String;

		public function mapData(name:String, id:String) {
			mapName = name;
			mapId = id;
		}

	}
	
}
