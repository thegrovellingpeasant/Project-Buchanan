//Global defines for most of the unmentionables.
//Be sure to update the min/max of these if you do change them.
//Measurements are in imperial units. Inches, feet, yards, miles. Tsp, tbsp, cups, quarts, gallons, etc

//Filters
#define CIT_FILTER_STAMINACRIT filter(type="drop_shadow", x=0, y=0, size=-3, color="#04080F")

//Individual logging define
#define INDIVIDUAL_LOOC_LOG "LOOC log"

#define ADMIN_MARKREAD(client) "(<a href='?_src_=holder;markedread=[text_ref(client)]'>MARK READ</a>)"//marks an adminhelp as read and under investigation
#define ADMIN_IC(client) "(<a href='?_src_=holder;icissue=[text_ref(client)]'>IC</a>)"//marks and adminhelp as an IC issue
#define ADMIN_REJECT(client) "(<a href='?_src_=holder;rejectadminhelp=[text_ref(client)]'>REJT</a>)"//Rejects an adminhelp for being unclear or otherwise unhelpful. resets their adminhelp timer

#define CITADEL_MENTOR_OOC_COLOUR "#224724"

//xenobio console upgrade stuff
#define XENOBIO_UPGRADE_MONKEYS				1
#define XENOBIO_UPGRADE_SLIMEBASIC			2
#define XENOBIO_UPGRADE_SLIMEADV			4

//special species definitions
#define MINIMUM_MUTANT_COLOR	"#202020" //this is how dark players mutant parts and skin can be
