﻿import flash.display.MovieClip;import flash.geom.Point;(function(){  	var theTray =  addImage("tray", WIDTH, 50);	var clipBin =  addImage("raneyClipBin", WIDTH, 50);		createTween(theTray, "x", None.easeInOut, WIDTH-150, -1, 40); 	createTween(clipBin, "x", None.easeInOut, WIDTH-150, -1, 40); //405 300  	var clipNames = ["clipone","cliptwo","clipthree","clipfour", "clipfive", "clipsix", "clipseven", "clipeight", "clipnine", "clipten", "clipeleven", "cliptwelve"];    tbi.rclips = new clips();	var pClipArm = new clipArm();	pClipArm.y = HEIGHT;	pClipArm.x = -(WIDTH*2);	pClipArm.scale = .5;	tbi.rclips.x = 393;	tbi.rclips.y = 226;	stage.addChild(tbi.rclips);	stage.addChild(pClipArm);		pClipArm.gotoAndStop(0);		toolbox.bringForward();				var surgeonDialog = function(callback){		displayMessages(_('focus on raney'), null, null, callback, false, "surgeonFace");	}			var removeArm = function(callback){		var tweens = new Array();		var waiter = null;				tweens.push(createTween(pClipArm, "y", None.easeInOut, HEIGHT, -1, 40, function(){			waiter.kill();			callback();		}));				waiter = waitOnUser(function(){			for(var i in tweens){				tweens[i].fforward();				tweens[i] = null;			}			tweens = null;		});			}			var tweenX = null;	var tweenY = null;	var mousePos = {};	var getMousePos = function(){		mousePos.x = mouseX;		mousePos.y = mouseY;	}			for(var i in clipNames){		tbi.rclips[clipNames[i]].visible = false;	}			stage.addEventListener(MouseEvent.MOUSE_MOVE, getMousePos);	var clipHandMove = timer(25, function(){		var mousex = mousePos.x;		var mousey = mousePos.y;		if(tweenX != null){			tweenX.stop();		}		tweenX = createTween(pClipArm, "x", None.easeInOut, mousex-880);				if(tweenY != null){			tweenY.stop();		}		tweenY = createTween(pClipArm, "y", None.easeInOut, mousey-310);	}, 0);		var talking = false;	var firstHack = true;		var SurgeonButton = new ClickRegion(stage, WIDTH-150, 40, 150, 300, function(){		pClipArm.gotoAndStop(2);	});			var clipCount = 0;		stage.addEventListener(MouseEvent.MOUSE_UP,function(){		if(talking || firstHack || pClipArm.currentFrame !== 2){			firstHack = false;			return;		}		pClipArm.gotoAndStop(1);   		var closest = null;		var dist = 100000000;		mousePos.x = mouseX;		mousePos.y = mouseY;		for(var i in clipNames){			var clip = tbi.rclips[clipNames[i]];			if(clip.visible === true){				continue;			}			var clipPos = {x: (clip.x)+418, y: (clip.y)+245};			var h = hypot(mousePos.x-clipPos.x, mousePos.y-clipPos.y);			trace("Mouse:", mousePos.x, ",",  mousePos.y);			trace("clip", clipNames[i], ": ", clipPos.x, ",", clipPos.y);			if(h < dist && h < 30){				dist = h;				closest = clipNames[i];			}		}		if(closest !== null){			clipCount++;			tbi.rclips[closest].visible = true;		}else{			talking = true;			surgeonDialog(function(){				talking = false;  			});		}		if(clipCount === 12){			clipHandMove.stop();			clipHandMove = null;			stage.removeEventListener(MouseEvent.MOUSE_UP, arguments.callee);			stage.removeEventListener(MouseEvent.MOUSE_MOVE, getMousePos);			createTween(theTray, "x", None.easeInOut, WIDTH, -1, 40); 			createTween(clipBin, "x", None.easeInOut, WIDTH, -1, 40);			SurgeonButton.remove();			removeArm(function(){				remove(pClipArm);				remove(theTray);				remove(clipBin);				lastFrame = -1;				gotoAndStop("Scene_SurgeryPatient");			});		}	});})();