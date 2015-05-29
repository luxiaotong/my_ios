//
//  BNRDateViewController.m
//  BNRHomepwner
//
//  Created by 逯晓瞳 on 15/5/29.
//  Copyright (c) 2015年 逯晓瞳. All rights reserved.
//

#import "BNRDateViewController.h"

@interface BNRDateViewController ()

@end

@implementation BNRDateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)changeDate:(UIDatePicker *)sender
{
    self.bnrItem.dateCreated = sender.date;
}

@end
