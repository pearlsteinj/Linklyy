//
//  LNKYoutubeSettingsViewController.m
//  Linklyy
//
//  Created by Josh Pearlstein on 9/13/14.
//  Copyright (c) 2014 Linklyy. All rights reserved.
//

#import "LNKYoutubeSettingsViewController.h"

#import "LNKLinkManager.h"
#import "LNKDataManager.h"

@interface LNKYoutubeSettingsViewController ()

@end

@implementation LNKYoutubeSettingsViewController

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

- (void)dismissKey {
    [self.textField resignFirstResponder];
}
- (void)pop {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)doneButtonPressed:(id)sender {
    [self.activityInd startAnimating];
    NSString *name = self.textField.text;
    [self.linkManager openLinkWithAppName:@"youtube"
                                  andLink:[NSString stringWithFormat:@"http://www.youtube.com/watch?v=%@",name]
                                andParams:[@{} mutableCopy]
                                 andTitle:@"Youtube"
                                  andInfo:[NSString stringWithFormat:@"Watch %@", name]];
}


@end
