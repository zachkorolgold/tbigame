﻿package tbigame.scripts {
	import flash.display.MovieClip;
	import fl.transitions.Tween;
	import fl.transitions.easing.*;
	import fl.transitions.TweenEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.utils.getDefinitionByName;
	import flash.events.MouseEvent;
	import flash.external.ExternalInterface;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	public class Toolbox extends MovieClip
	{
		
		
		public var index;
		public var menu;
		public var menuScreen;
		public var up;
		public var down;
		public var menuBox;
		public var pad;
		//public var tabletContent;
		public var chart;
		public var clock;
		public var notes = new Array();
		public var tools = new Array();
		private var padX = -105;
		private var padY = 420;
		private var padRot = 30;
		private var scale = .4;
		var theStage;
		var dataNames = new Array("accident", "age", "gcs", "bp", "pName", "lungs", "pupils", "pTemp", "heightWeight");
		function Toolbox(theStage){
			this.theStage = theStage;
			//tabletContent = new tabletLogic(theStage);
			
			clock = new Clock(theStage, 0, 500)
			
			
			//switched to not use notepad for the time being
			/*var sprite = new Chart();
			sprite.buttonMode = true;
			sprite.useHandCursor = true;
			//var myImage:Bitmap = new Bitmap(pad);
			//var sprite:Sprite = new Sprite();
			var padX = -43;
			var padY = 430;
			var padRot = 30;
			var scale = .4;
			sprite.scaleX = scale;
			sprite.scaleY = scale;
			sprite.x = padX;
			sprite.y = padY;
			sprite.rotation = padRot;*/
			
			var tablet = new Tablet();
			tablet.x = padX;
			tablet.y = padY;
			tablet.scaleX = scale;
			tablet.scaleY = scale;
			tablet.rotation = padRot;
			/*for each(var dName in dataNames){
				sprite[dName].visible = false;
			}*/
			this.theStage.addChild(tablet);
			pad = tablet;
			chart = tablet;
			
			//create black box
			//menuBox = new Canvas();
			//menuBox.graphics.beginFill(0x000000, 1);
			//menuBox.graphics.drawRect(0, 0, 800, 72);
			//menuBox.graphics.endFill();
			//menuBox.x=0;
			//menuBox.y=528;
			
			menuBox = new menuDrawer();
			menuBox.x = 0;
			menuBox.y = 518;
			menuBox.width=800;
			menuBox.height=82;
			menuBox.stop();
			theStage.addChild(menuBox); 
			
			//create Buttons
			index = new IndexButton();
			index.x=690;
			index.y=565;
			theStage.addChild(index); 
			
			//create Buttons
			menu = new MenuButton();
			menu.x=690;
			menu.y=530;
			theStage.addChild(menu); 
			
			up = new upButton();
			up.x=640;
			up.y=540;
			//theStage.addChild(up); 
			
			down = new downButton();
			down.x=640;
			down.y=570;
			//theStage.addChild(down); 
			
			for(var i = 0; i<7; i++){
				tools.push(new Tool(theStage, i));
			}
			
			menuScreen = new MenuScreen();
			menuScreen.x=800/2-menuScreen.width/2;
			menuScreen.y=10;
			menuScreen.alpha = 0;
			menuScreen.stop();
			theStage.addChild(menuScreen);
			
			var menuToggle = function(){
				bringForward();
				if(menuScreen.alpha == 0){
					showMenu();
				}else{
					hideMenu();
				}
			}
			
			clock.myAddEventListener(MouseEvent.MOUSE_DOWN, padToggle);
			index.addEventListener(MouseEvent.CLICK, padToggle);
			menu.addEventListener(MouseEvent.CLICK, menuToggle);
			menuScreen.newGame.addEventListener(MouseEvent.CLICK, function(){
				ExternalInterface.call("callToActionscript", 11, 50);
			});
			menuScreen.returnButton.addEventListener(MouseEvent.CLICK, menuToggle);
			
			
			
		}
		public function showPad(){
			padToggle(null, true, false);
			//tabletContent.showTablet();
			
		}
		public function hidePad(){
			padToggle(null, false, true);
			//tabletContent.hideTablet();
		}
		private function padToggle(evt, forceOpen = false, forceClose = false){
			trace("here");
			bringForward();
			if((pad.x<-50 || forceOpen) && !forceClose){
				trace("opening");
				hideMenu();
				createTween(pad, "x", None.easeInOut, 20);
				createTween(pad, "y", None.easeInOut, 5);
				createTween(pad, "scaleX", None.easeInOut, 1);
				createTween(pad, "scaleY", None.easeInOut, 1);
				createTween(pad, "rotation", None.easeInOut, 0, -1, 10, function(){
					//ExternalInterface.call("showTabletContent");
					//tabletContent.showTablet();
				});
				return;
			}
			if(pad.x>=-50 || forceClose){
				trace("closing");
				var myTimer:Timer = new Timer(250, 1);
				myTimer.start();
				myTimer.addEventListener(TimerEvent.TIMER_COMPLETE, function(){
					myTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, arguments.callee);
					myTimer = null;
					createTween(pad, "x", None.easeInOut, padX);
					createTween(pad, "y", None.easeInOut, padY);
					createTween(pad, "scaleX", None.easeNone, scale);
					createTween(pad, "scaleY", None.easeNone, scale);
					createTween(pad, "rotation", None.easeInOut, padRot);
				 });
				 //ExternalInterface.call("hideTabletContent");
				 //tabletContent.hideTablet();
			} 
		}
		
		public function bringForward(){
			var myStage = theStage;
			myStage.setChildIndex(myStage.getChildByName(pad.name), myStage.numChildren-1);
			myStage.setChildIndex(myStage.getChildByName(menuBox.name), myStage.numChildren-1);
			myStage.setChildIndex(myStage.getChildByName(menu.name), myStage.numChildren-1);
			myStage.setChildIndex(myStage.getChildByName(index.name), myStage.numChildren-1);
			//myStage.setChildIndex(myStage.getChildByName(up.name), myStage.numChildren-1);
			//myStage.setChildIndex(myStage.getChildByName(down.name), myStage.numChildren-1);
			myStage.setChildIndex(myStage.getChildByName(menuScreen.name), myStage.numChildren-1);
			for each(var tool in tools){
				tool.bringForward();
			}
		}
		
		public function switchMenuType(type=1, frame=1){
			menuBox.gotoAndStop(type);
			if(type === 1){
				for(var i in tools){
					tools[i].show();
				}
			}else{
				menuBox.questions.gotoAndStop(frame);
				for(var i in tools){
					tools[i].hide();
				}
			}
		}
		
		public function showMenu(){
			padToggle(null, false, true);
			menuScreen.alpha = 1;
			menuScreen.x = 800/2-menuScreen.width/2;
		}
		public function hideMenu(){
			menuScreen.alpha = 0;
			menuScreen.x = -1000000;
		}
		
		public function isEmpty(){
			for each(var tool in tools){
				if(!tool.empty){
					return false;
				}
			}
			return true;
		}
		public function getNextEmpty(){
			for each(var tool in tools){
				if(tool.empty){
					return tool;
				}
			}
		}
		
		public function hide(){
			menuBox.alpha = 0;
			index.alpha = 0;
			menu.alpha = 0;
			up.alpha = 0;
			down.alpha = 0;
			chart.alpha = 0;
			
			chart.buttonMode = false;
			chart.useHandCursor = false;
			for each(var tool in tools){
				tool.hide();
			}
			clock.hide();
		}
		
		public function show(){
			menuBox.alpha = 1;
			index.alpha = 1;
			menu.alpha = 1;
			chart.alpha = 1;
			up.alpha = 1;
			down.alpha = 1;
			chart.buttonMode = true;
			chart.useHandCursor = true;
			for each(var tool in tools){
				tool.show();
			}
			clock.show();
		}
		
		public function addNote(msg){
			createTween(pad, "alpha", None.easeInOut, 0, -1, 30, function(){
				var format:TextFormat = new TextFormat();
				format.font="Arial";
				format.size=15;
		
				
				var textMsg:TextField = new TextField();
				textMsg.text  = msg;
				textMsg.width = 400;
				textMsg.wordWrap = true;
				//textMsg.autoSize = TextFieldAutoSize.LEFT;
				textMsg.setTextFormat(format);
				textMsg.textColor = 0x000000; 
				textMsg.x = 15;
				trace("here", notes);
				if(notes.length == 0){
					textMsg.y = 100;
				}else{
					textMsg.y = notes[notes.length-1].y+notes[notes.length-1].textHeight + 10;
					trace("adding second");
				}
				pad.addChild(textMsg);
				notes.push(textMsg);
				createTween(pad, "alpha", None.easeInOut, 1, -1, 30);
			});
		}
		
		public function makeVisible(note){
			
			createTween(chart, "alpha", None.easeInOut, 0, -1, 30, function(){
				chart[note].visible = true;
				createTween(chart, "alpha", None.easeInOut, 1, -1, 30);
			});
		}
		
		public function removeTools(){
			for each(var tool in tools){
				if(!tool.empty){
					tool.removeTool();
				}
			}
		}
		public function addTool(name, toAdd){
			var tool = getNextEmpty();
			tool.addTool(name, toAdd);
		}
		
		import fl.transitions.Tween;
		import fl.transitions.easing.*;
		import fl.transitions.TweenEvent;
		var tweens:Array = new Array();
		private function createTween(obj:Object, prop:String, type, endVal, startVal = -1, numFrames = 10, callBack:Function = null, useTime:Boolean = false):Tween{
			if(startVal == -1){
				startVal = obj[prop];
			}
			var tempTween:Tween = new Tween(obj, prop, type, startVal, endVal, numFrames, useTime);
			tweens.push(tempTween);
			tempTween.addEventListener(TweenEvent.MOTION_FINISH, tweenEnd);
			
			function tweenEnd(e:TweenEvent):void{
				tempTween.removeEventListener(TweenEvent.MOTION_FINISH, tweenEnd);
				tweens.splice(tweens.indexOf(e.target), 1);
				obj[prop] = endVal;
				if(callBack!=null)
					callBack(e);
			
			}
			
			return tempTween;
		}
		private function addImage(className,x ,y){
			var ClassReference:Class = getDefinitionByName(className) as Class;
			var instance:* = new ClassReference();
			var myImage:Bitmap = new Bitmap(instance);
			var sprite:Sprite = new Sprite();
			sprite.x = x;
			sprite.y = y;
			sprite.addChild(myImage);
			return sprite;
		}

		
	}	
	


	
}