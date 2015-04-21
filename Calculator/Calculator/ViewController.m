//
//  ViewController.m
//  Calculator
//
//  Created by 逯晓瞳 on 15/4/19.
//  Copyright (c) 2015年 逯晓瞳. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *resultNumber;
@property NSMutableString *number;
@property BOOL isEnteringNumber;

@property NSNumber *firstNumber;
@property NSNumber *secondNumber;
@property NSString *aOperator;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)inputNumber:(UIButton *)sender {
    
    if ( self.resultNumber != nil ) {
        self.number = (NSMutableString *) self.resultNumber.text;
        self.resultNumber.text = [self.number stringByAppendingString:sender.currentTitle];
    } else {
        self.resultNumber.text = [self.number initWithString:sender.currentTitle];
    }
    
}
- (IBAction)operateNumber:(UIButton *)sender {
    NSString *operator = sender.currentTitle;
    
    /*
    if ( [operator isEqual: @"+"] ) {
        if ( self.firstNumber == nil ) {
            self.firstNumber = [NSNumber numberWithInt:self.resultNumber.text.intValue];
        } else {
            int tmpNumber = self.firstNumber.intValue + self.resultNumber.text.intValue;
            self.resultNumber.text = [NSString stringWithFormat:@"%d", tmpNumber];
            self.firstNumber = nil;
        }
    }
     */
}

- (IBAction)clearNumber:(UIButton *)sender {
    self.resultNumber.text = @"0";
}


@end
