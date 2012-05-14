﻿import flash.display.Sprite;import flash.display.MovieClip;import flash.media.SoundTransform;import flash.utils.Dictionary;function addImage(className,x ,y){	var ClassReference:Class = getDefinitionByName(className) as Class;	var instance:* = new ClassReference();	var myImage:Bitmap = new Bitmap(instance);	var sprite:Sprite = new Sprite();	sprite.x = x;	sprite.y = y;	addCache(myImage, sprite);	//sprite.addChild(myImage);	addCache(sprite, stage);		//sprite.addChild(myImage);	//stage.addChild(sprite);		return sprite;}function forceToFront(obj){	while(obj.parent){		bringToFront(obj.parent, obj);		obj = obj.parent;			}}var adds = new Dictionary(true); function addCache(mc, parn = null, name = null){	if(parn === null){		parn = stage;	}	var obj = {clip: mc, parn: parn, name: name};	adds[mc] = obj;	parn.addChild(mc);}function remove(obj){	if(typeof(adds[obj]) !== "undefined"){		trace("removing through remove cache");		if(typeof(adds[obj].parn) !== "undefined" && obj != null){			adds[obj].parn.removeChild(obj);		}		return;	}	if(obj && obj.parent){		obj.parent.removeChild(obj);	}else{		trace("REMOVE ERROR ON", obj);	}}function clearAll(){	for(var i in adds){		if(adds[i].name !== null){			fTrace("removing", adds[i].name);		}		remove(i);	}	adds = new Dictionary(true);}function resetTools(){	for each(var tool in toolbox.tools){		if(!tool.empty){			var tName = tool.toolName;			var temp = addImage(tool.toolName, tool.tool.x, tool.tool.y);			var props = {"width":tool.tool.width, "x":tool.tool.x, "height":tool.tool.height, "y":tool.tool.y}			tool.removeTool();			tool.addTool(tName, temp, props); 		}	}}function fadeIn(callback = null){	fade(callback, true);}function fadeOut(callback = null){	fade(callback, false);}function fade(callback = null, type = true){	trace("trying to fade", type);	//not actually a sprite	var sprite:MovieClip = new Canvas();	sprite.graphics.beginFill(0x000000, 1);	sprite.graphics.drawRect(0, 0, stage.width, stage.height);	sprite.graphics.endFill();	sprite.width=stage.width;	sprite.height=stage.height;	sprite.alpha = type;	var adv = function(){		tween.fforward();	};		var tween = createTween(sprite, "alpha", Regular.easeInOut, !type, -1, 80, function(){		//stage.removeChild(sprite);		stage.removeEventListener(MouseEvent.CLICK, adv);		if(callback != null){			callback();		}		stage.removeChild(sprite);	});	stage.addEventListener(MouseEvent.CLICK, adv);	stage.addChild(sprite);}/*Helper function to get params in the proper order */function callbackMessages(msgArr, msgX, msgY, triggerCallback=false, callback=null, msgType=false, image=false, special=false){	return displayMessages(msgArr, msgX, msgY, callback, msgType, image, special, triggerCallback);}/* * Displays a message * Options : 		hideClose = false; //true doesn't show the close button on last frame */function displayMessages(msgArr, msgX, msgY, callback, msgType=false, image=false, special=false, triggerCallback=false){	var options = {};	var ret = {};		if(typeof(msgType)==="object"){		options = msgType;	}			if(msgArr.length == 1){		special = true;	}	var msgNum = 0;	ret.msg = null;//:Message = new Message(stage, msgX, msgY, msgArr[0], msgType, image, testState);	var cleanup = function(){		if(ret.msg){			ret.msg.remove();		}		ret.msg = null;	}	var advance = function(evt){		if(typeof evt !== "undefined"){			evt.stopPropagation();		}		cleanup();		if(typeof(triggerCallback)==="function"){			console.log(msgNum+1, msgNum);			triggerCallback(msgNum+1, msgNum);			console.log(msgNum+1, msgNum);			console.log("---------");		}		msgNum++;		if(msgNum<msgArr.length){			showMsg();		}else{			if(typeof(callback) === "function"){				if(special && typeof(options.preventClose) === "undefined"){					stage.removeEventListener(MouseEvent.MOUSE_DOWN, advance);				}				callback();			}		}	}	var previous = function(evt){		evt.stopPropagation();		cleanup();		var prev = msgNum;		msgNum=Math.max(0, msgNum-1);		if(typeof(triggerCallback)==="function"){			console.log(msgNum, prev);			triggerCallback(msgNum, prev);			console.log(msgNum, prev);			console.log("---------");		}		showMsg();	}	var showMsg = function(){		var advCallback = null;		var prevCallback = null;		var ignoreArrow = false;		advCallback = advance;		if(msgNum>=msgArr.length-1){			if(special){				if(typeof(options.preventClose) === "undefined"){					stage.addEventListener(MouseEvent.MOUSE_DOWN, advance);				}				ignoreArrow = true;				advCallback = null;			}else{				ignoreArrow = true;			}		}		if(msgNum>0){			prevCallback = previous;		}		ret.msg = new Message(stage, msgX, msgY, msgArr[msgNum], options, image, advCallback, prevCallback, ignoreArrow);	}	var remove = function(){		if(typeof(ret.msg) === "undefined"){			return;		}		cleanup();		if(special && typeof(options.preventClose) === "undefined"){			stage.removeEventListener(MouseEvent.MOUSE_DOWN, advance);		}		if(typeof(triggerCallback)==="function"){			triggerCallback(-1, msgNum);		}		if(typeof(callback) === "function"){			callback();		}	}	showMsg();	if(typeof(triggerCallback)==="function"){		triggerCallback(0, -1);	}		ret.remove = remove;	ret.advance = advance;	return ret;}function playSound(className, repitions = 1, startPoint = 0, vol=1){	trace(className);	var ClassReference:Class = getDefinitionByName(className) as Class;	var sound = new ClassReference();	var someChannel = new SoundChannel();	var someTransform = new SoundTransform();	someTransform.volume = vol;	someChannel = sound.play(startPoint, repitions,someTransform);	return someChannel;}//waits for the user to click or press spacebar to call the callbackfunction waitOnUser(callback){	var removeListeners = function(){		stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyWrapper);		stage.removeEventListener(MouseEvent.CLICK, clickWrapper);	}	var clickWrapper = function(e){		removeListeners();		callback(e);	}	var keyWrapper = function(e){		if (e.keyCode == Keyboard.SPACE){			clickWrapper(e);		}	}		stage.addEventListener(KeyboardEvent.KEY_DOWN, keyWrapper);	stage.addEventListener(MouseEvent.CLICK, clickWrapper); 	return {		kill: function(){			removeListeners();		},		finish: function(){			clickWrapper();		}	}	}