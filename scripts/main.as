﻿import tbigame.scripts.tbiUtilities;import tbigame.scripts.Message;import tbigame.scripts.Picker;import tbigame.scripts.Tooltip;import tbigame.scripts.Toolbox;import tbigame.scripts.Clock;import tbigame.scripts.Tool;import tbigame.scripts.ClickRegion;import tbigame.scripts.TabletLogic;import flash.external.ExternalInterface;include "globalization.as";include "utility.as";include "tbiUtilities.as";include "gaq.as";///*import flash.media.Sound;import flash.media.SoundChannel;*/trace(this.parent);//trace(this.parent.request);var preloader = this.parent.parent as MovieClip;//trace(this.parent.parent.request);var tbi = {};var scene =10;var HEIGHT = 600;var WIDTH = 800;var toolbox;var lastFrame = 0;var timeline = 0;var clock;//DEBUGGING PURPOSESvar DEBUG = false;//USED TO JUMP TO A SPECIFIC SCENEvar SCENE = 2;//used in heli scenevar toolOrder = new Array("stethoscope");var currentTool = null;var theStage = stage;var tt = new Tooltip(0xFFFFEC,0x000000, stage);var sounds = new Array();toolbox = new Toolbox(stage, this);clock = toolbox.clock;	clock.updateAngle(360);//Globals for surgerytbi.userLine = null;tbi.rclips = null;tbi.muscleback = null;var userCutLine;var userCutLineBlack;tbi.surgeonToolDataFirst = new Array({"className" : "razor", "x": 500, "y" : 60},							 {"className" : "marker", "x": 400, "y" : 250},							 {"className" : "alcohol", "x": 570, "y" : 250},							 {"className" : "iodine", "x": 80, "y" : 130},							 {"className" : "syringe", "x": 300, "y" : 100});							 tbi.surgeonToolDataSecond = new Array({"className" : "boneWax", "x": 370, "y" : 220},							 {"className" : "drills", "x": 0, "y" : 250},							 {"className" : "raneyClip", "x": 570, "y" : 260},							 {"className" : "scalpel", "x": 80, "y" : 190},							 {"className" : "duraScalpel", "x": 80, "y" : 350},							 {"className" : "surgicalSponge", "x": 440, "y" : 30},							 {"className" : "suction", "x": 100, "y" : 100});							 							 if(DEBUG){	var text:TextField = new TextField();	stage.addEventListener(MouseEvent.MOUSE_MOVE, function(){		text.text = "x: "+mouseX + " y: " + mouseY;   	});	stage.addEventListener(Event.ADDED, function(){		stage.setChildIndex(stage.getChildByName(text.name), stage.numChildren-1); 	});	stage.addChild(text);	stage.addEventListener(MouseEvent.MOUSE_DOWN, function(){		trace("{x: "+mouseX+", y: "+mouseY+"},");   	});}/*ExternalInterface.addCallback("restart", restart);function restart() {	var url:String = stage.loaderInfo.url;	var request:URLRequest = new URLRequest(url);	navigateToURL(request,"_level0");}ExternalInterface.addCallback("subJumpToScene", subJumpToScene);*/function subReset() {	clearAll();	//while (numChildren > 0) removeChildAt(0);	//while (stage.numChildren > 0) stage.removeChildAt(0);}function subJumpToScene(scene, time) {	fTrace("as received call to go to", scene, time);	lastFrame = -1;	timeline = time;	gotoAndStop(scene);}stop();var frameLookup = {	2 : {name: 'Scene_Intro', code: function(){include "scenes/Scene_Intro.as"}},	3 : {name: 'Scene_Arrival', code: function(){include "scenes/Scene_Arrival.as"}},	4 : {name: 'Scene_Heli', code: function(){include "scenes/Scene_Heli.as"}},	5 : {name: 'Scene_Drawer', code: function(){include "scenes/Scene_Drawer.as"}},	6 : {name: 'Scene_EMT', code: function(){include "scenes/Scene_EMT.as"}},	7 : {name: 'Scene_Torso', code: function(){include "scenes/Scene_Torso.as"}},	8 : {name: 'Scene_Friend', code: function(){include "scenes/Scene_Friend.as"}},	9 : {name: 'Scene_Head', code: function(){include "scenes/Scene_Head.as"}},	10 : {name: 'Scene_Doctor', code: function(){include "scenes/Scene_Doctor.as"}},	11 : {name: 'Scene_CTRoom', code: function(){include "scenes/Scene_CTRoom.as"}},	12 : {name: 'Scene_CTQuiz', code: function(){include "scenes/Scene_CTQuiz.as"}},	13 : {name: 'Scene_CTScan', code: function(){include "scenes/Scene_CTScan.as"}},	14 : {name: 'Scene_SurgeryPatient', code: function(){include "scenes/Scene_SurgeryPatient.as"}},	15 : {name: 'Scene_SurgeonFace', code: function(){include "scenes/Scene_SurgeonFace.as"}},	16 : {name: 'Scene_SurgeryTray', code: function(){include "scenes/Scene_SurgeryTray.as"}},	17 : {name: 'Scene_SurgeryRoom', code: function(){include "scenes/Scene_SurgeryRoom.as"}},	18 : {name: 'Scene_DoctorOffice', code: function(){include "scenes/Scene_DoctorOffice.as"}},	19 : {name: 'Scene_CTTech', code: function(){include "scenes/Scene_CTTech.as"}}};stage.addEventListener(Event.ENTER_FRAME, function(){	if(currentFrame!=lastFrame){		lastFrame = currentFrame;		trace(lastFrame);		toolbox.hideMenu();		trace(lastFrame);		if(lastFrame === 1){			if(DEBUG){				timeline= 100;				gotoAndStop(17);			}else{				trace("in first menu");				trackPageView("initialize");				toolbox.showMenu();			}		}else{			tbi.sceneOptions = {hideToolbox: false, hideToolboxNextScene: false};			if(typeof(frameLookup[lastFrame]) !== "undefined"){				trace(frameLookup[lastFrame].name);				trackPageView((frameLookup[lastFrame].name+timeline));				frameLookup[lastFrame].code();				cleanupScene(tbi.sceneOptions);			}else{				trace("No SCript set for scene #" + lastFrame);			}		}	}});gotoAndStop(1);function redirect(frame){	trace("here ", frame);	trace(black);	if(black){		black.visible = true;	}	if(tbi.sceneOptions.hideToolboxNextScene === true){		toolbox.hide();	}	gotoAndStop(frame);}//called at the end of scene scriptsfunction cleanupScene(options){	if(black){		black.visible = false;	}	if(tbi.sceneOptions.hideToolbox === false){		toolbox.show();	}	timeline++;}/*var count = 0;stage.addEventListener(MouseEvent.CLICK, function(){	var url:String = stage.loaderInfo.url;	var request:URLRequest = new URLRequest(url);	navigateToURL(request,"_level0");	setTimeout(function(){		lastFrame = -1;			timeline = 100;			gotoAndStop(14);		   }, 1000);});*/