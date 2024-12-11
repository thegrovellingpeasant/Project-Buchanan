// Radios use a large variety of predefined frequencies.

//say based modes like binary are in living/say.dm

#define RADIO_CHANNEL_COMMON "Common"
#define RADIO_KEY_COMMON ";"

#define RADIO_CHANNEL_SECURITY "Security"
#define RADIO_KEY_SECURITY "p"
#define RADIO_TOKEN_SECURITY ":p"

#define RADIO_CHANNEL_ENGINEERING "Engineering"
#define RADIO_KEY_ENGINEERING "e"
#define RADIO_TOKEN_ENGINEERING ":e"

#define RADIO_CHANNEL_COMMAND "Command"
#define RADIO_KEY_COMMAND "d"
#define RADIO_TOKEN_COMMAND ":d"

#define RADIO_CHANNEL_SCIENCE "Science"
#define RADIO_KEY_SCIENCE "n"
#define RADIO_TOKEN_SCIENCE ":n"

#define RADIO_CHANNEL_MEDICAL "Medical"
#define RADIO_KEY_MEDICAL "m"
#define RADIO_TOKEN_MEDICAL ":m"

#define RADIO_CHANNEL_SUPPLY "Supply"
#define RADIO_KEY_SUPPLY "u"
#define RADIO_TOKEN_SUPPLY ":u"

#define RADIO_CHANNEL_SERVICE "Service"
#define RADIO_KEY_SERVICE "k"
#define RADIO_TOKEN_SERVICE ":k"

#define RADIO_CHANNEL_AI_PRIVATE "AI Private"
#define RADIO_KEY_AI_PRIVATE "o"
#define RADIO_TOKEN_AI_PRIVATE ":o"

#define RADIO_CHANNEL_SYNDICATE "Syndicate"
#define RADIO_KEY_SYNDICATE "t"
#define RADIO_TOKEN_SYNDICATE ":t"

#define RADIO_CHANNEL_CENTCOM "CentCom"
#define RADIO_KEY_CENTCOM "y"
#define RADIO_TOKEN_CENTCOM ":y"

#define RADIO_CHANNEL_VAULT "Vault"
#define RADIO_KEY_VAULT "v"
#define RADIO_TOKEN_VAULT ":v"

#define RADIO_CHANNEL_NCR "NCR"
#define RADIO_KEY_NCR "n"
#define RADIO_TOKEN_NCR ":n"

#define RADIO_CHANNEL_RANGER "Police"
#define RADIO_KEY_RANGER "j"
#define RADIO_TOKEN_RANGER ":j"

#define RADIO_CHANNEL_BOS "BOS"
#define RADIO_KEY_BOS "q"
#define RADIO_TOKEN_BOS ":q"

#define RADIO_CHANNEL_ENCLAVE "Enclave"
#define RADIO_KEY_ENCLAVE "z"
#define RADIO_TOKEN_ENCLAVE ":z"

#define RADIO_CHANNEL_TOWN "Town"
#define RADIO_KEY_TOWN "f"
#define RADIO_TOKEN_TOWN ":f"

#define RADIO_CHANNEL_LEGION "Legion"
#define RADIO_KEY_LEGION "l"
#define RADIO_TOKEN_LEGION ":l"

#define RADIO_CHANNEL_KHANS "Khans"
#define RADIO_KEY_KHANS "a"
#define RADIO_TOKEN_KHANS ":a"

#define RADIO_CHANNEL_DEN "Den"
#define RADIO_KEY_DEN "x"
#define RADIO_TOKEN_DEN ":x"

#define RADIO_CHANNEL_CTF_RED "Red Team"
#define RADIO_CHANNEL_CTF_BLUE "Blue Team"

#define RADIO_CHANNEL_LDS "New Canaan"
#define RADIO_KEY_LDS "c"
#define RADIO_TOKEN_LDS ":c"

#define RADIO_CHANNEL_USPS "USPS"
#define RADIO_KEY_USPS "s"
#define RADIO_TOKEN_USPS ":s"

#define RADIO_CHANNEL_EIGHTIES "80s"
#define RADIO_KEY_EIGHTIES "g"
#define RADIO_TOKEN_EIGHTIES ":g"

#define RADIO_CHANNEL_EIGHTIESB "Blue"
#define RADIO_KEY_EIGHTIESB "b"
#define RADIO_TOKEN_EIGHTIESB ":b"

#define RADIO_CHANNEL_EIGHTIESR "Red"
#define RADIO_KEY_EIGHTIESR "r"
#define RADIO_TOKEN_EIGHTIESR ":r"

#define RADIO_CHANNEL_WND "Radio"
#define RADIO_KEY_WND "t"
#define RADIO_TOKEN_WND ":t"

#define RADIO_CHANNEL_MONTEGOBAY "Montego Bay"
#define RADIO_KEY_MONTEGOBAY "i"
#define RADIO_TOKEN_MONTEGOBAY ":i"

#define RADIO_CHANNEL_SALVATORES "Salvatores"
#define RADIO_KEY_SALVATORES "s"
#define RADIO_TOKEN_SALVATORES ":s"

#define RADIO_CHANNEL_MORDINOS "Mordinos"
#define RADIO_KEY_MORDINOS "m"
#define RADIO_TOKEN_MORDINOS ":m"

#define RADIO_CHANNEL_HOTEL "Hotel"
#define RADIO_KEY_HOTEL "h"
#define RADIO_TOKEN_HOTEL ":h"

