//
//  ViewController.m
//  UseCell
//
//  Created by baidu on 15/12/16.
//  Copyright © 2015年 Luxiaotong. All rights reserved.
//

#import "ViewController.h"
#import "UCSelfTableViewCell.h"
#import "UCSelfTryTableViewCell.h"

@interface ViewController ()

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView = [[UITableView alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"UCSelfTableViewCell" bundle:nil]forCellReuseIdentifier:@"UCSelfTableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"UCSelfTryTableViewCell" bundle:nil] forCellReuseIdentifier:@"UCSelfTryTableViewCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    
    if ( indexPath.row == 0 ) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
        cell.imageView.image = [UIImage imageNamed:@"伊斯坦堡.jpeg"];
        cell.textLabel.text = @"defalut";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    } else if ( indexPath.row == 1 ) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"UITableViewCell"];
        cell.imageView.image = [UIImage imageNamed:@"伊斯坦堡.jpeg"];
        cell.textLabel.text = @"value1";
        cell.detailTextLabel.text = @"value1";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    } else if ( indexPath.row == 2 ) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"UITableViewCell"];
//        cell.imageView.image = [UIImage imageNamed:@"伊斯坦堡.jpeg"];
        cell.textLabel.text = @"value2";
        cell.detailTextLabel.text = @"value2";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    } else if ( indexPath.row == 3 ) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"UITableViewCell"];
        cell.imageView.image = [UIImage imageNamed:@"伊斯坦堡.jpeg"];
        cell.textLabel.text = @"subtitle";
        cell.detailTextLabel.text = @"subtitle";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    } else if ( indexPath.row == 4 ) {
        
        UCSelfTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"UCSelfTableViewCell"];
        cell.labelLeft.text = @"selfLeft";
        cell.labelMiddle.text = @"selfoMiddle";
        return cell;
        
    } else if ( indexPath.row == 5 ) {

        UCSelfTryTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"UCSelfTryTableViewCell"];
        cell.labelLeft.text = @"selfTryLeft";
        cell.labelRight.text = @"selfTryRigth";
        return cell;
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 40;
}

@end
