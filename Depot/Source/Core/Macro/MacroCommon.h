// Evaluates to the number of elements in the array.
#define COUNT_OF(x) \
	((sizeof(x)/sizeof(0[x])) / ((size_t)(!(sizeof(x) % sizeof(0[x])))))

#define TING_DEBUG_BREAK() __debugbreak()

#define TING_MACRO_BEGIN do {
#define TING_MACRO_END } while (0, 0)
// "(0,0)" is used instead of "(0)" because "(0)" generates
// warning C4127: "conditional expression is constant".

// Use sizeof and ignore the result because sizeof doesn't actually evaluate x.
// This is more optimal than just using "(void)(x)" because that will evaluate x.
//
// Note that the C6334 warning
// ("sizeof operator applied to an expression with an operator may yield unexpected results")
// is suppressed.
#define TING_UNUSED(x) \
	TING_MACRO_BEGIN \
	__pragma(warning(push)) \
	__pragma(warning(disable:6334)) \
		(void)sizeof(x); \
	__pragma(warning(pop)) \
	TING_MACRO_END
