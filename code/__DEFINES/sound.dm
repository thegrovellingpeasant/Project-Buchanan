//max channel is 1024. Only go lower from here, because byond tends to pick the first availiable channel to play sounds on
#define CHANNEL_LOBBYMUSIC 1024
#define CHANNEL_ADMIN 1023
#define CHANNEL_VOX 1022
#define CHANNEL_JUKEBOX 1021
#define CHANNEL_JUKEBOX_START 1016 //The gap between this and CHANNEL_JUKEBOX determines the amount of free jukebox channels. This currently allows 6 jukebox channels to exist.
#define CHANNEL_JUSTICAR_ARK 1015
#define CHANNEL_HEARTBEAT 1014 //sound channel for heartbeats
#define CHANNEL_AMBIENCE 1013
#define CHANNEL_BUZZ 1012
#define CHANNEL_BICYCLE 1011

//THIS SHOULD ALWAYS BE THE LOWEST ONE!
//KEEP IT UPDATED

#define CHANNEL_HIGHEST_AVAILABLE 1010

#define MAX_INSTRUMENT_CHANNELS (128 * 6)

#define SOUND_MINIMUM_PRESSURE 10
#define FALLOFF_SOUNDS 1


//Ambience types

#define GENERIC list('sound/ambience/ambigen1.ogg','sound/ambience/ambigen3.ogg',\
								'sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg',\
								'sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg',\
								'sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg',\
								'sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg',\
								'sound/ambience/ambigen12.ogg','sound/ambience/ambigen14.ogg','sound/ambience/ambigen15.ogg')

#define HOLY list('sound/ambience/ambicha1.ogg','sound/ambience/ambicha2.ogg','sound/ambience/ambicha3.ogg',\
										'sound/ambience/ambicha4.ogg', 'sound/ambience/ambiholy.ogg', 'sound/ambience/ambiholy2.ogg',\
										'sound/ambience/ambiholy3.ogg')

#define HIGHSEC list('sound/ambience/ambidanger.ogg', 'sound/ambience/ambidanger2.ogg')

#define RUINS list('sound/ambience/ambimine.ogg', 'sound/ambience/ambicave.ogg', 'sound/ambience/ambiruin.ogg',\
									'sound/ambience/ambiruin2.ogg',  'sound/ambience/ambiruin3.ogg',  'sound/ambience/ambiruin4.ogg',\
									'sound/ambience/ambiruin5.ogg',  'sound/ambience/ambiruin6.ogg',  'sound/ambience/ambiruin7.ogg',\
									'sound/ambience/ambidanger.ogg', 'sound/ambience/ambidanger2.ogg', 'sound/ambience/ambitech3.ogg',\
									'sound/ambience/ambimystery.ogg', 'sound/ambience/ambimaint1.ogg')

#define ENGINEERING list('sound/ambience/ambisin1.ogg','sound/ambience/ambisin2.ogg','sound/ambience/ambisin3.ogg','sound/ambience/ambisin4.ogg',\
										'sound/ambience/ambiatmos.ogg', 'sound/ambience/ambiatmos2.ogg', 'sound/ambience/ambitech.ogg', 'sound/ambience/ambitech2.ogg', 'sound/ambience/ambitech3.ogg')

#define MINING list('sound/ambience/ambimine.ogg', 'sound/ambience/ambicave.ogg', 'sound/ambience/ambiruin.ogg',\
											'sound/ambience/ambiruin2.ogg',  'sound/ambience/ambiruin3.ogg',  'sound/ambience/ambiruin4.ogg',\
											'sound/ambience/ambiruin5.ogg',  'sound/ambience/ambiruin6.ogg',  'sound/ambience/ambiruin7.ogg',\
											'sound/ambience/ambidanger.ogg', 'sound/ambience/ambidanger2.ogg', 'sound/ambience/ambimaint1.ogg', 'sound/ambience/ambilava.ogg')

#define MEDICAL list('sound/ambience/ambinice.ogg')

#define SPOOKY list('sound/ambience/ambimo1.ogg','sound/ambience/ambimo2.ogg','sound/ambience/ambiruin7.ogg','sound/ambience/ambiruin6.ogg',\
										'sound/ambience/ambiodd.ogg', 'sound/ambience/ambimystery.ogg')

