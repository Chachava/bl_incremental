package src.classes.game {
	
	public class Melee {
		
		private var baseMeleeDmg:Number;
		private var meleeCritChance:Number

		public function Melee() {
			baseMeleeDmg = 35;
			meleeCritChance = 0.05;
		}
		
		public function get meleeDmg():Number{
			var crit:Number = Math.random();
			if(crit < meleeCritChance ){
				return baseMeleeDmg * 2;
			} else {
				return baseMeleeDmg;
			}
		}

	}
	
}
