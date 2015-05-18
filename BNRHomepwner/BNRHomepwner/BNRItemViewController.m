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

@implementation BNRItemViewController

- (instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if ( self ) {
        for (int i = 0; i < 10; i ++) {
            [[BNRItemStore sharedStore] createItem];
        }
    }
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
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BNRItemViewCell"];

    if ( cell ) {
        if ( indexPath.section == 0 ) {
            BNRItem * bnrItemObj = [[BNRItemStore sharedStore] allItems][indexPath.row];
            cell.textLabel.text = [bnrItemObj description];
            tableView.rowHeight = 60;
        } else {
            cell.textLabel.text = @"No more items!";
        }
    }
    
    return cell;
}

@end