#define SPACE list('sound/ambience/ambispace.ogg', 'sound/ambience/ambispace2.ogg', 'sound/ambience/title2.ogg', 'sound/ambience/ambiatmos.ogg')

#define MAINTENANCE list('sound/ambience/ambimaint1.ogg', 'sound/ambience/ambimaint2.ogg', 'sound/ambience/ambimaint3.ogg', 'sound/ambience/ambimaint4.ogg',\
											'sound/ambience/ambimaint5.ogg', 'sound/voice/lowHiss2.ogg', 'sound/voice/lowHiss3.ogg', 'sound/voice/lowHiss4.ogg', 'sound/ambience/ambitech2.ogg' )

#define AWAY_MISSION list('sound/ambience/ambitech.ogg', 'sound/ambience/ambitech2.ogg', 'sound/ambience/ambiruin.ogg',\
									'sound/ambience/ambiruin2.ogg',  'sound/ambience/ambiruin3.ogg',  'sound/ambience/ambiruin4.ogg',\
									'sound/ambience/ambiruin5.ogg',  'sound/ambience/ambiruin6.ogg',  'sound/ambience/ambiruin7.ogg',\
									'sound/ambience/ambidanger.ogg', 'sound/ambience/ambidanger2.ogg', 'sound/ambience/ambimaint.ogg',\
									'sound/ambience/ambiatmos.ogg', 'sound/ambience/ambiatmos2.ogg', 'sound/ambience/ambiodd.ogg')

#define REEBE list('sound/ambience/ambireebe1.ogg', 'sound/ambience/ambireebe2.ogg', 'sound/ambience/ambireebe3.ogg')



#define CREEPY_SOUNDS list('sound/effects/ghost.ogg', 'sound/effects/ghost2.ogg', 'sound/effects/heart_beat.ogg', 'sound/effects/screech.ogg',\
	'sound/hallucinations/behind_you1.ogg', 'sound/hallucinations/behind_you2.ogg', 'sound/hallucinations/far_noise.ogg', 'sound/hallucinations/growl1.ogg', 'sound/hallucinations/growl2.ogg',\
	'sound/hallucinations/growl3.ogg', 'sound/hallucinations/im_here1.ogg', 'sound/hallucinations/im_here2.ogg', 'sound/hallucinations/i_see_you1.ogg', 'sound/hallucinations/i_see_you2.ogg',\
	'sound/hallucinations/look_up1.ogg', 'sound/hallucinations/look_up2.ogg', 'sound/hallucinations/over_here1.ogg', 'sound/hallucinations/over_here2.ogg', 'sound/hallucinations/over_here3.ogg',\
	'sound/hallucinations/turn_around1.ogg', 'sound/hallucinations/turn_around2.ogg', 'sound/hallucinations/veryfar_noise.ogg', 'sound/hallucinations/wail.ogg')

//fortuna addition. wasteland ambient music goes here.
#define WASTELAND_AMBIENCE list('sound/f13ambience/music/ccc_doesntworkforfree_ambience.ogg','sound/f13ambience/music/hailcaesar_ambience.ogg',\
	'sound/f13ambience/music/invisible_ghosts_ambience.ogg',\
	'sound/f13ambience/music/mole_miners_ambience.ogg',\
	'sound/f13ambience/music/portaltothepast_ambience.ogg','sound/f13ambience/music/wind_and_the_reeds_ambience.ogg')

//Project Buchanan: Reno
#define RENO_WASTELAND_AMBIENCE list('sound/f13ambience/music/after_the_blast.ogg','sound/f13ambience/music/collapse.ogg',\
	'sound/f13ambience/music/desert_nomads.ogg','sound/f13ambience/music/many_contrasts.ogg','sound/f13ambience/music/my_chrysalis_highwayman.ogg',\
	'sound/f13ambience/music/second_chance.ogg','sound/f13ambience/music/villa.ogg')

