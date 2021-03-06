//
//  BNRItemViewController.m
//  BNRHomepwner
//
//  Created by 逯晓瞳 on 15/5/17.
//  Copyright (c) 2015年 逯晓瞳. All rights reserved.
//

#import "BNRItemViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"
#import "BNRDetailViewController.h"
#import "BNRItemCell.h"

@interface BNRItemViewController ()

//@property (nonatomic) IBOutlet UIView *headerView;

@end

@implementation BNRItemViewController

/*
- (UIView *)headerView
{
    if ( !_headerView ) {
        [[NSBundle mainBundle] loadNibNamed:@"BNRHeaderView" owner:self options:nil];
    }
    
    return _headerView;
}
*/

- (instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    
    //Navgation
    self.navigationItem.title = @"Homepwner";
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    UIBarButtonItem *newItemButton = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                      target:self
                                      action:@selector(newButton:)];
    self.navigationItem.rightBarButtonItem = newItemButton;
    
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ( section == 0 ) {
        return [[[BNRItemStore sharedStore] allItems] count];
    } else {
        return 1;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BNRItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BNRItemCell"];
    if ( ! cell ) {
        [tableView registerNib:[UINib nibWithNibName:@"BNRItemCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"BNRItemCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"BNRItemCell"];
    }

    if ( indexPath.section == 0 ) {
        BNRItem *bnrItemObj     = [[BNRItemStore sharedStore] allItems][indexPath.row];
        cell.nameLabel.text     = bnrItemObj.itemName;
        cell.serialNumberLabel.text  = bnrItemObj.serialNumber;
        cell.valueLabel.text    = [NSString stringWithFormat:@"%d", bnrItemObj.valueInDollars];
    } else {
        cell.nameLabel.text = @"No more items!";
    }
    
    /*
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BNRItemViewCell"];

    if ( cell ) {
        if ( indexPath.section == 0 ) {
            BNRItem *bnrItemObj = [[BNRItemStore sharedStore] allItems][indexPath.row];
            cell.textLabel.text = [bnrItemObj description];
            tableView.rowHeight = 60;
        } else {
            cell.textLabel.text = @"No more items!";
        }
    }
    */
    
    return cell;
}

- (void)viewDidLoad
{
    //self.tableView.tableHeaderView = self.headerView;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

/*
- (IBAction)editButton:(id)sender
{
    if ( self.tableView.editing == NO ) {
        self.tableView.editing = YES;
    } else {
        self.tableView.editing = NO;
    }
}
*/

- (IBAction)newButton:(id)sender
{
    /*
    [[BNRItemStore sharedStore] createItem];
    NSInteger lastrow = [self.tableView numberOfRowsInSection:0];
    NSIndexPath *insertIndexPath = [NSIndexPath indexPathForRow:lastrow inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[insertIndexPath]
                          withRowAnimation:UITableViewRowAnimationAutomatic];
     */
    BNRDetailViewController *dvc = [[BNRDetailViewController alloc] init];
    dvc.bnrItem = [[BNRItemStore sharedStore] createEmptyItem];
    [self.navigationController pushViewController:dvc animated:YES];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyl forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ( editingStyl == UITableViewCellEditingStyleDelete) {
        [[BNRItemStore sharedStore] removeAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
                                                toIndexPath:(NSIndexPath *)destinationIndexPath
{
    if ( destinationIndexPath.section == 1 ) {
        return;
    } else {
        [[BNRItemStore sharedStore] removeAtIndex:sourceIndexPath.row
                                          toIndex:destinationIndexPath.row];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(3_0)
{
    return @"Remove";
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ( indexPath.section == 1 ) {
        return UITableViewCellEditingStyleNone;
    } else {
        return UITableViewCellEditingStyleDelete;
    }
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ( indexPath.section == 1 ) {
        return NO;
    } else {
        return YES;
    }
}

- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{
    if ( proposedDestinationIndexPath.section == 1 ) {
        return sourceIndexPath;
    } else {
        return proposedDestinationIndexPath;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BNRDetailViewController *dvc = [[BNRDetailViewController alloc] init];
    NSArray *bnrAllItems = [[BNRItemStore sharedStore] allItems];
    dvc.bnrItem = bnrAllItems[indexPath.row];
    [self.navigationController pushViewController:dvc animated:YES];
}

@end
