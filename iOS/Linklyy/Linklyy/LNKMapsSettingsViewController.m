//
//  LNKMapsSettingsViewController.m
//  Linklyy
//
//  Created by Josh Pearlstein on 9/13/14.
//  Copyright (c) 2014 Linklyy. All rights reserved.
//

#import "LNKMapsSettingsViewController.h"

#import "LNKDataManager.h"
#import "LNKLinkManager.h"

@interface LNKMapsSettingsViewController ()

@end

@implementation LNKMapsSettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.linkManager = [[JSObjection defaultInjector] getObject:[LNKLinkManager class]];
    self.dataManager = [[JSObjection defaultInjector] getObject:[LNKDataManager class]];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKey)];
    [self.view addGestureRecognizer:tap];
}
- (void)dismissKey {
    [self.textField resignFirstResponder];
}
- (IBAction)doneButtonPressed:(id)sender {
    [self.activityInd startAnimating];
    NSString *location = self.textField.text;
    BOOL directions = self.segmented.selectedSegmentIndex == 0 ? YES : NO;
    [self.linkManager openLinkWithAppName:@"maps"
                                  andLink:@"comgooglemaps://?"
                                andParams:[@{(directions ? @"q": @"daddr"):location} mutableCopy]
                                 andTitle:@"Maps"];
}


@end
