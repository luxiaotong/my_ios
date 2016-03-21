//
//  TestViewController.m
//  TestForStoryBoard
//
//  Created by baidu on 16/3/2.
//  Copyright © 2016年 Luxiaotong. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushToTestTabBar:(UIButton *)sender {
    UIStoryboard *tabBarStoryBoard = [UIStoryboard storyboardWithName:@"TestForTabBar" bundle:[NSBundle mainBundle]];
    TestViewController *tabBarController = [tabBarStoryBoard instantiateInitialViewController];
    tabBarController.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:tabBarController animated:TRUE completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
