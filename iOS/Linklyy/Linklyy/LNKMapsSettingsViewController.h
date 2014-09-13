//
//  LNKMapsSettingsViewController.h
//  Linklyy
//
//  Created by Josh Pearlstein on 9/13/14.
//  Copyright (c) 2014 Linklyy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LNKDataManager;
@class LNKLinkManager;

@interface LNKMapsSettingsViewController : UIViewController

//Injected
@property(nonatomic) LNKLinkManager *linkManager;
@property(nonatomic) LNKDataManager *dataManager;

@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityInd;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmented;

- (IBAction)doneButtonPressed:(id)sender;

@end
