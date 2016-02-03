package classes.display {
	
	import flash.display.MovieClip;
	import classes.data.gameData;
	import classes.utils.numberUtils;
	
	public class currencyDisplay extends MovieClip {
		
		
		public function currencyDisplay() {
			currency_tf.text = "0";
			eridium_tf.text = "0";
			mps_tf.text = "0";
		}
		
		public function updateDisplay(cData:Object):void{
			currency_tf.text = numberUtils.prettyNum(cData.money);
			mps_tf.text = numberUtils.prettyNum(cData.mps)
		}
	}
	
}
