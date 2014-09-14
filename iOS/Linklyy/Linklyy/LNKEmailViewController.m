//
//  LNKSpotifySettingsViewController.m
//  Linklyy
//
//  Created by Josh Pearlstein on 9/13/14.
//  Copyright (c) 2014 Linklyy. All rights reserved.
//

#import "LNKEmailViewController.h"

#import "LNKLinkManager.h"
#import "LNKDataManager.h"

@interface LNKEmailViewController ()

@end

@implementation LNKEmailViewController

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
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pop)];
    [self.view addGestureRecognizer:pan];
}
- (void)pop {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)dismissKey {
    [self.emailAddress resignFirstResponder];
    [self.subjectLine resignFirstResponder];
    [self.bodyText resignFirstResponder];

}

- (IBAction)doneButtonPressed:(id)sender {
    [self.activityInd startAnimating];
    NSString *email = self.emailAddress.text;
    NSString *subject = self.subjectLine.text;
    NSString *body = self.bodyText.text;
    [self.linkManager openLinkWithAppName:@"email"
                                  andLink:[NSString stringWithFormat:@"mailto:%@?subject=%@&body=%@",email,subject,body]
                                andParams:[@{} mutableCopy]
                                 andTitle:@"Email"
                                  andInfo:[NSString stringWithFormat:@"Email %@", email]];
}

@end
