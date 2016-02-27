package src.classes.game {
	
	public class vhInventory {
		
		private var vhInventoryAmmo:Ammo;
		private var vhShield:Shield = null;

		public function vhInventory() {
			vhInventoryAmmo = new Ammo();
			vhShield = new Shield();
		}
		
		public function get inventoryAmmo():Ammo{
			return vhInventoryAmmo;
		}
		public function get shield():Shield{
			return vhShield;
		}

	}
	
}
