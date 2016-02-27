package src.classes.game {
	import src.classes.game.buildings.zedsMeds;
	import src.classes.game.buildings.building;
	
	public class Buildings {
		//	Holds a set of buildings 
		
		private var t1:building;
		private var t2:building;
		private var t3:building;
		private var t4:building;
		private var t5:building;
		private var t6:building;
		private var t7:building;
		private var t8:building;

		public function Buildings() {
			t1 = new zedsMeds();
			t2 = new building("Ammo Dump", 1, "ID", 50, 10, true);
			t3 = new building("Marcus Munitions", 3, "id", 100, 20, true);
			t4 = new building("Name", 4, "id", 150, 40, true);
			t5 = new building("Name", 5, "id", 200, 80, true);
			t6 = new building("Name", 6, "id", 250, 160, true);
			t7 = new building("Name", 7, "id", 300, 320, true);
			t8 = new building("Name", 8, "id", 350, 640, true);
		}
		
		public function getID(tier:int):String{
			//	Returns the ID of a given building tier;
			var id:String = this["t" + tier].bI;
			return id;
		}
		public function getName(tier:int):String{
			var name:String = this["t" + tier].bN;
			return name;
		}
		public function getCost(tier:int):Number{
			var cost:Number = this["t" + tier].bCost;
			return cost;
		}
		public function getBaseCost(tier:int):Number{
			var baseCost:Number = this["t" + tier].baseCost;
			return baseCost;
		}
		public function getVisibility(tier:int):Boolean{
			var visibility:Boolean = this["t" + tier].visibility;
			return visibility;
		}
		public function getVendorVisibility(tier:int):Boolean{
			var visibility:Boolean = this["t" + tier].vendorVisibility;
			return visibility;
		}
		public function getBCount(tier:int):int{
			var count:int = this["t" + tier].bCnt;
			return count;
		}
		
		public function addBuilding(tier:int, amt:int){
			this["t" + tier].buy(amt);
		}
		public function get totalIncome():Number{
			var totIncome:Number = 0;
			for(var i:int = 1; i < 9; i++){
				totIncome += this["t" + i ].income;
			}
			return totIncome;
		}

	}
	
}
