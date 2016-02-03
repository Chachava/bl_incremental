package classes.events {
	import flash.events.Event;
	
	public class gameEvent extends Event{
		
		public static const BTN_CLICK:String = "buttonClick";
		public static const BLD_CLICK:String = "buildingClick";

		public function gameEvent(type:String, bubbles:Boolean = true, cancelable:Boolean = false) {
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event{
			return new gameEvent(type, bubbles, cancelable);
		}
		override public function toString():String{
			return formatToString("gameEvent", "type"); 
		}

	}
	
}
