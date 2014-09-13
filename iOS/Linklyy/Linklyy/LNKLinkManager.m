//
//  LNKLinkManager.m
//  Linklyy
//
//  Created by Josh Pearlstein on 9/12/14.
//  Copyright (c) 2014 Linklyy. All rights reserved.
//

#import "LNKLinkManager.h"

#import "LNKDataManager.h"
#import "NSDictionary+URLEncoding.h"

@implementation LNKLinkManager
objection_register(LNKLinkManager)
objection_requires(@"dataManager")

- (void)awakeFromObjection {
    self.dataManager = [[JSObjection defaultInjector] getObject:[LNKDataManager class]];
}

- (void)openLinkWithAppName:(NSString *)appName
                    andLink:(NSString *)link
                  andParams:(NSMutableDictionary *)params
                   andTitle:(NSString *)title {
    UIImage *iconImage = [[self getIconDictionary] objectForKey:appName];
    UIImage *launchImage = [[self getLaunchIconDictionary] objectForKey:appName];
    NSString *deepLink = [link stringByAppendingString:[params urlEncodedString]];
    [self.dataManager createLink:deepLink withIcon:iconImage andLaunchImage:launchImage andTitle:title withCallback:^(NSString *hash) {
        NSString *formatBase = @"http://icon.linklyy.me/%@";
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:formatBase,hash]];
        [[UIApplication sharedApplication] openURL:url];
    }];
}

#pragma mark - Private

- (NSMutableDictionary *)getIconDictionary {
    //TODO(josh)
    return nil;
}

- (NSMutableDictionary *)getLaunchIconDictionary {
    //TODO(josh)
    return nil;
}

@end
