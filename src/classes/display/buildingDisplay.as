package src.classes.display {
	
	import flash.display.MovieClip;
	import flash.events.*;
	
	import src.classes.util.gameUtils;
	
	public class buildingDisplay extends MovieClip {
		
		private var bId:String;
		private var bTier:int;
		private var bName:String;
		private var bCount:int;
		private var bCost:Number;
		private var bVisibility:Boolean;
		private var bVendorVisibility:Boolean;
		
		public function buildingDisplay(id:String, tier:int, name:String, cost:Number, visibility:Boolean = false, vendorVisibility:Boolean = false) {
			bId = id;
			bTier = tier;
			bName = name;
			bCount = 0;
			bCost = cost;
			bVisibility = visibility;
			bVendorVisibility = vendorVisibility;
			visible = visibility
			bVendorIcon.visible = vendorVisibility
			
			updateIcon();
			
			if(visibility == true){
				addEventListener(MouseEvent.CLICK, onBuildingClick);
				if(vendorVisibility == true){
					bVendorIcon.addEventListener(MouseEvent.CLICK, onVendorClick);
				}
			}
		}
		
		public function updateIcon():void{
			bDisplayName_tf.text = bName;
			bDisplayCost_tf.text = gameUtils.prettyNum(bCost);
			bDisplayCount_tf.text = gameUtils.prettyNum(bCount);
		}
		
		private function onBuildingClick(e:MouseEvent):void{
			//	Check to make sure it wasn't the vendor icon that was clicked. 
			if(e.target.name != "bVendorIcon"){
				dispatchEvent( new Event("buildingClick", true));
			}
		}
		private function onVendorClick(e:MouseEvent):void{
			trace("Vendor Clicked");
		}
		public function get id():String{
			return bId;
		}
		public function get cost():Number{
			return bCost;
		}
		public function get tier():int{
			return bTier;
		}
		
		public function set count(amt:int):void{
			bCount = amt;
		}
		public function set cost(amt:Number):void{
			bCost = amt;
		}
	}
	
}
