package src.classes.game {
	import flash.display.Bitmap;
	
	public class Enemy {
		
		private var enemyType:String;
		private var enemyName:String;
		private var enemyId:String;
		private var enemyLvl:int;
		private var enemyHealth:Number;
		private var enemyCurrentHealth:Number;
		private var enemyBaseXP:Number;
		private var enemyShield:Number;
		private var enemyCurrentShield:Number;
		private var enemyBaseDamage:Number;

		public function Enemy(enemyData:XML) {
			enemyType = enemyData.@type;
			enemyName = enemyData.name;
			enemyId = enemyData.id;
			enemyLvl = 1;
			//	Health needs to be calculated based on level in the future. 
			enemyHealth = enemyData.baseHealth;
			enemyCurrentHealth = enemyData.baseHealth
			enemyBaseXP = enemyData.baseXp;
			enemyBaseDamage = enemyData.baseDmg;
			//	Decide if the enemy has a shield or not
			var shieldRand = Math.random();
			if(shieldRand < enemyData.shieldChance){
				//	The enemy has a shield
				//	For now this will just be stuck as the base shield, but as I add enemy levels etc.
				//	it will be calculated based on the enemy level and base amount
				enemyShield = enemyData.baseShield;
				enemyCurrentShield = enemyData.baseShield;
			} else {
				enemyShield = 0;
				enemyCurrentShield = 0;
			}
		}
		
		public function get eName():String{
			return enemyName;
		}
		public function get eId():String{
			return enemyId;
		}
		public function get eMaxHealth():Number{
			return enemyHealth;
		}
		public function get eMaxShield():Number{
			return enemyShield;
		}
		public function get eLvl():int{
			return enemyLvl;
		}
		public function get eHealth():Number{
			return enemyCurrentHealth;
		}
		public function get eShield():Number{
			return enemyCurrentShield;
		}
		
		public function dmgEnemy(amt:Number):void{
			var dmg:Number = amt;
			if(enemyCurrentShield > 0){
				if(enemyCurrentShield < amt) {
					dmg -= enemyCurrentShield;
					enemyCurrentShield = 0;
				} else {
					enemyCurrentShield -= dmg;
					dmg = 0;
				}
			}
			if(dmg > 0){
				if(enemyCurrentHealth < dmg){
					//	This will be where overkill damage is calculated
					enemyCurrentHealth = 0;
				} else {
					enemyCurrentHealth -= dmg;
				}
			}
			
		}

	}
	
}
