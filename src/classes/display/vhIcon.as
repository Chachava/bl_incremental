package src.classes.display {
	
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.utils.*;
	
	
	public class vhIcon extends MovieClip {

		private var _name:String;
		private var _class:String;
		private var _actionSkill:String;
		private var _imgIcon:MovieClip;
		private var _imgFull:MovieClip;
		private var _description:String;
		
		public function vhIcon(name:String, actionSkill:String, cls:String, desc:String) {
			_name = name;
			_class = cls;
			_actionSkill = actionSkill;
			_description = desc;
			
			var clsName:String = _name.toLowerCase();
			switch( clsName ){
				case "salvador" :
					_imgIcon = new salvadorIcon();
					_imgFull = new salvadorFull();
					break;
				case "maya" :
					_imgIcon = new mayaIcon();
					_imgFull = new mayaFull();
					break;
				case "zero" :
					_imgIcon = new zeroIcon();
					_imgFull = new zeroFull();
					break;
				case "axton" :
					_imgIcon = new axtonIcon();
					_imgFull = new axtonFull();
					break;
			}
			
			addChild(_imgIcon);
		}
		public function get vhName():String{
			return _name;
		}
		public function get vhClass():String{
			return _class;
		}
		public function get vhDescription():String{
			return _description;
		}
		public function get vhActionSkill():String {
			return _actionSkill;
		}
		public function get vhImg():MovieClip {
			return _imgFull;
		}
	}
	
}
