//
//  LNKContactSelectionViewController.h
//  Linklyy
//
//  Created by Josh Pearlstein on 9/13/14.
//  Copyright (c) 2014 Linklyy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LNKDataManager;

@interface LNKContactSelectionViewController : UIViewController

//Injected
@property(nonatomic) LNKDataManager *dataManager;

@property(nonatomic) NSMutableDictionary *alphabeticalContacts;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
