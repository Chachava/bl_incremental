package src.classes.game {
	
	public class Ammo {
		//	Holds data about ammo
		
		private var pistol:int;
		private var pistolMax:int;
		private var assaultRifle:int;
		private var assaultRifleMax:int;
		private var shotgun:int;
		private var shotgunMax:int;
		private var smg:int;
		private var smgMax:int;
		private var sniper:int;
		private var sniperMax:int;
		private var launcher:int;
		private var launcherMax:int;
		private var grenade:int;
		private var grenadeMax:int;

		public function Ammo() {
			pistol = 0;
			pistolMax = 200;
			assaultRifle = 0;
			assaultRifleMax = 280;
			shotgun = 0;
			shotgunMax = 80;
			smg = 0;
			smgMax = 360;
			sniper = 0;
			sniperMax = 48;
			launcher = 0;
			launcherMax = 12;
			grenade = 0;
			grenadeMax = 3;
		}
		
		public function getAmmo(type:String):int{
			var ammoAmt:int;
			switch(type){
				case "pistol" :
					ammoAmt = pistol;
					break;
				case "assaultRifle" :
					ammoAmt = assaultRifle;
					break;
				case "shotgun" :
					ammoAmt = shotgun;
					break;
				case "smg" :
					ammoAmt = smg;
					break;
				case "sniper" :
					ammoAmt = sniper;
					break;
				case "launcher" :
					ammoAmt = launcher;
					break;
				case "grenade" :
					ammoAmt = grenade;
					break;
			}
			return ammoAmt;
		}
		
		public function getAmmoMax(type:String):int{
			var ammoMaxAmt:int;
			switch(type){
				case "pistol" :
					ammoMaxAmt = pistolMax;
					break;
				case "assaultRifle" :
					ammoMaxAmt = assaultRifleMax;
					break;
				case "shotgun" :
					ammoMaxAmt = shotgunMax;
					break;
				case "smg" :
					ammoMaxAmt = smgMax;
					break;
				case "sniper" :
					ammoMaxAmt = sniperMax;
					break;
				case "launcher" :
					ammoMaxAmt = launcherMax;
					break;
				case "grenade" :
					ammoMaxAmt = grenadeMax;
					break;
			}
			return ammoMaxAmt;
		}

	}
	
}
