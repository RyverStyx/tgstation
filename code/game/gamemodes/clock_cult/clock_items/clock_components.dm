//Components: Used in scripture.
/obj/item/clockwork/component
	name = "meme component"
	desc = "A piece of a famous meme."
	clockwork_desc = null
	resistance_flags = LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	var/component_id //What the component is identified as
	var/cultist_message = "You are not worthy of this meme." //Showed to Nar-Sian cultists if they pick up the component in addition to chaplains
	var/list/servant_of_ratvar_messages = list("ayy" = FALSE, "lmao" = TRUE) //Fluff, shown to servants of Ratvar on a low chance, if associated value is TRUE, will automatically apply ratvarian
	var/message_span = "heavy_brass"

/obj/item/clockwork/component/pickup(mob/living/user)
	..()
	if(iscultist(user) || (user.mind && user.mind.assigned_role == "Chaplain"))
		user << "<span class='[message_span]'>[cultist_message]</span>"
	if(is_servant_of_ratvar(user) && prob(20))
		var/pickedmessage = pick(servant_of_ratvar_messages)
		user << "<span class='[message_span]'>[servant_of_ratvar_messages[pickedmessage] ? "[text2ratvar(pickedmessage)]" : pickedmessage]</span>"

/obj/item/clockwork/component/examine(mob/user)
	..()
	if(is_servant_of_ratvar(user))
		user << "<span class='[message_span]'>You should put this in a slab or cache immediately.</span>"

/obj/item/clockwork/component/belligerent_eye
	name = "belligerent eye"
	desc = "A brass construct with a rotating red center. It's as though it's looking for something to hurt."
	icon_state = "belligerent_eye"
	component_id = "belligerent_eye"
	cultist_message = "The eye gives you an intensely hateful glare."
	servant_of_ratvar_messages = list("\"...\"" = FALSE, "For a moment, your mind is flooded with extremely violent thoughts." = FALSE, "\"...Die.\"" = TRUE)
	message_span = "neovgre"

/obj/item/clockwork/component/belligerent_eye/blind_eye
	name = "blind eye"
	desc = "A heavy brass eye, its red iris fallen dark."
	clockwork_desc = "A smashed ocular warden covered in dents. Might still be serviceable as a substitute for a belligerent eye."
	icon_state = "blind_eye"
	cultist_message = "The eye flickers at you with intense hate before falling dark."
	servant_of_ratvar_messages = list("The eye flickers before falling dark." = FALSE, "You feel watched." = FALSE, "\"...\"" = FALSE)
	w_class = 3

/obj/item/clockwork/component/vanguard_cogwheel
	name = "vanguard cogwheel"
	desc = "A sturdy brass cog with a faintly glowing blue gem in its center."
	icon_state = "vanguard_cogwheel"
	component_id = "vanguard_cogwheel"
	cultist_message = "\"Pray to your god that we never meet.\""
	servant_of_ratvar_messages = list("\"Be safe, child.\"" = FALSE, "You feel unexplainably comforted." = FALSE, "\"Never forget: pain is temporary. The Justiciar's glory is eternal.\"" = FALSE)
	message_span = "inathneq"

/obj/item/clockwork/component/vanguard_cogwheel/pinion_lock
	name = "pinion lock"
	desc = "A dented and scratched gear. It's very heavy."
	clockwork_desc = "A broken gear lock for pinion airlocks. Might still be serviceable as a substitute for a vanguard cogwheel."
	icon_state = "pinion_lock"
	cultist_message = "The gear grows warm in your hands."
	servant_of_ratvar_messages = list("The lock isn't getting any lighter." = FALSE, "\"Damaged gears are better than broken bodies.\"" = TRUE, \
	"\"It could still be used, if there was a door to place it on.\"" = TRUE)
	w_class = 3

/obj/item/clockwork/component/guvax_capacitor
	name = "guvax capacitor"
	desc = "A curiously cold brass doodad. It seems as though it really doesn't appreciate being held."
	icon_state = "guvax_capacitor"
	component_id = "guvax_capacitor"
	cultist_message = "\"Try not to lose your mind - I'll need it. Heh heh...\""
	servant_of_ratvar_messages = list("\"Disgusting.\"" = FALSE, "\"Well, aren't you an inquisitive fellow?\"" = FALSE, "A foul presence pervades your mind, then vanishes." = FALSE, \
	"\"The fact that Ratvar has to depend on simpletons like you is appalling.\"" = FALSE)
	message_span = "sevtug"

/obj/item/clockwork/component/guvax_capacitor/antennae
	name = "mania motor antennae"
	desc = "A pair of dented and bent antennae. They constantly emit a static hiss."
	clockwork_desc = "The antennae from a mania motor. May be usable as a substitute for a guvax capacitor."
	icon_state = "mania_motor_antennae"
	cultist_message = "Your head is filled with a burst of static."
	servant_of_ratvar_messages = list("\"Who broke this.\"" = TRUE, "\"Did you break these off YOURSELF?\"" = TRUE, "\"Why did we give this to such simpletons, anyway?\"" = TRUE, \
	"\"At least we can use these for something - unlike you.\"" = TRUE)

//Replicant Alloy. Used for fuel and construction, and not merely scripture.
/obj/item/clockwork/component/replicant_alloy
	name = "replicant alloy"
	desc = "A seemingly strong but very malleable chunk of metal. It seems as though it wants to be molded into something greater."
	icon_state = "replicant_alloy"
	component_id = "replicant_alloy"
	cultist_message = "The alloy takes on the appearance of a screaming face for a moment."
	servant_of_ratvar_messages = list("\"There's always something to be done. Get to it.\"" = FALSE, "\"Idle hands are worse than broken ones. Get to work.\"" = FALSE, \
	"A detailed image of Ratvar appears in the alloy for a moment." = FALSE)
	message_span = "nezbere"

