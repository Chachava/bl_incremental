package classes.events {
	import flash.events.Event;
	
	public class gameNEvent extends Event {
		
		public static const BLD_CLICK:String = "buildingClick";
		private var _value:Number;
		
		public function gameNEvent(type:String, value:Number, bubbles:Boolean = true, cancelable:Boolean = false) {
			_value = value;
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event{
			return new gameNEvent(type, value, bubbles, cancelable);
		}
		override public function toString():String{
			return formatToString("gameNEvent", "type", "value"); 
		}
		
		public function get value():Number{
			return _value;
		}

	}
	
}
