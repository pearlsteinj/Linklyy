//
//  LNKLinkManager.m
//  Linklyy
//
//  Created by Josh Pearlstein on 9/12/14.
//  Copyright (c) 2014 Linklyy. All rights reserved.
//
#import <UIKit/UIKit.h>



#import "LNKDataManager.h"
#import "LNKLinkManager.h"
#import "NSDictionary+URLEncoding.h"

@implementation LNKLinkManager
objection_register_singleton(LNKLinkManager)
objection_requires(@"dataManager")

- (void)awakeFromObjection {
    self.dataManager = [[JSObjection defaultInjector] getObject:[LNKDataManager class]];
}

- (void)openLinkWithAppName:(NSString *)appName
                    andLink:(NSString *)link
                  andParams:(NSMutableDictionary *)params
                   andTitle:(NSString *)title
                    andInfo:(NSString *)info {
    UIImage *iconImage = [[self getIconDictionary] objectForKey:appName];
    UIImage *launchImage = [[self getLaunchIconDictionary] objectForKey:appName];
    NSString *deepLink = [link stringByAppendingString:[params urlEncodedString]];
    [self.dataManager createLink:deepLink
                        withIcon:iconImage
                  andLaunchImage:launchImage
                        andTitle:title
                         andInfo:info
                    withCallback:^(NSString *hash) {
        NSString *formatBase = @"http://icon.linklyy.me/%@";
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:formatBase,hash]];
        [[UIApplication sharedApplication] openURL:url];
    }];
}

#pragma mark - Private

- (NSMutableDictionary *)getIconDictionary {
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setObject:[UIImage imageNamed:@"phone"] forKey:@"phone"];
    [dict setObject:[UIImage imageNamed:@"maps"] forKey:@"maps"];
    [dict setObject:[UIImage imageNamed:@"spotify"] forKey:@"spotify"];
    [dict setObject:[UIImage imageNamed:@"facetime"] forKey:@"facetime"];
    [dict setObject:[UIImage imageNamed:@"email"] forKey:@"email"];
    [dict setObject:[UIImage imageNamed:@"sms"] forKey:@"sms"];
    [dict setObject:[UIImage imageNamed:@"twitter"] forKey:@"twitter"];
    [dict setObject:[UIImage imageNamed:@"youtube"] forKey:@"youtube"];
    [dict setObject:[UIImage imageNamed:@"pinterest"] forKey:@"pinterest"];
    [dict setObject:[UIImage imageNamed:@"waze"] forKey:@"waze"];
    [dict setObject:[UIImage imageNamed:@"yelp"] forKey:@"yelp"];

    
    //TODO(josh)
    return dict;
}

- (NSMutableDictionary *)getLaunchIconDictionary {
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setObject:[UIImage imageNamed:@"phone_l"] forKey:@"phone"];
    [dict setObject:[UIImage imageNamed:@"maps_l"] forKey:@"maps"];
    [dict setObject:[UIImage imageNamed:@"spotify_l"] forKey:@"spotify"];
    [dict setObject:[UIImage imageNamed:@"facetime_l"] forKey:@"facetime"];
    [dict setObject:[UIImage imageNamed:@"email_l"] forKey:@"email"];
    [dict setObject:[UIImage imageNamed:@"sms_l"] forKey:@"sms"];
    [dict setObject:[UIImage imageNamed:@"youtube_l"] forKey:@"youtube"];
    [dict setObject:[UIImage imageNamed:@"pinterest"] forKey:@"pinterest"];
    [dict setObject:[UIImage imageNamed:@"waze"] forKey:@"waze"];
    [dict setObject:[UIImage imageNamed:@"yelp"] forKey:@"yelp"];

    
    //TODO(josh)
    return dict;
}

@end