#define RENO_STREETS_AMBIENCE list('sound/f13ambience/music/city_1.ogg','sound/f13ambience/music/city_2.ogg',\
	'sound/f13ambience/music/city_3.ogg','sound/f13ambience/music/city_4.ogg','sound/f13ambience/music/alternative_3.ogg',\
	'sound/f13ambience/music/city_of_flagstaff.ogg','sound/f13ambience/music/city_of_pheonix.ogg')

#define RENO_BUILDING_AMBIENCE list('sound/f13ambience/music/city_1.ogg','sound/f13ambience/music/city_2.ogg',\
	'sound/f13ambience/music/city_3.ogg','sound/f13ambience/music/city_4.ogg')

#define RENO_WEST_AMBIENCE list('sound/f13ambience/music/city_of_lost_angels.ogg',\
	'sound/f13ambience/music/flame_of_the_ancient_world.ogg',\
	'sound/f13ambience/music/followers_credo.ogg', 'sound/f13ambience/music/industrial_junktown.ogg',\
	'sound/f13ambience/music/jackals.ogg', 'sound/f13ambience/music/twisted_preacher.ogg')

#define RENO_EAST_AMBIENCE list('sound/f13ambience/music/a_traders_life.ogg',\
	'sound/f13ambience/music/beyond_the_canyon.ogg', 'sound/f13ambience/music/california_revisted.ogg', \
	'sound/f13ambience/music/dream_town.ogg','sound/f13ambience/music/gold_slouch.ogg', \
	'sound/f13ambience/music/moribound_world.ogg')

#define RENO_PRISON_AMBIENCE list('sound/f13ambience/music/citadel.ogg', 'sound/f13ambience/music/highpool_prison.ogg',\
	'sound/f13ambience/music/yesterday.ogg')

#define RENO_NRPD_AMBIENCE list('sound/f13ambience/music/earthmen.ogg')

#define RENO_VANGRAFF_AMBIENCE list('sound/f13ambience/music/equilibrium.ogg','sound/f13ambience/music/nonadmittance.ogg',\
	'sound/f13ambience/music/trammel.ogg')

#define RENO_WRIGHT_AMBIENCE list('sound/f13ambience/music/choo_choo.ogg')

#define RENO_HOTEL_AMBIENCE list('sound/f13ambience/music/tower_of_terror.ogg')

#define SHARKCLUB_AMBIENCE list('sound/f13ambience/music/casino_1.ogg','sound/f13ambience/music/casino_2.ogg')

#define YAKUZA_AMBIENCE list('sound/f13ambience/music/yakuzatrack_1.ogg')

#define RENO_CAVES_AMBIENCE list('sound/f13ambience/music/underground_1.ogg','sound/f13ambience/music/underground_2.ogg', \
	'sound/f13ambience/music/crevices.ogg','sound/f13ambience/music/quartz.ogg', \
	'sound/f13ambience/music/radiation_cloud.ogg','sound/f13ambience/music/the_underground.ogg')

#define RENO_TRIBAL_AMBIENCE list('sound/f13ambience/music/khans_of_new_california.ogg')

#define RENO_SEWERS_AMBIENCE list('sound/f13ambience/music/radiation_cloud.ogg','sound/f13ambience/music/vats_of_goo.ogg',\
	'sound/f13ambience/music/one_way.ogg','sound/f13ambience/music/fogbound.ogg','sound/f13ambience/music/futuristic_horrors.ogg',\
	'sound/f13ambience/music/mannerites.ogg')

#define RENO_SUBWAY_AMBIENCE list('sound/f13ambience/music/trilobite.ogg','sound/f13ambience/music/vats_of_goo.ogg',\
	'sound/f13ambience/music/one_way.ogg','sound/f13ambience/music/motel.ogg')

#define RENO_PREWARBUNKER_AMBIENCE list('sound/f13ambience/music/all_clear_signal.ogg','sound/f13ambience/music/metallic_monks.ogg',\
	'sound/f13ambience/music/the_vault_of_the_future.ogg')

#define RENO_BOS_AMBIENCE list('sound/f13ambience/music/all_clear_signal.ogg','sound/f13ambience/music/metallic_monks.ogg',\
	'sound/f13ambience/music/the_vault_of_the_future.ogg')

