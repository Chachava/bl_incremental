package src.classes.game.buildings {
	
	public class building {
		//	Super class for all buildings.
		
		private var bName:String;
		private var bTier:int;
		private var bId:String;
		private var bBaseCost:Number;
		private var bBaseIncome:Number;
		private var bCount:int;
		private var bVisible:Boolean;
		private var bVendorVisible:Boolean;
		private var bCostMultiplier:Number;
		

		public function building(name:String, tier:int, id:String, baseCost:Number, baseIncome:Number, visibility:Boolean = false, vendorVisibility:Boolean = false) {
			bName = name;
			bTier = tier;
			bId = id;
			bBaseCost = baseCost;
			bBaseIncome = baseIncome;
			bCount = 0;
			bVisible = visibility;
			bVendorVisible = vendorVisibility;
			bCostMultiplier = 1.15;
		}
		
		public function get bN():String{
			return bName;
		}
		public function get bI():String{
			return bId;
		}
		public function get bCost():Number{
			var cost:Number;
			if(bCount == 0){
				cost =  bBaseCost;
			} else {
				//cost = Math.floor(Math.pow(bBaseCost * bCostMultiplier, bCount));
				cost = bBaseCost * Math.pow(bCostMultiplier, bCount);
			}
			return cost;
		}
		public function get baseCost():Number{
			return bBaseCost;
		}
		public function get visibility():Boolean{
			return bVisible;
		}
		public function get vendorVisibility():Boolean{
			return bVendorVisible;
		}
		public function get bCnt():int{
			return bCount;
		}
		
		public function buy(amt:int){
			bCount += amt;
		}
		public function get income():Number{
			var income = bBaseIncome * bCount;
			return income;
			
		}

	}
	
}
