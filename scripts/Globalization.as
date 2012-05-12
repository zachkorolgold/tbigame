﻿var lang = 0;var dict = {};var nextMsg = "|";//scene surgery traydict['check tools'] = ["Check that you have all the necessary tools"+nextMsg+					   "there’s no time to look for them once we get started."];//scene surgery roomdict['no tools'] = ["I don’t have any tools yet."];dict['doctor needs to talk'] = ["Don’t start yet, I need to talk to you."];dict['collect tools'] = ["I’ve cleaned and prepped the tools for you."+nextMsg+						 "Why don’t you collect the tools on the tray and head over to the patient and we’ll get started?"]dict['first incision'] = ["The patient is ready for the first incision,"+nextMsg+						  "there should be a new set of tools for the next phase of surgery,"+nextMsg+						  "check the tray to make sure they are all ready."];						  						  //scene surgery patientdict['shave head'] = ["The ER removed most of the patients hair, but we want the scalp as clean as possible."+nextMsg+					  "First, use the razor to remove the remaining hair."];dict['shave mistake'] = ["We need to remove any remaining hair before we can continue."];dict['alcohol prep'] = ["Good, we can now sterilize the scalp to prevent infection."+nextMsg+						"First, prep the area with alcohol."];dict['alcohol mistake'] = ["Make sure the entire scalp has been prepared with alcohol before proceeding."];dict['alcohol mistake'] = ["Make sure the entire scalp has been prepared with alcohol before proceeding."];dict['iodine prep'] = ["Now apply the iodine solution to ensure the skin is sterile."];dict['iodine mistake'] = ["Make sure you are using the iodine solution to sterilize the scalp."];dict['marker perp'] = ["Excellent, a good preparation goes a long way in preventing infection."+nextMsg+					   "Now, use the marker to draw the incision line."];dict['marker mistake'] = ["Before wan can make any incisions we need to clearly mark where to cut."];dict['anesthetic prep'] = ["Looks good, We are now ready to inject the local anesthetic into the scalp."];dict['anesthetic mistake'] = ["The syringe should be on your prep tray"];dict['surgery incision'] = ["The patient is now ready for surgery. I will be right here to assist with the procedure."+nextMsg+							"Why don’t you make the first incision?"+nextMsg+							"Grab the scalpel and cut along the line you marked earlier."];dict['incision mistake'] = ["We need to get access to the patient’s skull,"+nextMsg+							"there is a scalpel ready for you to make the first incision."];							dict['pull skin'] = ["Now, I will take over for the next step."+nextMsg+					 "First I will pull back the skin..."];dict['pull muscle'] = ["...And then the muscle"];dict['raney clips prep'] = ["Now, that I’ve pulled back the skin and muscle. You can place the Raney clips along the incision to control the bleeding."+nextMsg+							"Take the clips and make sure to place them evenly along the incision line."];dict['raney clips mistake'] = ["We need to place the Raney clips evenly along the incision line to control the bleeding."];dict['drill holes'] = ["You really need to focus for the next few procedures."+nextMsg+						"Take the high speed drill and make 4 keyholes where I mark on the skull."];dict['drill mistake'] = ["The only way we can cut through the skull is with the high speed drill."];dict['bone bank'] = ["Once all the keyholes are connected, slowly lift off the skull flap and place it in the tray."+nextMsg+					 "It will be sent off to the bone bank for storage until the patient recovers."];					 dict['bone wax prep'] = ["To control the bleeding, spread the bone wax along the cut edges of the skull."];dict['bone wax mistake'] = ["We can’t proceed until the exposed bone has been covered with the bone wax."];dict['dura cut prep'] = ["Ok, we’ve almost exposed the site of injury. Now we need to cut through the dura."];dict['dura cut mistake'] = ["Carefully use the dura scalpel to cut an \"X\" so that I can fold the dura back and access the brain."];dict['hematoma prep'] = ["Looks like your interpretations of the CT imagery were correct, note the hematoma near the right temporal lobe."+nextMsg+									 "We’ll need use irrigation and suction to remove the damaged tissue."+nextMsg+									 "First irrigate a section of the hematoma to break up the clotted blood and then use the suction to carefully remove it."+nextMsg+									 "Work on one section of the hematoma at a time until it is completely removed."];dict['hematoma mistake'] = ["Using suction and irrigation is the best way we can loosen and remove the hematoma."];dict['sponge prep'] = ["It looks like the bleeding is under control,",+nextMsg+						"but we need to pack the damaged area with a gelatin sponge to ensure the injury site clots properly."];dict['sponge mistake'] = ["We can’t be sure the patient will be stable until we use the surgical sponge to clot and damaged blood vessels."];//surgeon facedict['surgery intro'] = ["I’ll walk you through the steps of the surgery. Be careful to do exactly what I say."+nextMsg+								 "If you are sloppy you could endanger the patient’s life and you will lose time from the Golder Hour."+nextMsg+								 "Our goal is to remove the hematoma we detected on the CT scan and control any internal bleeding."+nextMsg+								 "We need to open the skull at the site of injury to allow the  brain to swell."];								 //doctors officedict['next step'] = ["Hello there. I was just looking at the form you sent..."+nextMsg+					 "Looking at the information you’ve collected, I would like to know your opinion as a medical student:"+nextMsg+					 "what do you think should be the next step?"];dict["can't wait"] = ["On the contrary, I see evidence from the CT scan that suggests that we can’t wait."+nextMsg+					  "What do you think we should do instead?"];					  dict['what to do'] = ["Don’t be so negative! You should know from your training that there is something we should do."+nextMsg+					  "What is it?"];dict['surgery evidence'] = ["I agree that the patient needs surgery. What evidence from the CT scan makes you say that?"];dict['mri or ct'] = ["MRIs do show a clearer image, but they take a lot longer to process than CT scans. We need a faster course of action; what do you think we should do?"];dict['help more'] = ["This is a viable option but there is something else we should do that will help the patient even more. What do you think?"];dict['better reason'] = ["Hm...besides the location, though, there is a better reason for performing surgery in this case."];dict['specific reason'] = ["This might be true, but it is not a specific enough reason for performing surgery."];dict['ct is enough'] = ["This isn’t necessary--the CT scan shows us enough information."+nextMsg+						"What is it about the damage that should prompt us to perform surgery?"];						dict['danger of nonremoval'] = ["I agree with your evidence. What is the danger if we do not remove the hematoma?"];dict['why damage indicates surgery'] = ["This isn’t necessary--the CT scan shows us enough information."+nextMsg+										"What is it about the damage that should prompt us to perform surgery? "];										dict['blood loss not issue'] = ["Blood loss is not an issue at this time because the blood is trapped against the brain."+nextMsg+								 "What should we be more concerned about?"];			dict['why hematomas are dangerous'] = ["That’s not quite why hematomas next to the brain are dangerous."+nextMsg+										"Do you remember why they are dangerous?"];dict['pressure on brain dangerous'] = ["Excellent! Pressure on the brain can cause even more damage than the original injury."+nextMsg+										"I can see that you are a well-studied medical student."];dict['surgery recomendation'] = ["We will recommend the patient for surgery so that the hematoma can be removed and pressure on the brain can be reduced."+nextMsg+								 "Doctor Charles Drew, the neurosurgeon, and his team will prep the patient,"+nextMsg+								 "but they will need your help performing the surgery."+nextMsg+								 "Why don’t you head over to surgery now?"];//syringedict['syringe directions'] = ["You need to make 5 injections total, space them out over the entire incision site."];dict['stay close syringe'] = ["Be careful where you inject the anesthetic, stay close to the incision line."];dict['syringe take over'] = ["Looks like you need some help with the injections,"+nextMsg+							"I’ll finish up to make sure they are spread evenly."];//suctiondict['focus on hematoma'] = ["We want to disturb the brain as little as possible, stay focused on the hematoma"];//spongedict['sponge success'] = ["Excellent, that sponge will absorb any excess blood as the patient heals."+nextMsg+						  "The surgical team will take over from here, excellent work!"];//raneydict['focus on raney'] = ["Focus on applying the clips to the incision site."];//drill connectdict['connect keyholes mistake'] = ["If you have trouble connecting the keyholes, take a break and try again, we need to be a precise as possible."];						  //drilldict['keyholes wrong'] =  ["Be careful, the placement of these keyholes is critical for the success of the surgery"];dict['keyholes connect'] = ["Now, slowly use the drill to connect the keyholes."];//introdict['emergency intro'] = ["Dispatcher: 9-1-1, what is your emergency?"+nextMsg+				"Caller: There’s been an accident! He’s not moving!\nWe were biking and he fell and… Oh my gosh…"+nextMsg+				"Dispatcher:  Ma’am, just try to remain calm; help is\nbeing dispatched to your location."];dict['new emergency intro'] = ["Doctor: What’s the patient’s condition?"+nextMsg+				"EMT: 25 year old male with a biking related head injury.\nAirway is clear, normal breathing, stable blood pressure and body temperature.\nIn the helicopter he had limited response to verbal commands and dilated pupils…\nhe passed out just as we were bringing him into the ER."+nextMsg+				"Doctor: Let me see his file…\nbased on his GCS it’s possible the accident caused underlying damage.\nWe won’t know until we get a CT scan."+nextMsg+				"EMT: Thanks, we lost a lot of time in transport,\n the sooner the patient gets treated the better."+nextMsg+				"Doctor: We’re a little shorthanded;\ndo you need the med student to go back out with you?\nWe could use the extra help."+nextMsg+				"EMT: No problem.\n[To player] I think it’s best you see this one through."+nextMsg+				"Doctor:  Thanks…\n[To player] Follow me."];				//ct techdict['submit electronic report'] = ["Now that the scan is complete, we need to submit the information using this electronic report."+nextMsg+									"I’ve just sent it to your Med-tablet."];dict['talk to doctor'] = ["Excellent. Now that you’ve submitted the report, you should check in with Dr. Blackwell about it."];dict['finish form'] = ["You should finish the form before continuing..."];//ct scandict['doctor dialog scan intro'] = ["The patient’s scans will appear on the left."+nextMsg+						 "The display in the lower left shows the position of the scan relative to the patient’s head."+nextMsg+						 "On the right are examples of common brain injuries; you’ll use these if you find any injuries."+nextMsg+						 "First look for irregularities in the patient’s brain."+nextMsg+						 "Click and hold your left mouse button to draw a box around any possible injuries."+nextMsg+						 "Do this for each scan and then press “submit” to classify the damage."];						 //ct quiz//NEEDS TO STAY THIS AMOUNT OF MESSAGES AND IN SAME ORDERdict['doctor quiz intro'] = ["I’ll start with a quick introduction to our imaging system."+nextMsg+						 "A Computerized Tomography (or “CT”) scan is an x-ray that allows us to create an image of a patient’s brain."+nextMsg+						 "We will take images from a series of horizontal ‘slices’ through the head. The view is from the bottom up,"+nextMsg+						 "so remember that the structures on the LEFT side of the CT scan are actually on the RIGHT side of the patient."+nextMsg+						 "In the CT scan image, can you click the part that represents the RIGHT hemisphere of the patient’s brain?"];//NEEDS TO STAY THIS AMOUNT OF MESSAGES AND IN SAME ORDERdict['side explanation'] = ["The CT scans will appear on the right and illustrations of a brain will appear on the left.",							"Click “Begin” to get started."];dict["frontalLobe"] = ["Many functions including executive functions such as attention, short-term memory tasks, planning, and drive. The region appears gray as brain tissue is less dense than bone."]dict["temporalLobe"] = ["Functions include the processing of hearing, language and senses such as temperature, taste, and long term memory."];dict["occipitalLobe"] = ["The center of our visual perception system. This region receives visual signals to identify stationary and moving objects and recognize patterns."];dict["skull"] = ["Made up of the bones of the braincase and face, the framework of the head appears almost white on a CT scan due to the high density of bone."];dict["cerrebellum"] = ["Crucial in motor control, responsible for coordination, precision and timing of motor activity. Its visibility on a CT scan will vary based on where in the brain the image was taken."];dict["lateralVentrical"] = ["Appearing black on a CT scan, they provide a pathway for the circulation of the cerebrospinal fluid, protecting the head from trauma."];dict["thalamus"] = ["A Sensory relay station that receives sensory information from all over the body. Slight changes in density can make the structure visible on a CT scan from surrounding brain tissue."];//NEEDS TO STAY THIS AMOUNT OF MESSAGES AND IN SAME ORDERdict['refresher quiz start'] = ["Take your time examining the appearance of each landmark in both the CT scan (right) and the illustrated image (left)."];//NEEDS TO STAY THIS AMOUNT OF MESSAGES AND IN SAME ORDERdict['refresher quiz start part 2'] = ["Okay, now that you have had a chance to look over the landmarks, let’s see how well you can identify them on the CT scan."+nextMsg+										"Ok, match the terms that appear below with the brain region on the CT image."+nextMsg+										"Move your mouse over the scan to see the regions you select, then click the region you think matches the term to mark your answer."];//NEEDS TO STAY THIS AMOUNT OF MESSAGES AND IN SAME ORDERdict['quiz passed'] = ["Looks like you listened during class!", 					 "Now that you are familiar with a healthy brain, Let’s examine some common injury types as they appear on a CT image."+nextMsg+					 "Here is a CT scan of a patient who sustained an open or penetrating head injury from a gunshot wound to the head."+nextMsg+					 "The arrows are pointing to the air pockets where the bullet damaged the brain."+nextMsg+					 "In other cases, a traumatic brain injury results in a build-up of blood in the head called a hematoma."+nextMsg+					 "This high density collection of blood appears lighter gray or white on a CT scan."+nextMsg+					 "Here is an example of an epidural hematoma."+nextMsg+					 "We identified the type of hematoma because it is lens shaped and forms between the dura mater (the tough membrane that covers the brain) and the skull."+nextMsg+					 "Another type of hematoma is a subdural hematoma, meaning it forms below the dura mater next to the brain."+nextMsg+					 "We can recognize it due to its crescent shape."+nextMsg+					 "Now that you are familiar with the CT imaging system, lets take a look at the patient’s scans"];dict['sides wrong'] = ["Remember, the image you see on the scan is flipped."];dict['anatomic landmarks'] = ["Excellent, now let’s review some of the anatomical landmarks of a healthy brain."];dict['incorrect brain choice'] = ["That’s incorrect, we’ll come back to that one llater..."];function _(str){	if(typeof(dict[str]) === "undefined"){		throw (str + "was undefined");	}	return dict[str][lang].split(nextMsg);}