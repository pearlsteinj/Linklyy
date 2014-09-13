//
//  LNKLinkManager.h
//  Linklyy
//
//  Created by Josh Pearlstein on 9/12/14.
//  Copyright (c) 2014 Linklyy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LNKDataManager;

@interface LNKLinkManager : NSObject

// Injected
@property(nonatomic) LNKDataManager *dataManager;

- (void)openLinkWithAppName:(NSString *)appName
                    andLink:(NSString *)link
                  andParams:(NSMutableDictionary *)params
                   andTitle:(NSString *)title;

@end
