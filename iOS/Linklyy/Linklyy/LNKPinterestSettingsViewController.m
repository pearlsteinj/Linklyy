//
//  LNKPinterestSettingsViewController.m
//  Linklyy
//
//  Created by Josh Pearlstein on 9/13/14.
//  Copyright (c) 2014 Linklyy. All rights reserved.
//

#import "LNKPinterestSettingsViewController.h"

#import "LNKLinkManager.h"
#import "LNKDataManager.h"

@interface LNKPinterestSettingsViewController ()

@end

@implementation LNKPinterestSettingsViewController

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
    [self.textField2 resignFirstResponder];
}

- (IBAction)doneButtonPressed:(id)sender {
    [self.activityInd startAnimating];
    NSString *name = self.textField2.text;
    NSString *board = self.textField.text;
    [self.linkManager openLinkWithAppName:@"pinterest"
                                  andLink:[NSString stringWithFormat:@"pinterest://board/%@/%@/",name,board]
                                andParams:[@{} mutableCopy]
                                 andTitle:@"Pinterest"
                                  andInfo:[NSString stringWithFormat:@"Board: %@, User:%@", name,board]];
}



@end
