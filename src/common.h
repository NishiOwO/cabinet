#ifndef __COMMON_H__
#define __COMMON_H__

#include <stdio.h>

#include "stb/stb_ds.h"
#include "stb/stb_image.h"

#include "pcre/pcre.h"

#ifdef DEBUG
#define LOG(...) \
	fprintf(stderr, "[cabinet] "); \
	fprintf(stderr, __VA_ARGS__); \
	fprintf(stderr, "\n")
#else
#define LOG(...)
#endif

#endif
