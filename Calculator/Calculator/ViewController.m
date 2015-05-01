//
//  ViewController.m
//  Calculator
//
//  Created by 逯晓瞳 on 15/4/19.
//  Copyright (c) 2015年 逯晓瞳. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorBrain.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *resultNumber;
@property NSMutableString *number;
@property BOOL isEnteringNumber;
@property CalculatorBrain *calcuBrainObj;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.calcuBrainObj = [CalculatorBrain new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)inputNumber:(UIButton *)sender {
    
    if ( self.isEnteringNumber ) {
        self.number = (NSMutableString *) self.resultNumber.text;
        self.resultNumber.text = [self.number stringByAppendingString:sender.currentTitle];
    } else {
        //self.resultNumber.text = [self.number initWithString:sender.currentTitle];
        self.resultNumber.text = sender.currentTitle;
        self.isEnteringNumber = YES;
    }
    
}
- (IBAction)operateNumber:(UIButton *)sender {
    NSString *operators = sender.currentTitle;
    
    NSNumber *currentScreenNumber = [NSNumber numberWithInteger: [self.resultNumber.text integerValue]];
    [self.calcuBrainObj fillBrainWithNumber:currentScreenNumber];
    [self.calcuBrainObj fillBrainWithOperators:operators];
    
    NSNumber *numberFromBrain = [self.calcuBrainObj operationWithBrain];
    if ( numberFromBrain.intValue != 0 ) {
        self.resultNumber.text = [numberFromBrain stringValue];
    }
    
    self.isEnteringNumber = NO;
}

- (IBAction)clearNumber:(UIButton *)sender {
    self.resultNumber.text = @"0";
    self.isEnteringNumber = NO;
    
    [self.calcuBrainObj clearBrain];
}


@end