/obj/item/clockwork/component/replicant_alloy/examine(mob/user)
	..()
	if(is_servant_of_ratvar(user))
		user << "<span class='alloy'>Can be used to fuel Clockwork Proselytizers and Mending Motors, or shaped into brass sheets.</span>"

/obj/item/clockwork/component/replicant_alloy/attack_self(mob/user)
	if(is_servant_of_ratvar(user))
		var/obj/item/stack/sheet/brass/B = new /obj/item/stack/sheet/brass(get_turf(src), 10)
		user.unEquip(src, TRUE)
		user.put_in_hands(B)
		user << "<span class='brass'>You shape the alloy into some brass sheets.</span>"
		qdel(src)

/obj/item/clockwork/component/replicant_alloy/smashed_anima_fragment
	name = "smashed anima fragment"
	desc = "Shattered chunks of metal. Damaged beyond repair and completely unusable."
	clockwork_desc = "The sad remains of an anima fragment. Might still be serviceable as a substitute for replicant alloy."
	icon_state = "smashed_anime_fragment"
	cultist_message = "The shards vibrate in your hands for a moment."
	servant_of_ratvar_messages = list("\"...still fight...\"" = FALSE, "\"...where am I...?\"" = FALSE, "\"...put me... slab...\"" = FALSE)
	message_span = "heavy_brass"
	w_class = 3

/obj/item/clockwork/component/replicant_alloy/fallen_armor
	name = "fallen armor"
	desc = "Lifeless chunks of armor. They're designed in a strange way and won't fit on you."
	clockwork_desc = "The armor from a former clockwork marauder. Might still be serviceable as a substitute for replicant alloy."
	icon_state = "fallen_armor"
	cultist_message = "Red flame sputters from the mask's eye before winking out."
	servant_of_ratvar_messages = list("A piece of armor hovers away from the others for a moment." = FALSE, "Red flame appears in the cuirass before sputtering out." = FALSE)
	message_span = "heavy_brass"
	w_class = 3

/obj/item/clockwork/component/hierophant_ansible
	name = "hierophant ansible"
	desc = "Some sort of transmitter? It seems as though it's trying to say something."
	icon_state = "hierophant_ansible"
	component_id = "hierophant_ansible"
	cultist_message = "\"Gur obff fnlf vg'f abg ntnvafg gur ehyrf gb-xvyy lbh.\""
	servant_of_ratvar_messages = list("\"Exile is such a bore. There's nothing I can hunt in here.\"" = TRUE, "\"What's keeping you? I want to go kill something.\"" = TRUE, \
	"\"HEHEHEHEHEHEH!\"" = FALSE, "\"If I killed you fast enough, do you think the boss would notice?\"" = TRUE)
	message_span = "nzcrentr"

/obj/item/clockwork/component/hierophant_ansible/obelisk
	name = "obelisk prism"
	desc = "A prism that occasionally glows brightly. It seems not-quite there."
	clockwork_desc = "The prism from a clockwork obelisk. Likely suitable as a substitute for a hierophant ansible."
	cultist_message = "The prism flickers wildly in your hands before resuming its normal glow."
	servant_of_ratvar_messages = list("You hear the distinctive sound of the Hierophant Network for a moment." = FALSE, "\"Hieroph'ant Br'o'adcas't fail'ure.\"" = TRUE, \
	"The obelisk flickers wildly, as if trying to open a gateway." = FALSE, "\"Spa'tial Ga'tewa'y fai'lure.\"" = TRUE)
	icon_state = "obelisk_prism"
	w_class = 3

//Shards of Alloy, suitable only for proselytization.
/obj/item/clockwork/alloy_shards
	name = "replicant alloy shards"
	desc = "Broken shards of some oddly malleable metal. They occasionally move and seem to glow."
	clockwork_desc = "Broken shards of replicant alloy. Could be proselytized for liquified replicant alloy."
	icon_state = "alloy_shards"
	resistance_flags = LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	var/randomsinglesprite = FALSE
	var/randomspritemax = 2

/obj/item/clockwork/alloy_shards/New()
	..()
	if(randomsinglesprite)
		replace_name_desc()
		icon_state = "[icon_state][rand(1, randomspritemax)]"
		pixel_x = rand(-9, 9)
		pixel_y = rand(-9, 9)

/obj/item/clockwork/alloy_shards/proc/replace_name_desc()
	name = "replicant alloy shard"
	desc = "A broken shard of some oddly malleable metal. It occasionally moves and seems to glow."
	clockwork_desc = "A broken shard of replicant alloy. Could be proselytized for liquified replicant alloy."

/obj/item/clockwork/alloy_shards/large
	randomsinglesprite = TRUE
	icon_state = "shard_large"

/obj/item/clockwork/alloy_shards/medium
	randomsinglesprite = TRUE
	icon_state = "shard_medium"

/obj/item/clockwork/alloy_shards/medium/gear_bit
	randomspritemax = 4
	icon_state = "gear_bit"

/obj/item/clockwork/alloy_shards/medium/gear_bit/replace_name_desc()
	name = "gear bit"
	desc = "A broken chunk of a gear. You want it."
	clockwork_desc = "A broken chunk of a gear. Could be proselytized for liquified replicant alloy."

/obj/item/clockwork/alloy_shards/small
	randomsinglesprite = TRUE
	randomspritemax = 3
	icon_state = "shard_small"