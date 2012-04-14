﻿import tbigame.scripts.tbiUtilities;
import tbigame.scripts.Message;
import tbigame.scripts.Picker;
import tbigame.scripts.Tooltip;
import tbigame.scripts.Toolbox;
import tbigame.scripts.Clock;
import tbigame.scripts.Tool;
import tbigame.scripts.ClickRegion;
import flash.external.ExternalInterface;
include "utility.as";
include "tbiUtilities.as";
//
/*import flash.media.Sound;
import flash.media.SoundChannel;*/
var tbi = {};
var scene =10;
var HEIGHT = 600;
var WIDTH = 800;
var toolbox;
var lastFrame = 0;
var timeline = 0;
var clock;
//DEBUGGING PURPOSES
var DEBUG = false;
//USED TO JUMP TO A SPECIFIC SCENE
var SCENE = 3;
//used in heli scene
var toolOrder = new Array("stethoscope");
var currentTool = null;
var theStage = stage;
var tt = new Tooltip(0xFFFFEC,0x000000, stage);
var sounds = new Array();
toolbox = new Toolbox(stage, this);
clock = toolbox.clock;	
clock.updateAngle(360);

//Globals for surgery
tbi.userLine = null;
tbi.rclips = null;
tbi.muscleback = null;
var userCutLine;
var userCutLineBlack;

tbi.surgeonToolDataFirst = new Array({"className" : "razor", "x": 500, "y" : 60},
							 {"className" : "marker", "x": 400, "y" : 250},
							 {"className" : "alcohol", "x": 570, "y" : 250},
							 {"className" : "iodine", "x": 80, "y" : 130},
							 {"className" : "syringe", "x": 300, "y" : 100});
							 
tbi.surgeonToolDataSecond = new Array({"className" : "boneWax", "x": 370, "y" : 220},
							 {"className" : "drills", "x": 0, "y" : 250},
							 {"className" : "raneyClip", "x": 570, "y" : 260},
							 {"className" : "scalpel", "x": 80, "y" : 190},
							 {"className" : "duraScalpel", "x": 80, "y" : 350},
							 {"className" : "surgicalSponge", "x": 440, "y" : 30},
							 {"className" : "suction", "x": 100, "y" : 100});
							 
							 
if(DEBUG){
	var text:TextField = new TextField();
	stage.addEventListener(MouseEvent.MOUSE_MOVE, function(){
		text.text = "x: "+mouseX + " y: " + mouseY;   
	});
	stage.addEventListener(Event.ADDED, function(){
		stage.setChildIndex(stage.getChildByName(text.name), stage.numChildren-1); 
	});
	stage.addChild(text);
	stage.addEventListener(MouseEvent.MOUSE_DOWN, function(){
		trace("{x: "+mouseX+", y: "+mouseY+"},");   
	});
}

/*ExternalInterface.addCallback("restart", restart);
function restart() 
{
	var url:String = stage.loaderInfo.url;
	var request:URLRequest = new URLRequest(url);
	navigateToURL(request,"_level0");
}
ExternalInterface.addCallback("subJumpToScene", subJumpToScene);*/

function subReset() 
{
	clearAll();
	//while (numChildren > 0) removeChildAt(0);
	//while (stage.numChildren > 0) stage.removeChildAt(0);
}
function subJumpToScene(scene, time) 
{

	fTrace("as received call to go to", scene, time);
	lastFrame = -1;
	timeline = time;
	gotoAndStop(scene);
}

stop();
stage.addEventListener(Event.ENTER_FRAME, function(){
	if(currentFrame!=lastFrame){
		lastFrame = currentFrame;
		trace(lastFrame);
		toolbox.hideMenu();
		trace(lastFrame);
		switch(lastFrame){
			case 1:
				if(DEBUG){
					timeline= 54;
					gotoAndStop(13);
				}else{
					trace("in first menu");
					toolbox.showMenu();
				}
				break;
			case 2:
				include "scenes/Scene_Intro.as";
				break;
			case 3:
				trace("arrival scene");
				include "scenes/Scene_Arrival.as";
				break;
			case 4:
				trace("heli scene");
				include "scenes/Scene_Heli.as";
				break;
			case 5:
				trace("drawer scene");
				include "scenes/Scene_Drawer.as";
				break;
			case 6:
				trace("EMT scene");
				include "scenes/Scene_EMT.as";
				break;
			case 7:
				trace("Torso scene");
				include "scenes/Scene_Torso.as";
				break;
			case 8: 
				trace("Friend Scene");
				include "scenes/Scene_Friend.as";
				break;
			case 9: 
				trace("Head Scene");
				include "scenes/Scene_Head.as";
				break;
			case 10:
				trace("doctor face scene");
				include "scenes/Scene_Doctor.as";
				break;
			case 11:
				trace("ct scan Room scene");
				include "scenes/Scene_CTRoom.as";
				break;
			case 12:
				trace("ct scan Quiz scene");
				include "scenes/Scene_CTQuiz.as";
				break;
			case 13:
				trace("ct scan scene");
				include "scenes/Scene_CTScan.as";
				break;
			case 14:
				trace("surgery patient scene");
				include "scenes/Scene_SurgeryPatient.as";
				break;
			case 15:
				trace("surgery surgeon scene");
				include "scenes/Scene_SurgeonFace.as";
				break;
			case 16:
				trace("surgery scene tray");
				include "scenes/Scene_SurgeryTray.as";
				break;
			case 17:
				trace("surgery scene room");
				include "scenes/Scene_SurgeryRoom.as";
				break;
			case 18:
				trace("doctors office room");
				include "scenes/Scene_DoctorOffice.as";
				break;
			case 19:
				trace("Ct Tech");
				include "scenes/Scene_CTTech.as";
			default:
				trace("No SCript set for scene #" + lastFrame);
				break;
			
		}
	}
});
gotoAndStop(1);
/*
var count = 0;
stage.addEventListener(MouseEvent.CLICK, function(){
	var url:String = stage.loaderInfo.url;
	var request:URLRequest = new URLRequest(url);
	navigateToURL(request,"_level0");
	setTimeout(function(){
		lastFrame = -1;
			timeline = 100;
			gotoAndStop(14);
		   }, 1000);
});*/




