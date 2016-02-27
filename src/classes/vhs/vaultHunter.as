package src.classes.vhs {
	import src.classes.game.vhInventory;
	import flash.globalization.NumberParseResult;
	import src.classes.game.Melee;
	
	public class vaultHunter {
		//	Everything relevant to all vault hunters
		
		private var vhName:String;
		private var vhClass:String;
		private var vhExp:Number;
		private var vhLevel:int;
		private var vhHealth:Number;
		private var vhHealthMax:Number;
		private var vhMoney:Number;
		private var vhEridium:Number;
		
		public var inventory:vhInventory;
		public var melee:Melee;

		public function vaultHunter(vName:String, vClass:String) {
			vhName = vName;
			vhClass = vClass;
			vhExp = 0;
			vhLevel = 1;
			vhHealth = 100;
			vhHealthMax = 100;
			inventory = new vhInventory();
			vhMoney = 10;
			vhEridium = 5;
			melee = new Melee();
		}
		
		public function get vhN():String{
			return vhName;
		}
		public function get vhLvl():int{
			return vhLevel;
		}
		public function get vhCurExp():Number{
			return vhExp;
		}
		public function get nxtLvlExp():Number{
			var nxtLvl:Number = vhLevel * 1000;
			return nxtLvl;
		}
		public function get vhHP():Number{
			return vhHealth;
		}
		public function get vhMaxHP():Number{
			return vhHealthMax;
		}
		public function get vhMon():Number{
			//return vhMoney;
			return Math.round(vhMoney);
		}
		public function set vhMon(amt:Number):void{
			vhMoney = amt;
		} //	Don't think this is needed now
		public function get vhErid():Number{
			return vhEridium;
		}
		
		public function addMoney(amt:Number):void{
			vhMoney += amt;
		}

	}
	
}
