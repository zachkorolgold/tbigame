﻿(function(){	function pickedEvidence(evNum) 	{		toolbox.menuBox.questions.gotoAndStop(evNum+5);	} switch(timeline){	case 75:		var DoctorDialog = function(callback){			var messages = new Array("Now that the scan is complete, we need to submit the information using this electronic report.",									 "I’ve just sent it to your Med-tablet.");			displayMessages(messages, 50, 60, callback, false);		}		toolbox.switchMenuType(2, 1);		fadeIn(function(){			 DoctorDialog(function(){				ExternalInterface.call("showCTReportOption");			 });		});	 	 break;	 case 76:	 	toolbox.hidePad();		toolbox.switchMenuType(2, 1);		var DoctorDialog = function(callback){			var messages = new Array("Hello there. I was just looking at the form you sent...",									 "Looking at the information you’ve collected, I would like to know your opinion as a medical student:",									 "what do you think should be the next step?");			displayMessages(messages, 50, 60, callback, false);		}		var DoctorDialog1_a = function(callback){			removeQuestionListeners();			var messages = new Array("On the contrary, I see evidence from the CT scan that suggests that we can’t wait.",									 "What do you think we should do instead?");			displayMessages(messages, 50, 60, addQuestionListeners, false);		}		var DoctorDialog1_b = function(callback){			removeQuestionListeners();			var messages = new Array("Don’t be so negative! You should know from your training that there is something we should do.",									 "What is it?");			displayMessages(messages, 50, 60, addQuestionListeners, false);		}		var DoctorDialog1_c = function(callback){			removeQuestionListeners();			var messages = new Array("I agree that the patient needs surgery. What evidence from the CT scan makes you say that?");			displayMessages(messages, 50, 60, advance, false);		}		var DoctorDialog1_d = function(callback){			removeQuestionListeners();			var messages = new Array("MRIs do show a clearer image, but they take a lot longer to process than CT scans. We need a faster course of action; what do you think we should do?");			displayMessages(messages, 50, 60, addQuestionListeners, false);		}		var DoctorDialog1_e = function(callback){			removeQuestionListeners();			var messages = new Array("This is a viable option but there is something else we should do that will help the patient even more. What do you think?");			displayMessages(messages, 50, 60, addQuestionListeners, false);		}		var advance = function(){			toolbox.menuBox.questions.gotoAndStop(1);			toolbox.showPad();			ExternalInterface.call("pickEvidence");		}		var removeQuestionListeners = function(){			toolbox.menuBox.questions.ct_question1_a.removeEventListener(MouseEvent.CLICK, DoctorDialog1_a);			toolbox.menuBox.questions.ct_question1_b.removeEventListener(MouseEvent.CLICK, DoctorDialog1_b);			toolbox.menuBox.questions.ct_question1_c.removeEventListener(MouseEvent.CLICK, DoctorDialog1_c);			toolbox.menuBox.questions.ct_question1_d.removeEventListener(MouseEvent.CLICK, DoctorDialog1_d);			toolbox.menuBox.questions.ct_question1_e.removeEventListener(MouseEvent.CLICK, DoctorDialog1_e);		}		var addQuestionListeners = function(){			toolbox.menuBox.questions.ct_question1_a.addEventListener(MouseEvent.CLICK, DoctorDialog1_a);			toolbox.menuBox.questions.ct_question1_b.addEventListener(MouseEvent.CLICK, DoctorDialog1_b);			toolbox.menuBox.questions.ct_question1_c.addEventListener(MouseEvent.CLICK, DoctorDialog1_c);			toolbox.menuBox.questions.ct_question1_d.addEventListener(MouseEvent.CLICK, DoctorDialog1_d);			toolbox.menuBox.questions.ct_question1_e.addEventListener(MouseEvent.CLICK, DoctorDialog1_e);		}		DoctorDialog(function(){			toolbox.menuBox.questions.gotoAndStop(2);			addQuestionListeners();		});		//need to remove after click		ExternalInterface.addCallback("pickedEvidence", pickedEvidence);			 break;	 case 77:	 	toolbox.hidePad();		toolbox.switchMenuType(2, 1);				var DoctorDialog2_a = function(callback){			removeQuestionListeners();			var messages = new Array("Hm...besides the location, though, there is a better reason for performing surgery in this case.");			displayMessages(messages, 50, 60, advance, false);		}		var DoctorDialog2_b = function(callback){			removeQuestionListeners();			var messages = new Array("This might be true, but it is not a specific enough reason for performing surgery.");			displayMessages(messages, 50, 60, advance, false);		}		var DoctorDialog2_c = function(callback){			removeQuestionListeners();			var messages = new Array("This isn’t necessary--the CT scan shows us enough information.",									 "What is it about the damage that should prompt us to perform surgery?");			displayMessages(messages, 50, 60, advance, false);		}				var advance = function(){			toolbox.menuBox.questions.gotoAndStop(1);			toolbox.showPad();			ExternalInterface.call("pickEvidence");		}		var removeQuestionListeners = function(){			toolbox.menuBox.questions.ct_question2_a.removeEventListener(MouseEvent.CLICK, DoctorDialog2_a);			toolbox.menuBox.questions.ct_question2_b.removeEventListener(MouseEvent.CLICK, DoctorDialog2_b);			toolbox.menuBox.questions.ct_question2_c.removeEventListener(MouseEvent.CLICK, DoctorDialog2_c);		}		var addQuestionListeners = function(){			toolbox.menuBox.questions.ct_question2_a.addEventListener(MouseEvent.CLICK, DoctorDialog2_a);			toolbox.menuBox.questions.ct_question2_b.addEventListener(MouseEvent.CLICK, DoctorDialog2_b);			toolbox.menuBox.questions.ct_question2_c.addEventListener(MouseEvent.CLICK, DoctorDialog2_c);		}		toolbox.menuBox.questions.gotoAndStop(3);		addQuestionListeners();				//need to remove after click		ExternalInterface.addCallback("pickedEvidence", pickedEvidence);			 	 break;	 case 78:	 	toolbox.hidePad();		toolbox.switchMenuType(2, 1);				var DoctorDialog3_a = function(callback){			removeQuestionListeners();			var messages = new Array("I agree with your evidence. What is the danger if we do not remove the hematoma?");			displayMessages(messages, 50, 60, advance, false);		}		var DoctorDialog3_b = function(callback){			removeQuestionListeners();			var messages = new Array("This isn’t necessary--the CT scan shows us enough information.",									 "What is it about the damage that should prompt us to perform surgery? ");			displayMessages(messages, 50, 60, addQuestionListeners, false);		}				var advance = function(){			toolbox.menuBox.questions.gotoAndStop(1);			lastFrame = -1;			gotoAndStop("Scene_DoctorOffice");		}		var removeQuestionListeners = function(){			toolbox.menuBox.questions.ct_question3_a.removeEventListener(MouseEvent.CLICK, DoctorDialog3_a);			toolbox.menuBox.questions.ct_question3_b.removeEventListener(MouseEvent.CLICK, DoctorDialog3_b);		}		var addQuestionListeners = function(){			toolbox.menuBox.questions.ct_question3_a.addEventListener(MouseEvent.CLICK, DoctorDialog3_a);			toolbox.menuBox.questions.ct_question3_b.addEventListener(MouseEvent.CLICK, DoctorDialog3_b);		}		toolbox.menuBox.questions.gotoAndStop(4);		addQuestionListeners();					 break;	 case 79:	 	toolbox.hidePad();		toolbox.switchMenuType(2, 1);				var DoctorDialog4_a = function(callback){			removeQuestionListeners();			var messages = new Array("Blood loss is not an issue at this time because the blood is trapped against the brain.", 									 "What should we be more concerned about? ");			displayMessages(messages, 50, 60, addQuestionListeners, false);		}		var DoctorDialog4_b = function(callback){			removeQuestionListeners();			var messages = new Array("That’s not quite why hematomas next to the brain are dangerous.", 									 "Do you remember why they are dangerous?");			displayMessages(messages, 50, 60, addQuestionListeners, false);		}		var DoctorDialog4_c = function(callback){			removeQuestionListeners();			var messages = new Array("Excellent! Pressure on the brain can cause even more damage than the original injury.", 									 "I can see that you are a well-studied medical student.");			displayMessages(messages, 50, 60, advance, false);		}				var advance = function(){			toolbox.menuBox.questions.gotoAndStop(1);			lastFrame = -1;			gotoAndStop("Scene_DoctorOffice");		}		var removeQuestionListeners = function(){			toolbox.menuBox.questions.ct_question4_a.removeEventListener(MouseEvent.CLICK, DoctorDialog4_a);			toolbox.menuBox.questions.ct_question4_b.removeEventListener(MouseEvent.CLICK, DoctorDialog4_b);			toolbox.menuBox.questions.ct_question4_c.removeEventListener(MouseEvent.CLICK, DoctorDialog4_c);		}		var addQuestionListeners = function(){			toolbox.menuBox.questions.ct_question4_a.addEventListener(MouseEvent.CLICK, DoctorDialog4_a);			toolbox.menuBox.questions.ct_question4_b.addEventListener(MouseEvent.CLICK, DoctorDialog4_b);			toolbox.menuBox.questions.ct_question4_c.addEventListener(MouseEvent.CLICK, DoctorDialog4_c);		}		toolbox.menuBox.questions.gotoAndStop(5);		addQuestionListeners();					 break;	 case 80:	 	var DoctorDialog = function(callback){			var messages = new Array("We will recommend the patient for surgery so that the hematoma can be removed and pressure on the brain can be reduced.", 									 "Doctor Charles Drew, the neurosurgeon, and his team will prep the patient,",									 "but they will need your help performing the surgery.",									 "Why don’t you head over to surgery now?");			displayMessages(messages, 50, 60, callback, false);		}		DoctorDialog(function(){			var SurgeonButton:ClickRegion = new ClickRegion(stage, 700, 0, 100, 450, function(){				fadeOut(function(){					toolbox.menuBox.questions.gotoAndStop(1);					toolbox.switchMenuType(1);					timeline = 100;					gotoAndStop("Scene_SurgeryRoom");				});			}); 		});					   break; }})();timeline++;