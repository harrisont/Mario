// Evaluates to the number of elements in the array.
//
// Note that the array's size must be fixed at compile time.
// Dynamically-allocated arrays are not allowed.
//
// Passing in a pointer instead of an array is incorrect, and will generate
// warning 6384 ("Dividing sizeof a pointer by another value").
#define TING_COUNT_OF(array) std::extent<decltype(array)>::value

#define TING_DEBUG_BREAK() __debugbreak()

#define TING_MACRO_BEGIN do {
#define TING_MACRO_END } while (0, 0)
// "(0,0)" is used instead of "(0)" because "(0)" generates
// warning C4127: "conditional expression is constant".

#define TING_UNUSED(x) (x)
