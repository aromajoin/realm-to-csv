#ifdef __OBJC__
#import <Cocoa/Cocoa.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "TGSpreadsheetWriter.h"
#import "Common.h"
#import "SSZipArchive.h"
#import "ZipArchive.h"

FOUNDATION_EXPORT double TGSpreadsheetWriterVersionNumber;
FOUNDATION_EXPORT const unsigned char TGSpreadsheetWriterVersionString[];

