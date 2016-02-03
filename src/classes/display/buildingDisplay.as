package classes.display {
	
	import flash.display.MovieClip;
	import classes.display.building;
	
	
	public class buildingDisplay extends MovieClip {
		private var _buildings:Object;
		
		public function buildingDisplay() {
		}
		
		public function displayBuildings(buildings:XMLList):void{
			//	Generates each of the buildings from the XML
			//	and adds them to the _buildings object as t1, t2 etc. 
			_buildings = new Object();
			var len = buildings.length();
			for( var i:int = 0; i < len; i++){
				var bTier:int = buildings[i].@tier;
				var bName:String = buildings[i].@name;
				var bCost:Number = buildings[i].@cost;
				var build:building = new building(bTier, bName, bCost);
				_buildings["t" + bTier] = build;
				build.x = 44;
				build.y = 27 + (i * 70)
				addChild(build);
				
			}
		}
		
		public function updateDisplay(bData, cData){
			//	Updates the display of all buildings
			for(var b in bData){
				var t = bData[b].tier;
				var count = bData[b].count;
				var cost = bData[b].cost;
				_buildings["t" + t].updateButton(cost, count);
				_buildings["t" + t].checkAfford(cData.money);
			}
		}
	}
	
}
