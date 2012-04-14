﻿package tbigame.scripts {	import flash.display.MovieClip;	import fl.transitions.Tween;	import fl.transitions.easing.*;	import fl.transitions.TweenEvent;	import flash.text.TextField;	import flash.text.TextFormat;	import flash.text.TextFieldAutoSize;	import flash.display.Bitmap;	import flash.display.Sprite;	import flash.utils.getDefinitionByName;	import flash.events.MouseEvent;	import flash.external.ExternalInterface;	import flash.events.TimerEvent;	import flash.utils.Timer;	import flash.media.Sound;	import flash.media.SoundChannel;	import flash.media.SoundTransform;	import flash.media.SoundMixer;	public class Toolbox extends MovieClip	{						public var index;		public var menu;		public var menuScreen;		public var up;		public var down;		public var menuBox;		public var pad;		public var chart;		public var clock;		public var speakerButton;		public var volume:SoundTransform;		public var notes = new Array();		public var tools = new Array();		private var padX = -105;		private var padY = 420;		private var padRot = 30;		private var scale = .4;		var theStage;		var scope;		var dataNames = new Array("accident", "age", "gcs", "bp", "pName", "lungs", "pupils", "pTemp", "heightWeight");		function Toolbox(theStage, scope){			this.theStage = theStage;			this.scope = scope;			clock = new Clock(theStage, scope, 0, 500)									//switched to not use notepad for the time being			/*var sprite = new Chart();			sprite.buttonMode = true;			sprite.useHandCursor = true;			//var myImage:Bitmap = new Bitmap(pad);			//var sprite:Sprite = new Sprite();			var padX = -43;			var padY = 430;			var padRot = 30;			var scale = .4;			sprite.scaleX = scale;			sprite.scaleY = scale;			sprite.x = padX;			sprite.y = padY;			sprite.rotation = padRot;*/						var tablet = new Tablet();			tablet.x = padX;			tablet.y = padY;			tablet.scaleX = scale;			tablet.scaleY = scale;			tablet.rotation = padRot;			/*for each(var dName in dataNames){				sprite[dName].visible = false;			}*/			this.scope.addCache(tablet, this.theStage, "Tablet");			pad = tablet;			chart = tablet;						//create black box			//menuBox = new Canvas();			//menuBox.graphics.beginFill(0x000000, 1);			//menuBox.graphics.drawRect(0, 0, 800, 72);			//menuBox.graphics.endFill();			//menuBox.x=0;			//menuBox.y=528;						menuBox = new menuDrawer();			menuBox.x = 0;			menuBox.y = 518;			menuBox.width=800;			menuBox.height=82;			menuBox.stop();			this.scope.addCache(menuBox, this.theStage);			//create Buttons			index = new IndexButton();			index.x=690;			index.y=565;			this.scope.addCache(index, this.theStage);			//create Buttons			menu = new MenuButton();			menu.x=690;			menu.y=530; 			this.scope.addCache(menu, this.theStage);						//up = new upButton();			//up.x=640;			//up.y=540;			//theStage.addChild(up); 						//down = new downButton();			//down.x=640;			//down.y=570;			//theStage.addChild(down); 						for(var i = 0; i<7; i++){				tools.push(new Tool(theStage, scope, i));			}						menuScreen = new MenuScreen();			menuScreen.x=800/2-menuScreen.width/2;			menuScreen.y=10;			menuScreen.alpha = 0;			menuScreen.stop();			this.scope.addCache(menuScreen, this.theStage);						var menuToggle = function(){				bringForward();				if(menuScreen.alpha == 0){					showMenu();				}else{					hideMenu();				}			}						//Mute functionality --------			speakerButton = new MuteToggleButton();			speakerButton.x=650;			speakerButton.y=580;			this.scope.addCache(speakerButton, this.theStage);						if(!volume) { 				volume = new SoundTransform(1); }			speakerButton.addEventListener(MouseEvent.CLICK, toggleSound);			//----									clock.myAddEventListener(MouseEvent.MOUSE_DOWN, padToggle);			index.addEventListener(MouseEvent.CLICK, padToggle);			menu.addEventListener(MouseEvent.CLICK, menuToggle);			menuScreen.newGame.addEventListener(MouseEvent.CLICK, function(){				ExternalInterface.call("callToActionscript", 11, 50);			});			menuScreen.returnButton.addEventListener(MouseEvent.CLICK, menuToggle);											}		public function showPad(){			padToggle(null, true, false);		}		public function hidePad(){			padToggle(null, false, true);		}		private function padToggle(evt, forceOpen = false, forceClose = false){			trace("here");			bringForward();			if((pad.x<-50 || forceOpen) && !forceClose){				trace("opening");				hideMenu();				this.scope.createTween(pad, "x", None.easeInOut, 20);				this.scope.createTween(pad, "y", None.easeInOut, 5);				this.scope.createTween(pad, "scaleX", None.easeInOut, 1);				this.scope.createTween(pad, "scaleY", None.easeInOut, 1);				this.scope.createTween(pad, "rotation", None.easeInOut, 0, -1, 10, function(){					ExternalInterface.call("showTabletContent");				});				return;			}			if(pad.x>=-50 || forceClose){				trace("closing");				var myTimer:Timer = new Timer(250, 1);				myTimer.start();				var scope = this.scope;				myTimer.addEventListener(TimerEvent.TIMER_COMPLETE, function(){					myTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, arguments.callee);					myTimer = null;					scope.createTween(pad, "x", None.easeInOut, padX);					scope.createTween(pad, "y", None.easeInOut, padY);					scope.createTween(pad, "scaleX", None.easeNone, scale);					scope.createTween(pad, "scaleY", None.easeNone, scale);					scope.createTween(pad, "rotation", None.easeInOut, padRot);				 });				 ExternalInterface.call("hideTabletContent");			} 		}				public function bringForward(){			var myStage = theStage;			myStage.setChildIndex(myStage.getChildByName(pad.name), myStage.numChildren-1);			myStage.setChildIndex(myStage.getChildByName(menuBox.name), myStage.numChildren-1);			myStage.setChildIndex(myStage.getChildByName(menu.name), myStage.numChildren-1);			myStage.setChildIndex(myStage.getChildByName(index.name), myStage.numChildren-1);			//myStage.setChildIndex(myStage.getChildByName(up.name), myStage.numChildren-1);			//myStage.setChildIndex(myStage.getChildByName(down.name), myStage.numChildren-1);			myStage.setChildIndex(myStage.getChildByName(menuScreen.name), myStage.numChildren-1);			for each(var tool in tools){				tool.bringForward();			}		}						public function toggleSound(e:MouseEvent):void {    		 volume.volume = volume.volume == 1 ? 0 : 1;    		 SoundMixer.soundTransform = volume;		}				public function sendBackward(){			for each(var tool in tools){				tool.sendBackward();			}		}		public function switchMenuType(type=1, frame=1){			menuBox.gotoAndStop(type);			if(type === 1){				for(var i in tools){					tools[i].show();				}			}else{				menuBox.questions.gotoAndStop(frame);				for(var i in tools){					tools[i].hide();				}			}		}				public function showMenu(){			padToggle(null, false, true);			menuScreen.alpha = 1;			menuScreen.x = 800/2-menuScreen.width/2;		}		public function hideMenu(){			menuScreen.alpha = 0;			menuScreen.x = -1000000;		}				public function isEmpty(){			for each(var tool in tools){				if(!tool.empty){					return false;				}			}			return true;		}		public function getNextEmpty(){			for each(var tool in tools){				if(tool.empty){					return tool;				}			}		}				public function hide(){			trace("made it to the top");			menuBox.alpha = 0;			index.alpha = 0;			menu.alpha = 0;			//up.alpha = 0;			//down.alpha = 0;			chart.alpha = 0;						chart.buttonMode = false;			chart.useHandCursor = false;			trace("made it to the tools");			for each(var tool in tools){				tool.hide();			}			clock.hide();		}				public function show(){			menuBox.alpha = 1;			index.alpha = 1;			menu.alpha = 1;			chart.alpha = 1;			//up.alpha = 1;			//down.alpha = 1;			chart.buttonMode = true;			chart.useHandCursor = true;			for each(var tool in tools){				tool.show();			}			clock.show();		}				public function addNote(msg){			this.scope.createTween(pad, "alpha", None.easeInOut, 0, -1, 30, function(){				var format:TextFormat = new TextFormat();				format.font="Arial";				format.size=15;										var textMsg:TextField = new TextField();				textMsg.text  = msg;				textMsg.width = 400;				textMsg.wordWrap = true;				//textMsg.autoSize = TextFieldAutoSize.LEFT;				textMsg.setTextFormat(format);				textMsg.textColor = 0x000000; 				textMsg.x = 15;				trace("here", notes);				if(notes.length == 0){					textMsg.y = 100;				}else{					textMsg.y = notes[notes.length-1].y+notes[notes.length-1].textHeight + 10;					trace("adding second");				}				this.scope.addCache(textMsg, pad);				notes.push(textMsg);				this.scope.createTween(pad, "alpha", None.easeInOut, 1, -1, 30);			});		}				public function makeVisible(note){						this.scope.createTween(chart, "alpha", None.easeInOut, 0, -1, 30, function(){				chart[note].visible = true;				this.scope.createTween(chart, "alpha", None.easeInOut, 1, -1, 30);			});		}				public function removeTools(){			for each(var tool in tools){				if(!tool.empty){					tool.removeTool();				}			}		}		public function addTool(name, toAdd){			var tool = getNextEmpty();			tool.addTool(name, toAdd);		}					}			}