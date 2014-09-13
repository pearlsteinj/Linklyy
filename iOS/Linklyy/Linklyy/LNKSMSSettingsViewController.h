//
//  LNKPhoneSettingsViewController.h
//  Linklyy
//
//  Created by Josh Pearlstein on 9/13/14.
//  Copyright (c) 2014 Linklyy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LNKDataManager;
@class LNKLinkManager;

@interface LNKSMSSettingsViewController : UIViewController

//Injected
@property(nonatomic) LNKLinkManager *linkManager;
@property(nonatomic) LNKDataManager *dataManager;

@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityInd;

- (IBAction)selectContactButtonPressed:(id)sender;
- (IBAction)doneButtonPressed:(id)sender;

@end
