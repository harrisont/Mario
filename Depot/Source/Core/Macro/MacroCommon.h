// Evaluates to the number of elements in the array.
#define TING_COUNT_OF(x) \
	((sizeof(x)/sizeof(0[x])) / ((size_t)(!(sizeof(x) % sizeof(0[x])))))

#define TING_DEBUG_BREAK() __debugbreak()

#define TING_MACRO_BEGIN do {
#define TING_MACRO_END } while (0, 0)
// "(0,0)" is used instead of "(0)" because "(0)" generates
// warning C4127: "conditional expression is constant".

#define TING_UNUSED(x) (x)