#define RADIO_CHANNEL_BISHOPS "Bishops"
#define RADIO_KEY_BISHOPS "b"
#define RADIO_TOKEN_BISHOPS ":b"

#define RADIO_CHANNEL_WRIGHTS "Wrights"
#define RADIO_KEY_WRIGHTS "w"
#define RADIO_TOKEN_WRIGHTS ":w"

#define RADIO_CHANNEL_VANGRAFFS "Van Graffs"
#define RADIO_KEY_VANGRAFFS	"v"
#define RADIO_TOKEN_VANGRAFFS ":v"

#define RADIO_CHANNEL_NRPD "NRPD"
#define RADIO_KEY_NRPD "p"
#define RADIO_TOKEN_NRPD ":p"

#define RADIO_CHANNEL_NCRCF "NCRCF"
#define RADIO_KEY_NCRCF "w"
#define RADIO_TOKEN_NCRCF ":w"

#define RADIO_CHANNEL_GOVERNMENT "Government"
#define RADIO_KEY_GOVERNMENT "g"
#define RADIO_TOKEN_GOVERNMENT ":g"

#define MIN_FREE_FREQ 1201 // -------------------------------------------------
// Frequencies are always odd numbers and range from 1201 to 1599.

#define FREQ_SYNDICATE 1213  // Nuke op comms frequency, dark brown
#define FREQ_CTF_RED 1215  // CTF red team comms frequency, red
#define FREQ_CTF_BLUE 1217  // CTF blue team comms frequency, blue
#define FREQ_CENTCOM 1337  // CentCom comms frequency, gray
#define FREQ_SUPPLY 1347  // Supply comms frequency, light brown
#define FREQ_SERVICE 1349  // Service comms frequency, green
#define FREQ_SCIENCE 1351  // Science comms frequency, plum
#define FREQ_COMMAND 1353  // Command comms frequency, gold
#define FREQ_MEDICAL 1355  // Medical comms frequency, soft blue
#define FREQ_ENGINEERING 1357  // Engineering comms frequency, orange
#define FREQ_SECURITY 1359  // Security comms frequency, red
#define FREQ_VAULT 1361 //Vault
#define FREQ_NCR 1363 //NCR
#define FREQ_BOS 1365 //BOS
#define FREQ_ENCLAVE 1367 //ENCLAVE
#define FREQ_TOWN 1369 //TOWN
#define FREQ_LEGION 1371 //LEGION
#define FREQ_RANGER 1373 //Ranger
#define FREQ_DEN 1375 //Den
#define FREQ_KHANS 1376 //Khans
#define FREQ_LDS 1377 // LDS New Canaanites
#define FREQ_USPS 1379 // Post office
#define FREQ_EIGHTIES 1381  // 80s
#define FREQ_EIGHTIESB 1383 // 80s blue team
#define FREQ_EIGHTIESR 1385 // 80s red team
#define FREQ_WND 1387 // radio station
#define FREQ_MONTEGOBAY 1389 // montego bay
#define FREQ_SALVATORES 1391 //Salvatores
#define FREQ_MORDINOS 1395 //Mordinos
#define FREQ_HOTEL 1399 //Hotel
#define FREQ_BISHOPS 1401 // Bishops
#define FREQ_WRIGHTS 1403 // Wrights
#define FREQ_VANGRAFFS 1405 // Van Graffs
#define FREQ_NRPD 1407 // New Reno Police Department
#define FREQ_NCRCF 1409 // New California Correctional Facility
#define FREQ_GOVERNMENT 1311 // Government


#define FREQ_HOLOGRID_SOLUTION 1433
#define FREQ_STATUS_DISPLAYS 1435
#define FREQ_ATMOS_ALARMS 1437  // air alarms <-> alert computers
#define FREQ_ATMOS_CONTROL 1439  // air alarms <-> vents and scrubbers

#define MIN_FREQ 1441 // ------------------------------------------------------
// Only the 1441 to 1489 range is freely available for general conversation.
// This represents 1/8th of the available spectrum.

#define FREQ_ATMOS_STORAGE 1441
#define FREQ_NAV_BEACON 1445
#define FREQ_AI_PRIVATE 1447  // AI private comms frequency, magenta
#define FREQ_PRESSURE_PLATE 1447
#define FREQ_AIRLOCK_CONTROL 1449
#define FREQ_ELECTROPACK 1449
#define FREQ_MAGNETS 1449
#define FREQ_LOCATOR_IMPLANT 1451
#define FREQ_SIGNALER 1457  // the default for new signalers
#define FREQ_COMMON 1459  // Common comms frequency, dark green

#define MAX_FREQ 1489 // ------------------------------------------------------

#define MAX_FREE_FREQ 1599 // -------------------------------------------------

// Transmission types.
#define TRANSMISSION_WIRE 0  // some sort of wired connection, not used
#define TRANSMISSION_RADIO 1  // electromagnetic radiation (default)
#define TRANSMISSION_SUBSPACE 2  // subspace transmission (headsets only)
#define TRANSMISSION_SUPERSPACE 3  // reaches independent (CentCom) radios only

// Filter types, used as an optimization to avoid unnecessary proc calls.
#define RADIO_TO_AIRALARM "to_airalarm"
#define RADIO_FROM_AIRALARM "from_airalarm"
#define RADIO_SIGNALER "signaler"
#define RADIO_ATMOSIA "atmosia"
#define RADIO_AIRLOCK "airlock"
#define RADIO_MAGNETS "magnets"

#define DEFAULT_SIGNALER_CODE 30
