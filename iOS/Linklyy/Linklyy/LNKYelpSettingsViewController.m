//
//  LNKSpotifySettingsViewController.m
//  Linklyy
//
//  Created by Josh Pearlstein on 9/13/14.
//  Copyright (c) 2014 Linklyy. All rights reserved.
//

#import "LNKYelpSettingsViewController.h"

#import "LNKLinkManager.h"
#import "LNKDataManager.h"

@interface LNKYelpSettingsViewController ()

@end

@implementation LNKYelpSettingsViewController

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
    NSString *name = self.textField.text;
    [self.linkManager openLinkWithAppName:@"yelp"
                                  andLink:[NSString stringWithFormat:@"yelp4:///search?terms=%@",name]
                                andParams:[@{} mutableCopy]
                                 andTitle:@"Yelp"
                                  andInfo:[NSString stringWithFormat:@"Yelp Handle: %@",name]];
}

@end
