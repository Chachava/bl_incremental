package src.classes.game {
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.events.*;
	
	public class Maps {
		//	Holds data relating to Maps in general including a currentMap property which holds the  current map...oddly enough 
		
		private var maps:Object;
		private var currentMap:Map;
		private var mapList:XML;

		public function Maps() {
			maps = new Object();
			//mapList = new Object();
			//	Load xml map data and store it in mapList as a series of objects
			var mapLoader:URLLoader = new URLLoader;
			var url:URLRequest = new URLRequest("data/maps.xml");
			mapLoader.load(url);
			mapLoader.addEventListener(Event.COMPLETE, onMapsLoad);
		
			
		}
		private function onMapsLoad(e:Event):void{
			mapList = new XML(e.target.data);
			//var mList:XMLList = xml.map;
//			var len:int = mList.length();
//			for(var i:int = 0; i < len; i++){
//				var mId:String = mList[i].@id;
//				mapList[mId] = new Object;
//				mapList[mId]["id"]:String = mId;
//				mapList[mId]["name"]:String = mList[i].name;
//				mapList[mId]["enemies"]:Object = new Object();
//				mapList[mId]["enemies"]["bullymong"]:Boolean;
//				mapList[mId]["enemies"]["bandit"]:Boolean;
//				mapList[mId]["enemies"]["rakk"]:Boolean;
//				mapList[mId]["enemies"]["stalker"]:Boolean;
//			}
//			
			setCurrentMap("windshearWaste");
		}
		
		public function setCurrentMap(id:String):void{
			//var mId:String = mapList[id].id;
//			var mName:String = mapList[id].name;
//			currentMap = new Map(mName, mId);
			currentMap = new Map(mapList.map.(attribute("id") == id));
		}
		
		public function get curMap():Map{
			return currentMap;
		}
	}
	
}
