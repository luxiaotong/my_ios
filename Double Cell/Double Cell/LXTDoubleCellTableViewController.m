//
//  LXTDoubleCellTableViewController.m
//  Double Cell
//
//  Created by 逯晓瞳 on 15/9/19.
//  Copyright © 2015年 逯晓瞳. All rights reserved.
//

#import "LXTDoubleCellTableViewController.h"
#import "LXTFirstRowTableViewCell.h"
#import "LXTSecondRowTableViewCell.h"
#import "LXTThirdRowTableViewCell.h"
#import "LXTFourthRowTableViewCell.h"

@interface LXTDoubleCellTableViewController ()

@end

@implementation LXTDoubleCellTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.tableView registerClass:[LXTFirstRowTableViewCell class] forCellReuseIdentifier:@"firstRow"];
    [self.tableView registerClass:[LXTSecondRowTableViewCell class] forCellReuseIdentifier:@"secondRow"];
    [self.tableView registerNib:[UINib nibWithNibName:@"LXTThirdRowTableViewCell" bundle:nil]
         forCellReuseIdentifier:@"thirdRow"];
    [self.tableView registerNib:[UINib nibWithNibName:@"LXTFourthRowTableViewCell" bundle:nil]
         forCellReuseIdentifier:@"fourthRow"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ( section % 2 == 1 ) {
        return 1;
    }
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Configure the cell...
    
    //cell.textLabel.text = @"aaaaaaaa";
    
    UITableViewCell *cell = nil;
    if ( indexPath.row == 0 ) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"firstRow"];
    } else if ( indexPath.row == 1 ) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"secondRow"];
    } else if ( indexPath.row == 2 ) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"thirdRow"];
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"fourthRow"];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return @" ";
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
