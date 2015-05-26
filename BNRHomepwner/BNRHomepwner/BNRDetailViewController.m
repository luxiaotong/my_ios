//
//  BNRDetailViewController.m
//  BNRHomepwner
//
//  Created by 逯晓瞳 on 15/5/25.
//  Copyright (c) 2015年 逯晓瞳. All rights reserved.
//

#import "BNRDetailViewController.h"

@interface BNRDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *seriallNumberField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation BNRDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if ( self.bnrItem ) {
        self.navigationItem.title   = self.bnrItem.itemName;
        self.nameField.text         = self.bnrItem.itemName;
        self.seriallNumberField.text= self.bnrItem.serialNumber;
        self.valueField.text        = [NSString stringWithFormat:@"%d", self.bnrItem.valueInDollars];
        self.dateLabel.text         = [self.bnrItem.dateCreated description];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    if ( self.bnrItem ) {
        self.bnrItem.itemName = self.nameField.text;
        self.bnrItem.serialNumber = self.seriallNumberField.text;
        self.bnrItem.valueInDollars = self.valueField.text.intValue;
    } else {
        BNRItem *bnrItem = [[BNRItem alloc] initWithItemName:self.nameField.text
                                              valueInDollars:self.valueField.text.intValue
                                                serialNumber:self.seriallNumberField.text];
        
    }
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
