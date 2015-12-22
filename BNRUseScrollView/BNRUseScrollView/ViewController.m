//
//  ViewController.m
//  BNRUseScrollView
//
//  Created by baidu on 15/12/22.
//  Copyright © 2015年 Luxiaotong. All rights reserved.
//

#import "ViewController.h"
#import "BNRCircleScrollView.h"
#import "BNRCircleView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGRect scrollRect = CGRectMake(0, 0, screenRect.size.width * 2, screenRect.size.height);
    
    BNRCircleView *circleView = [[BNRCircleView alloc] initWithFrame:scrollRect];
    
    BNRCircleScrollView *circleScrollView = [[BNRCircleScrollView alloc] initWithFrame:screenRect];
    circleScrollView.contentSize = scrollRect.size;
    [circleScrollView addSubview:circleView];
    
    [self.view addSubview:circleScrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
