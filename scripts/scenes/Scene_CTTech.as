﻿(function(){	 switch(timeline){	case 75:		var DoctorDialog = function(callback){			displayMessages(_('submit electronic report'), null, null, callback, false);		}		fadeIn(function(){			 DoctorDialog(function(){				//ExternalInterface.call("showCTReportOption"); DEPRECATED				toolbox.pad.toggleCtReport(function(){						var DoctorDialog = function(callback){							displayMessages(_('talk to doctor'), null, null, callback, false);						}						//close pad (hopefully)						toolbox.pad.padToggle(null, null, null);						var msg = DoctorDialog(function(){							SurgeonButton.createHighlight();   						});						var SurgeonButton:ClickRegion = new ClickRegion(stage, 0, 115, 175, 350, function(){							SurgeonButton.remove();							fadeOut(function(){								timeline = 76;								gotoAndStop("Scene_DoctorOffice");							});						}); 				   }, 				   function(){					    var DoctorDialog = function(callback){							displayMessages(_('finish form'), null, null, callback, false);					   	}						//seems pretty silly, I'm sure there's a more sensical way.						DoctorDialog(function(){});				}); //end callback			 });		});	 	 break;	 }})();timeline++;