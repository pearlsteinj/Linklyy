//
//  LNKDataManager.h
//  Linklyy
//
//  Created by Josh Pearlstein on 9/12/14.
//  Copyright (c) 2014 Linklyy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LNKDataManager : NSObject

@property(nonatomic) NSString *selectedPhone;

// Register a link with the server. Callback response will be the hash location
// of the icon.
- (void)createLink:(NSString *)link
          withIcon:(UIImage *)icon
    andLaunchImage:(UIImage *)launch
          andTitle:(NSString *)title
           andInfo:(NSString *)info
      withCallback:(void (^)(NSString *))callback;

@end
