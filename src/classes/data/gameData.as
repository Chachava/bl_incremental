package classes.data  {
	import classes.data.buildingData;
	public class gameData {
		
		private var _currency:Object;	//	Holds any currency related data
		private var _buildings:Object;	//	A set of buildingData objects holding all relevant data	
		private var _misc:Object; 		//	Holds miscellaneous data like button clicks etc. 
		
		public function gameData() {
			//	CURRENCY
			_currency = new Object();
			_currency.money = 0;
			_currency.moneyTotal = 0;
			_currency.mps = 0;
			//	BUILDINGS
			_buildings = new Object;
			//	MISC
			_misc = new Object;
			_misc.clicksGame = 0;
			_misc.clicksTotal = 0;
			
		}
		//	Getters and Setters
		public function get currency():Number{
			return _currency.money;
		}
		public function get cData():Object{
			return _currency;
		}
		public function get bData():Object{
			return _buildings;
		}
		public function get mData():Object{
			return _misc;
		}
		
		//	Set up functions
		public function buildingDataSetup(buildings:XMLList):void{
			var len:int = buildings.length();
			for( var i:int = 0; i < len; i++){
				var tier = i + 1;
				var cost = buildings[i].@cost;
				var base = buildings[i].@base;
				_buildings["t" + (i + 1)] = new buildingData(tier, cost, base);
			}
		}
		
		//	All data related functions, adding buildings etc. 
		public function addCurrency():void{
			_currency.money++;
			_currency.moneyTotal++;
		}
		public function addClicks():void{
			_misc.clicksGame++;
			_misc.clicksTotal++;
		}
		public function buyBuilding(t:String, amt:int):Boolean{
			var b = _buildings["t" + t];
			if( b.cost <= _currency.money ){
				_currency.money -= b.cost;
				b.buy(amt)
				calcMPS();
				return true;
			} else {
				return false;
			}
		}
		public function addBIncome(tick:Number):void{
			_currency.money += _currency.mps / tick;
			_currency.moneyTotal += _currency.mps / tick;
		}
		
		private function calcMPS():void{
			_currency.mps = 0;
			for(var b in _buildings){
				_currency.mps += _buildings[b].totalIncome;
			}
		}

	}
	
}
