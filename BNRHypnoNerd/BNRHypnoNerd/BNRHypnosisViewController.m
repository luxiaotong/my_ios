//
//  BNRHypnosisViewController.m
//  BNRHypnoNerd
//
//  Created by 逯晓瞳 on 15/5/11.
//  Copyright (c) 2015年 逯晓瞳. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosistView.h"

@interface BNRHypnosisViewController ()

@end

@implementation BNRHypnosisViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    CGRect hypnosisFrame = self.view.bounds;
    self.view = [[BNRHypnosistView alloc] initWithFrame:hypnosisFrame];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
