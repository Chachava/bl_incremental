package src.classes.util {
	
	public class gameUtils {
		
		//	Random functions for doing stuff like picking random numbers or formatting a number
		private static var NUM_LIMIT:Number = 1000000;

		public function gameUtils() {
			// constructor code
		}
		public static function randomNumber(min:Number, max:Number):Number{
			var randNum = Math.floor(Math.random() * max);
			return randNum;
		}
		
		public static function numCommas(num:Number):String{
			var numString:String = Math.round(num).toString();
			var rst:String = "";
			while(numString.length > 3){
				var pcs = numString.substr(-3);
				numString = numString.substr(0, numString.length - 3);
				rst = "," + pcs + rst;
			}
			if(numString.length > 0){
				return numString + rst;
			} else {
				return rst;
			}
			
		}
		public static function prettyNum(num:Number):String{
			if(num > NUM_LIMIT){
				//	If the number is higher than the limit turn it into scientific notation
				//return numSci(num);
				return Math.round(num).toExponential(3).replace("+", "");
			} else {
				return numCommas(num);
			}
		}
	}
	
}
