//
//  LNKDefines.h
//  Linklyy
//
//  Created by Josh Pearlstein on 9/12/14.
//  Copyright (c) 2014 Linklyy. All rights reserved.
//

#ifndef Linklyy_LNKDefines_h
#define Linklyy_LNKDefines_h

// Logging
#ifdef DEBUG
#define LNK_log( s, ... ) NSLog( @"<%@:%d> %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__,  [NSString stringWithFormat:@"%@",(s), ##__VA_ARGS__] )
#else
#define LNK_log( s, ... )
#endif

#ifdef DEBUG
#define LNK_Elog(e, ... ) NSString *s = [NSString stringWithFormat:@"%@",[(e) localizedDescription]]; NSLog( @"<%@:%d> %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__,  [NSString stringWithFormat:@"%@",(s), ##__VA_ARGS__] )
#else
#define LNK_Elog(e, ... )
#endif

// Run on main thread
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
#define LNK_runOnMainThread if (![NSThread isMainThread]) { dispatch_sync(dispatch_get_main_queue(), ^{ [self performSelector:_cmd]; }); return; };
#pragma clang diagnostic pop


#endif
