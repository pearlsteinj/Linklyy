//
//  TSTAppDelegate.m
//  mobilesafari
//
//  Created by Josh Pearlstein on 9/13/14.
//
//

#import "TSTAppDelegate.h"

@implementation TSTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    NSBundle *b = [NSBundle bundleWithPath:@"/System/Library/Frameworks/UIKit.Framework"];
    BOOL success = [b load];
    Class UIApplication = NSClassFromString(@"UIApplication");
    id app = [UIApplication sharedApplication];
    Class UIWebClip = NSClassFromString(@"UIWebClip");
    id clip = [[UIWebClip class] performSelector:@selector(webClipWithIdentifier:)
                                      withObject:nil];
    NSLog(@"%@",clip);
    NSLog(@"%@", [[UIWebClip class] performSelector:@selector(webClipsDirectoryPath)]);
    if ([clip respondsToSelector:@selector(createOnDisk)]) {
        [clip performSelector:@selector(createOnDisk) withObject:nil];
    }
    if ([clip respondsToSelector:@selector(setIconImage:isPrecomposed:)]) {
        [clip performSelector:@selector(setIconImage:isPrecomposed:)
                   withObject:[UIImage imageNamed:@"maps"]
                   withObject:[NSNumber numberWithBool:YES]];
    }
    if ([clip respondsToSelector:@selector(setIdentifier:)]) {
        CFUUIDRef uuid = CFUUIDCreate(kCFAllocatorDefault);
        NSString *uuidstr = (NSString *)CFBridgingRelease(CFUUIDCreateString(kCFAllocatorDefault, uuid));
        [clip performSelector:@selector(setIdentifier:) withObject:uuidstr];
    }
    if ([clip respondsToSelector:@selector(setPageURL:)]) {
        //[clip performSelector:@selector(setPageURL:) withObject:[NSURL URLWithString:@"sms:9738203842"]];
    }
    if ([clip respondsToSelector:@selector(setTitle:)]) {
        [clip setValue:@"Test" forKeyPath:@"title"];
    }
    /*
     if ([clip respondsToSelector:@selector(updateOnDisk)]) {
     [clip performSelector:@selector(updateOnDisk) withObject:nil];
     }
     */
    NSLog(@"%@",[clip valueForKeyPath:@"identifier"]);
    if ([app respondsToSelector:@selector(addWebClipToHomeScreen:)]) {
        [app performSelector:@selector(addWebClipToHomeScreen:) withObject:[clip valueForKeyPath:@"identifier"]];
    }
    
    return YES;
    
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
