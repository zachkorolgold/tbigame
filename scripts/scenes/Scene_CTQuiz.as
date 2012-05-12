﻿import flash.geom.Point;import flash.display.MovieClip;import tbigame.scripts.Message;var createPopupBox = function(){	var pbox:MovieClip = new popupBox();	pbox.x = WIDTH/2-pbox.width/2;	pbox.y = HEIGHT/2-pbox.height/2;	pbox.gotoAndStop(0);	stage.addChild(pbox);	return pbox}var loadImageAnimation = function(pbox, callback){	pbox.gotoAndStop(2);	var tween = null;	var delayTimer = null;	var pbar = pbox.getChildByName("scanProgress");	pbar = pbox.scanProgress;	var tempFun = function(){		if(delayTimer !== null){			delayTimer.stop();			delayTimer.dispatchEvent(new TimerEvent(TimerEvent.TIMER));			delayTimer = null;		}else{			tween.fforward();		}	}	delayTimer = timer(500, function(){		delayTimer = null;		tween = createTween(pbar, "width", None.easeInOut, 271, -1, 50, function(){			delayTimer = timer(500, function(){				trace("scan done");				stage.removeEventListener(MouseEvent.CLICK, tempFun);				stage.removeChild(pbox);				callback();			});		});	});	stage.addEventListener(MouseEvent.CLICK, tempFun);							}var doctorDialogIntro = function(callbacks, callback){	return callbackMessages(_('doctor quiz intro'), null, null, callbacks, callback, {'hideClose' : true}, "CTTech");		}var doctorDialogAdvanceOption = function(progressCallback){	return callbackMessages(_('side explanation'), null, null, progressCallback, null, {'hideClose' : true}, "CTTech");		}var names = [{id: "frontalLobe", name: "Frontal Lobe", desc : _("frontalLobe").join('')},				{id: "temporalLobe", name: "Temporal Lobe", desc : _("temporalLobe").join('')},				{id: "occipitalLobe", name: "Occipital Lobe", desc : _("occipitalLobe").join('')},				{id: "skull", name: "Skull", desc : _("skull").join('')},				{id: "cerrebellum", name: "Cerebellum", desc : _("cerrebellum").join('')},				{id: "lateralVentrical", name: "Lateral Ventricle", desc : _("lateralVentrical").join('')},				{id: "thalamus", name: "Thalamus", desc : _("thalamus").join('')}]		var doctorDialogRefresherQuiz = function(progressCallback, callback){			var messages = _('refresher quiz start');	for(var i in names){		messages.push(names[i].desc);	}	messages = messages.concat(_('refresher quiz start part 2'));		return callbackMessages(messages, null, null, progressCallback, callback, false, "CTTech");};var doctorDialogFinished = function(progressCallback, callback){	return callbackMessages(_('quiz passed'), null, null, progressCallback, callback, false, "CTTech");};var doctorDialogSidesWrong = function(callback){	return displayMessages(_('sides wrong'), null, null, callback, false, "CTTech");};var doctorDialogSidesCorrect = function(callback){	return displayMessages(_('anatomic landmarks'), null, null, callback, false, "CTTech");};var displayQuiz = function(){	brain = new brainBase();	ct = new ctBase();	brain.x = 60;	brain.y = 180;	ct.x = 510;	ct.y = 180;		desc = new TextField();	desc.x = 50; desc.y = 353;	desc.width = 700; desc.height = 134;	desc.wordWrap = true;					var txt_fmt:TextFormat = new TextFormat();	txt_fmt.size = 24;	desc.defaultTextFormat = txt_fmt;	desc.selectable = false;		pName = new TextField();	pName.x = 310; pName.y = 290;	pName.width = 200; pName.height = 40;	pName.autoSize = TextFieldAutoSize.CENTER; 	pName.selectable = false;		var format:TextFormat = new TextFormat();	format.size = 24;	format.color = 0xFF0000;		pName.defaultTextFormat = format;											for each(var part in names){		brain[part.id].gotoAndStop(0);		part.brainBitMap = new BitmapData(brain[part.id].width, brain[part.id].height, true, 0x00000000);		part.brainBitMap.draw(brain[part.id]); 				ct[part.id+"2"].gotoAndStop(0);		part.ctBitMap = new BitmapData(ct[part.id+"2"].width,ct[part.id+"2"].height, true, 0x00000000);		part.ctBitMap.draw(ct[part.id+"2"]); 			}		stage.addChild(desc);	stage.addChild(pName);	stage.addChild(brain);	stage.addChild(ct);}var brain;var ct;var injuries = new CTScanInjuries();injuries.x = 310;injuries.y = 140;var desc;var pName;toolbox.switchMenuType(2, 1);var refresherQuiz = function(callback){	doctorDialogRefresherQuiz(function(current, prev){		prev--;		current--;		var update = function(spot, num){			if(spot >= 0 && spot <= 6){				brain[names[spot].id].gotoAndStop(num);				ct[names[spot].id+"2"].gotoAndStop(num);				pName.text = names[spot].name;			}else{				pName.text = "";			}		}		update(prev, 0);		update(current, 4);	}, callback);};var resetBrains = function(){	for each(var part in names){		brain[part.id].gotoAndStop(1);		ct[part.id+"2"].gotoAndStop(1);		pName.text = "";		desc.text = "";	}};var closingRemarks = function(){	cleanup();	var openHead;	var epIlus;	var epScan;	var subIlus;	var subScan;	doctorDialogFinished(function(current, prev){		//take care of removing appropriate objects		switch(prev){			case 2:case 3:				remove(openHead);			break;			case 4:case 5:				stage.removeChild(injuries);			break;			case 6:case 7:				remove(epIlus);				remove(epScan);			break;			case 8:case 9:				remove(subIlus);				remove(subScan);			break;								}		switch(current){			case 2:case 3:				openHead = addImage('difuse_axonal', 100, 150);			break;			case 4:case 5:				stage.addChild(injuries);				injuries.gotoAndStop(2);			break;			case 6:case 7:				epIlus = addImage('epidural', 100, 150);			break;			case 8:case 9:				subIlus = addImage('subdural', 100, 150);			break;		}	 }, function(){		 gotoAndStop("Scene_CTScan");	 });		}var termExplanation = function(callback){	var ctExplained;	var sliceExplained;	var scanLoc;	var leftBitmap;	var rightBitmap;	var mainMsg;	var reviewMouseMove = function(event){		var p = new Point(mouseX, mouseY);		if(leftBitmap.hitTest(new Point(0,0), 0xFF, injuries.left.globalToLocal(p))){			injuries.left.gotoAndStop(2);		}else{			injuries.left.gotoAndStop(1);		}		if(rightBitmap.hitTest(new Point(0,0), 0xFF, injuries.right.globalToLocal(p))){			injuries.right.gotoAndStop(2);		}else{			injuries.right.gotoAndStop(1);		}		//stage.removeChild(injuries);		//callback();	};		var delayTimer = null;	//flashes message and object frame for time	var flashDelay = function(obj, msg, time){		if(delayTimer){			delayTimer.stop();		}		delayTimer = timer(time, function(){			//only called if the user waits, on click msg removes itself			delayTimer = null;			if(obj){				obj.gotoAndStop(1);			}			if(msg){				msg.remove();			}		});	};	var stopDelay = function(){		if(delayTimer !== null){			delayTimer.stop();			delayTimer = null;		}	}		//checks to see if user clicked on a specific side of brain	var testSide = function(p, bitmap, side, delay, frame, callback){		if(bitmap.hitTest(new Point(0,0), 0xFF, side.globalToLocal(p))){			//reset view			injuries.right.gotoAndStop(1);			injuries.left.gotoAndStop(1);						mainMsg.remove();			stage.removeEventListener(MouseEvent.MOUSE_MOVE, reviewMouseMove);			var msg = callback();			flashDelay(side, msg, delay);			side.gotoAndStop(frame);		}	};		//checks to see if user clicked on a side of brain	var tryClick = function(){		var p = new Point(mouseX, mouseY);		testSide(p, rightBitmap, injuries.right, 3000, 3, function(){			return doctorDialogSidesWrong(function(){				stopDelay();				stage.addEventListener(MouseEvent.MOUSE_MOVE, reviewMouseMove); 			}); 		});		testSide(p, leftBitmap, injuries.left, 20000, 4, function(){			return doctorDialogSidesCorrect(function(){				stopDelay();				stage.removeEventListener(MouseEvent.CLICK, tryClick);				stage.removeChild(injuries);				callback();			}); 		});	};		mainMsg = doctorDialogIntro(function(current, prev){		//handle leaving		switch(prev){			case 1:				stage.removeChild(ctExplained);				break;			case 2:				stage.removeChild(sliceExplained);				break;			case 3:				if(current !== 4){					stage.removeChild(injuries);				}			case 4:				if(current === 3){					stage.removeEventListener(MouseEvent.MOUSE_MOVE, reviewMouseMove);					stage.removeEventListener(MouseEvent.CLICK, tryClick);				}		}				//handle entering		switch(current){			case 1:				ctExplained = addImage("scan_explained", 190, 150);				ctExplained.width = 426;				ctExplained.height = 322;				stage.addChild(ctExplained);				break;			case 2:				sliceExplained = addImage("horizontal_plane", 190, 150);				stage.addChild(sliceExplained);				break;			case 3:				stage.addChild(injuries);				injuries.gotoAndStop(1);								//TODO: take this part and integrate it with other part that's similar				injuries.left.stop();				injuries.right.stop();				leftBitmap = new BitmapData(injuries.left.width, injuries.left.height, true, 0x00000000);				leftBitmap.draw(injuries.left); 								rightBitmap = new BitmapData(injuries.right.width, injuries.right.height, true, 0x00000000);				rightBitmap.draw(injuries.right); 				break;			case 4:				stage.addEventListener(MouseEvent.MOUSE_MOVE, reviewMouseMove);				stage.addEventListener(MouseEvent.CLICK, tryClick);		}	});};var takeTest = function(callback){	var msg;	names = shuffle(names);		var myTween = createTween(brain, "alpha", None.easeInOut, 0, -1, 20, function(){		//just so it doesn't get in the way		brain.x = -800;		myTween = createTween(ct, "x", None.easeInOut, ct.x-250, -1, 50, function(){			myTween = null;  		});		pName.x += 200;	});			var reviewMouseMove = function(event){		var hit = false;		for each(var part in names){			//hitTestPoint			if(brain[part.id].currentFrame !== 3 && brain[part.id].currentFrame !== 4){				var p = new Point(mouseX, mouseY);				if (!hit&&(part.brainBitMap.hitTest(new Point(0,0), 0xFF, brain[part.id].globalToLocal(p)) ||					part.ctBitMap.hitTest(new Point(0,0), 0xFF, ct[part.id+"2"].globalToLocal(p)))){					brain[part.id].gotoAndStop(2);					ct[part.id+"2"].gotoAndStop(2);					hit = true;				}else{					brain[part.id].gotoAndStop(1);					ct[part.id+"2"].gotoAndStop(1);				}			}		}	};	stage.addEventListener(MouseEvent.MOUSE_MOVE, reviewMouseMove);	pName.text = "";	var taskMsg = new Message(stage, null, null, "Identify the "+names[0].name, false, "CTTech");	var lostTime = false;	var delayTimer = null;	var flashDelay = function(id, msg, time){		delayTimer = timer(time, function(){			delayTimer = null;			brain[id].gotoAndStop(1);			ct[id+"2"].gotoAndStop(1);			//pName.text = "";			if(msg){				//msg.remove();			}			if(names.length>0){				pName.text = "";				taskMsg = new Message(stage, null, null, "Identify the "+names[0].name, false, "CTTech");			}		});		}		stage.addEventListener(MouseEvent.CLICK, function(){		if(taskMsg){			//taskMsg.remove();		}		if(myTween !== null){			myTween.fforward();			return;		}		if(names.length === 0){			stage.removeEventListener(MouseEvent.CLICK, arguments.callee);			stage.removeEventListener(MouseEvent.MOUSE_MOVE, reviewMouseMove);			callback();			return;		}		if(delayTimer !== null){			delayTimer.stop();			delayTimer.dispatchEvent(new TimerEvent(TimerEvent.TIMER));			delayTimer = null;			return;		}					 var hit = false;		 for each(var part in names){			//hitTestPoint			var p = new Point(mouseX, mouseY);			trace("about to check", part);			if ((part.brainBitMap.hitTest(new Point(0,0), 0xFF, brain[part.id].globalToLocal(p)) ||				part.ctBitMap.hitTest(new Point(0,0), 0xFF, ct[part.id+"2"].globalToLocal(p)))){				var msg = null;				var msgTime = 2000;				if(names[0].id===part.id){					brain[part.id].gotoAndStop(4);					ct[part.id+"2"].gotoAndStop(4);					msg = new Message(stage, null, null, part.desc, false, "CTTech");					//desc.text = part.desc;					pName.text = part.name;					lostTime = false;					msgTime = 7000;					//pop the front of the array here					names.shift();				}else{					brain[part.id].gotoAndStop(3);					ct[part.id+"2"].gotoAndStop(3);					if(!lostTime){						clock.reduceAngle(4);					};					lostTime = true;					msg = new Message(stage, null, null, _('incorrect brain choice'), false, "CTTech");					names = shuffle(names);				}				flashDelay(part.id, msg, msgTime);				break;			}		}				});};var cleanup = function(){	stage.removeChild(desc);	stage.removeChild(pName);	stage.removeChild(brain);	stage.removeChild(ct);}switch(timeline){	case 53:		var pbox = null;				termExplanation(function(){			var docMsg = doctorDialogAdvanceOption(function(current, prev){				if(current === 1 && pbox === null){					pbox = createPopupBox();					pbox.scanButton.addEventListener(MouseEvent.CLICK, function(){						 docMsg.remove();						 pbox.scanButton.removeEventListener(MouseEvent.CLICK, arguments.callee);						 loadImageAnimation(pbox, function(){							displayQuiz();							refresherQuiz(function(){								resetBrains();								takeTest(closingRemarks); 							});						});					});				}			});		});				break;}timeline++;