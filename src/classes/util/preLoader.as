package src.classes.util {
	
	import flash.display.MovieClip;
	import flash.display.LoaderInfo;
	import flash.events.*;
	
	
	public class preLoader extends MovieClip {
		
		private var _totalWidth:Number;
		private var _ldrInfo:LoaderInfo;
		
		public function preLoader(totalWidth:Number = 0, ldrInfo:LoaderInfo = null) {
			_totalWidth = totalWidth;
			_ldrInfo = ldrInfo;
			
			addEventListener(Event.ENTER_FRAME, checkLoad);
		}
		
		private function checkLoad(e:Event):void{
			if(_ldrInfo.bytesLoaded == _ldrInfo.bytesTotal && _ldrInfo.bytesTotal > 0){
				//	If it's finished loading
				dispatchEvent(new Event("loadComplete"));
				loadComplete();
			}
			var percent:Number = _ldrInfo.bytesLoaded / _ldrInfo.bytesTotal;
			updateProgress(percent)
		}
		
		private function loadComplete():void{
			removeEventListener(Event.ENTER_FRAME, checkLoad);
		}
		
		private function updateProgress(percent:Number):void{
			progBar.width = _totalWidth * percent;
		}
	}
	
}
