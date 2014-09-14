//
//  LNKDataManager.m
//  Linklyy
//
//  Created by Josh Pearlstein on 9/12/14.
//  Copyright (c) 2014 Linklyy. All rights reserved.
//

#import "LNKDataManager.h"

@implementation LNKDataManager
objection_register_singleton(LNKDataManager)

- (void)createLink:(NSString *)link
          withIcon:(UIImage *)icon
    andLaunchImage:(UIImage *)launch
          andTitle:(NSString *)title
           andInfo:(NSString *)info
      withCallback:(void (^)(NSString *))callback {
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:link forKey:@"link"];
    [params setObject:title forKey:@"title"];
    PFFile *iconFile = [PFFile fileWithData:UIImagePNGRepresentation(icon)];
    PFFile *launchFile = [PFFile fileWithData:UIImagePNGRepresentation(launch)];
    [iconFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        [launchFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            [params setObject:[iconFile url] forKey:@"icon"];
            [params setObject:[launchFile url] forKey:@"launch"];
            [params setObject:[self getPromptForType:title] forKey:@"prompt"];
            [params setObject:info forKey:@"info"];
            [PFCloud callFunctionInBackground:@"createLink"
                               withParameters:params
                                        block:^(id object, NSError *error) {
                                            if (error) {
                                                LNK_Elog(error);
                                                callback(nil);
                                            } else {
                                                callback((NSString *)object);
                                            }
                                        }];
        }];
    }];
}


- (NSString *)getPromptForType:(NSString *)type {
    return @"Single tap this shortcut to instantly link to your action.";
}

- (NSMutableDictionary *)getDict {
    return nil;
}
@end
