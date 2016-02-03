package classes.data {
	
	public class buildingData {
		private var _count:int;
		private var _cost:Number;
		private var _tier:int;
		private var _costMulti:Number;
		private var _baseIncome:Number;
		
		public function buildingData(tier, cost, income) {
			_count = 0;
			_tier = tier;
			_cost = cost;
			_costMulti = 1.15;
			_baseIncome = income;
		}
		
		public function get count():int{
			return _count;
		}
		public function get cost():Number{
			return _cost;
		}
		public function get tier():int{
			return _tier;
		}
		
		public function get totalIncome():Number{
			return _count * _baseIncome;
		}
		
		public function buy(amt){
			_count += amt;
			for( var i:int = 1; i < amt + 1; i++){
				_cost = Math.floor(_cost * _costMulti);
			}
		}

	}
	
}
