//
//  LNKSpotifySettingsViewController.m
//  Linklyy
//
//  Created by Josh Pearlstein on 9/13/14.
//  Copyright (c) 2014 Linklyy. All rights reserved.
//

#import "LNKSpotifySettingsViewController.h"

#import "LNKLinkManager.h"
#import "LNKDataManager.h"

@interface LNKSpotifySettingsViewController ()

@end

@implementation LNKSpotifySettingsViewController

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
    [self.textField resignFirstResponder];
}

- (IBAction)doneButtonPressed:(id)sender {
    [self.activityInd startAnimating];
    NSString *name = self.textField.text;
    [self.linkManager openLinkWithAppName:@"spotify"
                                  andLink:[NSString stringWithFormat:@"spotify:search:%@",name]
                                andParams:[@{} mutableCopy]
                                 andTitle:@"Spotify"
                                  andInfo:[NSString stringWithFormat:@"Spotify Playlist: %@",name]];
}

@end
