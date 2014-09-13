//
//  LNKPhoneSettingsViewController.m
//  Linklyy
//
//  Created by Josh Pearlstein on 9/13/14.
//  Copyright (c) 2014 Linklyy. All rights reserved.
//

#import "LNKPhoneSettingsViewController.h"
#import "LNKContactSelectionViewController.h"
#import "LNKDataManager.h"
#import "LNKLinkManager.h"
#import <RHAddressBook/RHAddressBook.h>
#import <RHAddressBook/RHPerson.h>

@interface LNKPhoneSettingsViewController ()
@property(nonatomic) NSString *selectedPhoneNum;
@end

@implementation LNKPhoneSettingsViewController
objection_register(LNKPhoneSettingsViewController)
objection_requires(@"linkManager", @"dataManager")

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    self.selectedPhoneNum = self.dataManager.selectedPhone;
    if (self.selectedPhoneNum) {
        self.textField.text = self.selectedPhoneNum;
    }
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"contacts"]) {
        NSMutableDictionary *contacts = [self gatherContacts];
        LNKContactSelectionViewController *dest = (LNKContactSelectionViewController *)segue.destinationViewController;
        dest.alphabeticalContacts = contacts;
    }
}


- (IBAction)selectContactButtonPressed:(id)sender {
    RHAddressBook *ab = [[RHAddressBook alloc] init];
    if ([RHAddressBook authorizationStatus] == RHAuthorizationStatusNotDetermined){
        [ab requestAuthorizationWithCompletion:^(bool granted, NSError *error) {
            [self performSegueWithIdentifier:@"contacts" sender:self];
        }];
    } else {
        [self performSegueWithIdentifier:@"contacts" sender:self];
    }
}

- (IBAction)doneButtonPressed:(id)sender {
    [self.activityInd startAnimating];
    [self.linkManager openLinkWithAppName:@"phone"
                                  andLink:[NSString stringWithFormat:@"tel:%@",self.selectedPhoneNum]
                                andParams:[@{} mutableCopy]
                                 andTitle:@"Call"
                                  andInfo:[NSString stringWithFormat:@"Call %@", self.selectedPhoneNum]];
}

#pragma mark - Private

- (NSMutableDictionary *)gatherContacts {
    NSMutableDictionary *alphabeticalList = [[NSMutableDictionary alloc] init];
    NSMutableArray *allContacts = [[NSMutableArray alloc]init];
    RHAddressBook *addressBook = [[RHAddressBook alloc]init];
    NSMutableArray *people = [[addressBook peopleOrderedByLastName]mutableCopy];
    for(RHPerson *person in people){
        RHMultiStringValue *phones = [person phoneNumbers];
        NSString *phone = [[[phones valueAtIndex:0] componentsSeparatedByCharactersInSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]] componentsJoinedByString:@""];
        NSMutableDictionary *contact = [[NSMutableDictionary alloc]init];
        if([person name] != nil && phone != nil){
            [contact setObject:[person name] forKey:@"name"];
            if ([[phone substringToIndex:0]isEqualToString:@"1"]) {
                phone = [phone substringFromIndex:1];
            }
            [contact setObject:phone forKey:@"phone"];
            [allContacts addObject:contact];
            NSString *firstLetter = [[[contact objectForKey:@"name"] substringToIndex:1] uppercaseString];
            if ([alphabeticalList valueForKey:firstLetter] == nil) {
                NSMutableArray *arr = [[NSMutableArray alloc] init];
                [arr addObject:contact];
                [alphabeticalList setObject:arr forKey:firstLetter];
            } else {
                [[alphabeticalList valueForKey:firstLetter] addObject:contact];
            }
        }
    }
    return alphabeticalList;
}

@end
