//
//  TryTableViewController.h
//  TryTableView
//
//  Created by baidu on 15/12/23.
//  Copyright © 2015年 Luxiaotong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TryTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end
