/*
Shoutout to Tadano, hangy_manyu, xTrainx, and patrickbatemanvevoreal for all of their advice and help with LoveBeingAnOwl unfucking new reno's code
*/

// 515 split call for external libraries into call_ext
#if DM_VERSION < 515
#define LIBCALL call
#else
#define LIBCALL call_ext
#endif

/*#if DM_VERSION < 515 // even though someone with < 515 probably can't join, this is still done because why not
/// Call by name proc reference, checks if the proc exists on this type or as a global proc
#define PROC_REF(X) (PROC_REF(##X))
/// Call by name proc reference, checks if the proc exists on given type or as a global proc
#define TYPE_PROC_REF(TYPE, X) (##TYPEPROC_REF(##X))
/// Call by name proc reference, checks if the proc is existing global proc
#define GLOBAL_PROC_REF(X) (/proc/##X)
#else
/// Call by name proc reference, checks if the proc exists on this type or as a global proc
#define PROC_REF(X) (nameof(PROC_REF(##X)))
/// Call by name proc reference, checks if the proc exists on given type or as a global proc
#define TYPE_PROC_REF(TYPE, X) (nameof(##TYPEPROC_REF(##X)))
/// Call by name proc reference, checks if the proc is existing global proc
#define GLOBAL_PROC_REF(X) (/proc/##X)
#endif*/

#if DM_VERSION < 515

/// Call by name proc references, checks if the proc exists on either this type or as a global proc.
#define PROC_REF(X) (PROC_REF(##X))
/// Call by name verb references, checks if the verb exists on either this type or as a global verb.
#define VERB_REF(X) (.verb/##X)

/// Call by name proc reference, checks if the proc exists on either the given type or as a global proc
#define TYPE_PROC_REF(TYPE, X) (##TYPEPROC_REF(##X))
/// Call by name verb reference, checks if the verb exists on either the given type or as a global verb
#define TYPE_VERB_REF(TYPE, X) (##TYPE.verb/##X)

/// Call by name proc reference, checks if the proc is an existing global proc
#define GLOBAL_PROC_REF(X) (/proc/##X)

#else

/// Call by name proc references, checks if the proc exists on either this type or as a global proc.
#define PROC_REF(X) (nameof(PROC_REF(##X)))
/// Call by name verb references, checks if the verb exists on either this type or as a global verb.
#define VERB_REF(X) (nameof(.verb/##X))

/// Call by name proc reference, checks if the proc exists on either the given type or as a global proc
#define TYPE_PROC_REF(TYPE, X) (nameof(##TYPEPROC_REF(##X)))
/// Call by name verb reference, checks if the verb exists on either the given type or as a global verb
#define TYPE_VERB_REF(TYPE, X) (nameof(##TYPE.verb/##X))

/// Call by name proc reference, checks if the proc is an existing global proc
#define GLOBAL_PROC_REF(X) (/proc/##X)

#endif

#if (DM_VERSION == 515)
/// fcopy will crash on 515 linux if given a non-existant file, instead of returning 0 like on 514 linux or 515 windows
/// var case matches documentation for fcopy.
/world/proc/__fcopy(Src, Dst)
	if (istext(Src) && !fexists(Src))
		return 0
	return fcopy(Src, Dst)

#define fcopy(Src, Dst) world.__fcopy(Src, Dst)

#endif
