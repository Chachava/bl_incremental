package src.classes.game {
	
	public class Shield {
		
		private var shieldType:String;
		private var shieldCapacity:Number;
		private var shieldCurrent:Number;

		public function Shield() {
			shieldType = "Basic";
			shieldCapacity = 500;
			shieldCurrent = 460;
		}
		
		public function get type():String{
			return shieldType;
		}
		public function get capacity():Number{
			return shieldCapacity;
		}
		public function get current():Number{
			return shieldCurrent;
		}

	}
	
}
