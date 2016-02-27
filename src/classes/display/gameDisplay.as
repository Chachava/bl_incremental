package src.classes.display {
	import src.classes.vhs.*;
	
	import flash.events.*;
	import flash.display.*;
	import flash.net.URLRequest;
	import flash.utils.getDefinitionByName;
	import src.classes.game.Ammo;
	import src.classes.game.Shield;
	import src.classes.game.Buildings;
	import src.classes.display.buildingDisplay;
	import src.classes.game.Map;
	import src.classes.enemyImg.*;
	import src.classes.util.gameUtils;
	import src.classes.game.Enemy;
	
	public class gameDisplay {
		//	Handles any and all display related functions
		private var gui;
		
		public function gameDisplay(theRoot) {
			gui = theRoot;
		}
		
		public function displayVHSelect(e:Event):void{
			//	First empty all fields;
			gui.vhDescrip.vhName_tf.text = "";
			gui.vhDescrip.vhClass_tf.text = "";
			gui.vhDescrip.vhActionSkill_tf.text = "";
			gui.vhDescrip.vhDescription_tf.text = "";
			
			var xml:XML = new XML(e.target.data);
			var vhList:XMLList = xml.vaultHunter;
			var len:int = vhList.length();
			var containerWidth = (len * 85);
			gui.vhContainer.width = containerWidth;
			gui.vhContainer.x =  Math.round((1000 - containerWidth) / 2)
			
			for(var i:int = 0; i < len;i++){
				var name:String = vhList[i].name;
				var actionSkill:String = vhList[i].actionSkill;
				var cls:String = vhList[i].vhClass;
				var desc:String = vhList[i].description;
				var newIcon = new vhIcon(name, actionSkill, cls, desc);
				newIcon.y = 10;
				newIcon.x = (gui.vhContainer.x + 10) + (i * 80);
				newIcon.addEventListener(MouseEvent.CLICK, vhDetail);
				gui.emptyContainer.addChild(newIcon);
			}
			
			gui.vhSelect.visible = false;
		}
		
		private function vhDetail(e:MouseEvent):void{
			//	Load the correct text
			gui.vhDescrip.vhName_tf.text = e.currentTarget.vhName;
			gui.vhDescrip.vhClass_tf.text = e.currentTarget.vhClass;
			gui.vhDescrip.vhActionSkill_tf.text = e.currentTarget.vhActionSkill;
			gui.vhDescrip.vhDescription_tf.text = e.currentTarget.vhDescription;
			
			gui.vhImgFull.removeChildAt(0);
			gui.vhImgFull.addChild(e.currentTarget.vhImg);
			
			gui.vhSelect.visible = true;
		}
		
		public function updateDisplay(vh:vaultHunter, b:Buildings, m:Map, e:Enemy):void{
			//	Set the correct name on the inventory panel
			gui.inventoryPanel.currentVHName_tf.text = vh.vhN;
			updateExpLevel(vh);
			updateInventoryAmmo(vh.inventory.inventoryAmmo);
			updateStageHealth(vh)
			updateStageShield(vh.inventory.shield);
			updateMapName(m);
			updateEnemy(e);
			updateCurrency(vh, b);
			updateBuildings(b);
		}
		public function initBuildings(b:Buildings):void{
			//	Displays the buildings with correct stats based on the 'buildings' object passed to it
			for(var i:int = 1; i < 9; i++){
				var bId:String = b.getID(i);
				var bName:String = b.getName(i);
				var bCost:Number = b.getCost(i);
				var bVisibility:Boolean = b.getVisibility(i);
				var bVendorVisibility:Boolean = b.getVendorVisibility(i);
				var newBuildingDisplay = new buildingDisplay(bId, i, bName, bCost, bVisibility, bVendorVisibility);
				newBuildingDisplay.x = -14;
				newBuildingDisplay.y = (i - 1) * 55 + 29;
				newBuildingDisplay.name = "t" + i;
				gui.buildingsPanel.addChild(newBuildingDisplay);
			}
		}
		
		public function updateExpLevel(vh:vaultHunter):void{
			//	updates the expLevel panel
			gui.expLevelPanel.vhLevel_tf.text = vh.vhLvl.toString();
			gui.expLevelPanel.vhCOMName_tf.text = "";
			//	Set the exp bar to the correct amount
			//	Full width is 416 wide
			var expPercent:Number = vh.vhCurExp / vh.nxtLvlExp;
			updateExp(expPercent);
			updateInventoryAmmo(vh.inventory.inventoryAmmo);
		}
		public function updateExp(percent:Number):void{
			gui.expLevelPanel.vhExpBar.vhExpProgress.width = 416 * percent;
		}
		public function updateInventoryAmmo(vhAmmo:Ammo){
			//	Updates the ammo amounts
			var ammoType:Array = ['pistol', 'assaultRifle', 'shotgun', 'smg', 'sniper', 'launcher', 'grenade'];
			for(var i:int = 0; i < ammoType.length;i++){
				// gui.inventoryPanel.inventoryAmmo
				gui.inventoryPanel.inventoryAmmo[ammoType[i] + "_tf"].text = vhAmmo.getAmmo(ammoType[i]).toString();
				gui.inventoryPanel.inventoryAmmo[ammoType[i] + "Max_tf"].text = vhAmmo.getAmmoMax(ammoType[i]).toString();
			}
		}
		public function updateStageHealth(vh:vaultHunter):void{
			//	Updates the health bar on stage
			var percent:Number = vh.vhHP / vh.vhMaxHP;
			gui.mainStage.stageVHHealth.stageVHHealth_tf.text = vh.vhHP.toString();
			gui.mainStage.stageVHHealth.stageVHHealthBar.width = Math.round(150 * percent);
		}
		public function updateStageShield(shield:Shield):void{
			//	Checks to see if there is a shield, if not it hides the bar, 
			//	if there is it updates it.
			if(shield == null){
				gui.mainStage.stageVHShield.visible = false;
			} else {
				gui.mainStage.stageVHShield.visible = true;
				gui.mainStage.stageVHShield.stageVHShield_tf.text = shield.current.toString();
				var percent:Number = shield.current / shield.capacity;
				gui.mainStage.stageVHShield.stageVHShieldBar.width = Math.round(150 * percent);
			}
			
		}
		public function updateMapName(m:Map):void{
			gui.mainStage.stageMapName_tf.text = m.mName;
		}
		public function updateEnemy(e:Enemy):void{
			gui.mainStage.enemyLvl_tf.text = e.eLvl.toString();
			gui.mainStage.enemyName_tf.text = e.eName;
			//	If the enemy has no shield or it has been depleted, hide the bar, otherwise set 
			//	the bar to the correct level
			if(isNaN(e.eShield) || e.eShield == 0){
				gui.mainStage.enemyShieldDisplay.visible = false;
			} else {
				gui.mainStage.enemyShieldDisplay.visible = true;
				var maxShield = e.eMaxShield;
				var curShield = e.eShield;
				gui.mainStage.enemyShieldDisplay.enemyShieldAmt.width = 80 * (curShield / maxShield)
			}
			//	Set enemy health bar
			var maxHealth = e.eMaxHealth;
			var curHealth = e.eHealth;
			gui.mainStage.enemyHealthDisplay.enemyHealthAmt.width = 80 * (curHealth / maxHealth);
		}
		public function newEnemy(e:Enemy):void{
			var id:String = e.eId;
			var imgClass:Class = getDefinitionByName("src.classes.enemyImg.enemy_" + id) as Class;
			var newImg = new imgClass();
			var enemyBitmap:Bitmap = new Bitmap(newImg);
			gui.mainStage.enemyImage.removeChildAt(0);
			gui.mainStage.enemyImage.addChild(enemyBitmap);
			updateEnemy(e);
		}
		public function updateCurrency(vh:vaultHunter, b:Buildings):void{
			gui.currencyPanel.income_tf.text = "( " + gameUtils.prettyNum(b.totalIncome) + "/s )";
			gui.currencyPanel.money_tf.text = gameUtils.prettyNum(vh.vhMon);
			gui.currencyPanel.eridium_tf.text = gameUtils.prettyNum(vh.vhErid);
		}
		public function updateBuildings(b:Buildings):void{
			var len:int = gui.buildingsPanel.numChildren;
			for(var i:int = 1; i < len; i++){
				var tier:int = gui.buildingsPanel.getChildAt(i).tier;
				gui.buildingsPanel.getChildAt(i).count = b.getBCount(tier);
				gui.buildingsPanel.getChildAt(i).cost = b.getCost(tier);
				gui.buildingsPanel.getChildAt(i).updateIcon();
			}
		}
	}
	
}
