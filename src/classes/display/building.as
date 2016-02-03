package classes.display {
	
	import flash.display.MovieClip;
	import flash.events.*;
	import classes.events.gameEvent;
	import classes.utils.numberUtils
	
	
	public class building extends MovieClip {
		
		private var _bTier:int;
		private var _bName:String;
		private var _bCost:Number;
		private var _bCount:int;
		
		public function building(tier, name, cost) {
			_bTier = tier;
			_bName = name;
			_bCost = cost;
			_bCount = 0;
			bName_tf.text = name;
			bCost_tf.text = numberUtils.prettyNum(cost);
			bCount_tf.text = numberUtils.prettyNum(_bCount);
			
			//	If it isn't one of the first 3 buildings make it invisible, for now
			if(tier > 3){
				alpha = 0;
			} else {
				alpha = 0.5;
			}
			addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(e:MouseEvent):void{
			dispatchEvent(new gameEvent(gameEvent.BLD_CLICK));
		}
		public function get cost():int{
			return _bCost;
		}
		public function get tier():int{
			return _bTier;
		}
		
		public function updateButton(cost, count):void{
			//	Updates the button
			_bCost = cost;
			_bCount = count;
			bCost_tf.text = numberUtils.prettyNum(cost);
			bCount_tf.text = numberUtils.prettyNum(count);
		}
		public function checkAfford(money:Number):void{
			if(money > _bCost){
				//	If we can afford the building make it fully opaque;
				alpha = 1;
			} else if(_bCount >= 0 && money < _bCost  && alpha != 0){
				alpha = 0.5;
			}
		}
	}
	
}
