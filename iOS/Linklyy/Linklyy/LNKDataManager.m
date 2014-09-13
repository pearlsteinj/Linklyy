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
      withCallback:(void (^)(NSString *))callback {
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:link forKey:@"link"];
    [params setObject:title forKey:@"title"];
    PFFile *iconFile = [PFFile fileWithData:UIImageJPEGRepresentation(icon, .3)];
    PFFile *launchFile = [PFFile fileWithData:UIImageJPEGRepresentation(launch, .3)];
    [iconFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        [launchFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            [params setObject:[iconFile url] forKey:@"icon"];
            [params setObject:[launchFile url] forKey:@"launch"];
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
@end
