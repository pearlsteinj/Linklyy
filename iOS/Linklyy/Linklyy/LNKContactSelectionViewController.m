//
//  LNKContactSelectionViewController.m
//  Linklyy
//
//  Created by Josh Pearlstein on 9/13/14.
//  Copyright (c) 2014 Linklyy. All rights reserved.
//

#import "LNKContactSelectionViewController.h"

#import "LNKDataManager.h"

@interface LNKContactSelectionViewController () <UITableViewDataSource, UITableViewDelegate>
@property(nonatomic) NSArray *sections;
@end

@implementation LNKContactSelectionViewController
objection_register(LNKContactSelectionViewController)
objection_requires(@"dataManager")

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavBar];
    self.dataManager = [[JSObjection defaultInjector] getObject:[LNKDataManager class]];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.sections = @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z"];
    
}
- (void)setupNavBar {
    
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)done {

}

#pragma mark - UITableViewDataSource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section     {
    NSString *sectionTitle = [self.sections objectAtIndex:section];
    NSArray *sectionContacts = [self.alphabeticalContacts objectForKey:sectionTitle];
    return [sectionContacts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"contact"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"contact"];
    }
    NSString *sectionTitle = [self.sections objectAtIndex:indexPath.section];
    NSArray *sectionContacts = [self.alphabeticalContacts objectForKey:sectionTitle];
    
    UILabel *lbl = (UILabel *)[cell viewWithTag:1];
    lbl.text = [sectionContacts[indexPath.row] objectForKey:@"name"];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 26)];
    UIColor *color = [UIColor whiteColor];
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(19, 10, 120, 17)];
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 30, 320, 1)];
    [line setBackgroundColor:[UIColor colorWithRed:0 green:0.502 blue:1 alpha:1]];
    [view setBackgroundColor:color];
    [view addSubview:line];
    [lbl setText:self.sections[section]];
    [lbl setTextColor:[UIColor colorWithRed:0 green:0.502 blue:1 alpha:1]];
    [lbl setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:15]];
    [view addSubview:lbl];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}

#pragma mark - UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *sectionTitle = [self.sections objectAtIndex:indexPath.section];
    NSArray *sectionContacts = [self.alphabeticalContacts objectForKey:sectionTitle];
    self.dataManager.selectedPhone = [sectionContacts[indexPath.row] objectForKey:@"phone"];
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return [self.sections count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.sections objectAtIndex:section];
}


- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.sections;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return [self.sections indexOfObject:title];
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    //UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
    //[header.textLabel setTextColor:[UIColor whiteColor]];
}

@end
