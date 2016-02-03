package classes.display {
	
	import flash.display.MovieClip;
	import classes.utils.numberUtils;
	
	public class statsDisplay extends MovieClip {
		
		
		public function statsDisplay() {
			totalCurrency_tf.text = "0";
			clicksGame_tf.text = "0";
			clicksTotal_tf.text = "0";
		}
		
		public function updateDisplay(cData:Object, mData:Object):void{
			totalCurrency_tf.text = numberUtils.prettyNum(cData.moneyTotal);
			clicksGame_tf.text = numberUtils.prettyNum(mData.clicksGame);
			clicksTotal_tf.text = numberUtils.prettyNum(mData.clicksTotal);
		}
	}
	
}
