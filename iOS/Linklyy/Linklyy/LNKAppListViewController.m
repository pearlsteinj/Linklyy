//
//  LNKAppListViewController.m
//  Linklyy
//
//  Created by Josh Pearlstein on 9/13/14.
//  Copyright (c) 2014 Linklyy. All rights reserved.
//

#import "LNKAppListViewController.h"

#import <Canvas/CSAnimation.h>

@interface LNKAppListViewController ()

@end

@implementation LNKAppListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.buttonArr = [[NSMutableArray alloc] init];
    for (int i = 1; i < 12; i++) {
        UIButton *btn = (UIButton *)[self.view viewWithTag:i];
        [self.buttonArr addObject:btn];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
