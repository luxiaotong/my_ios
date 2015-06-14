//
//  BNRFeedTableViewController.m
//  BNRNerdfeed
//
//  Created by 逯晓瞳 on 15/6/13.
//  Copyright (c) 2015年 逯晓瞳. All rights reserved.
//

#import "BNRFeedTableViewController.h"
#import "BNRWebViewController.h"

@interface BNRFeedTableViewController ()

@property (nonatomic) NSArray *courses;

@end

@implementation BNRFeedTableViewController

- (instancetype)init
{
    self = [super init];
    
    //Init table view
    UITableView *tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]
                                                          style:UITableViewStylePlain];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"BNRFeedTableViewCell"];
    self.tableView = tableView;
    
    //Get data from web
    NSURL *url = [NSURL URLWithString:@"http://bookapi.bignerdranch.com/courses.json"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    //NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSDictionary *ret = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    self.courses = ret[@"courses"];
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.courses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BNRFeedTableViewCell" forIndexPath:indexPath];
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"BNRFeedTableViewCell"];

    // Configure the cell...
    cell.textLabel.text = self.courses[indexPath.row][@"title"];
    cell.detailTextLabel.text = self.courses[indexPath.row][@"upcoming"][0][@"instructors"];
    return cell;
}


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    BNRWebViewController *webViewController = [[BNRWebViewController alloc] init];
    
    // Pass the selected object to the new view controller.
    webViewController.webUrl = self.courses[indexPath.row][@"url"];
    
    // Push the view controller.
    [self.navigationController pushViewController:webViewController animated:YES];
}

@end
