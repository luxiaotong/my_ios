//
//  CalculatorBrain.m
//  Calculator
//
//  Created by 逯晓瞳 on 15/4/21.
//  Copyright (c) 2015年 逯晓瞳. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain ()

@property NSNumber *firstNumber;
@property NSNumber *secondNumber;
@property NSString *aOperator;

@end

@implementation CalculatorBrain

- (int)operationPlusWithFirstNumber:(NSNumber *)firstNumber
{
    int resultNumber;
    
    if ( self.firstNumber == nil ) {
        self.firstNumber = firstNumber;
        resultNumber = 0;
    } else {
        resultNumber = self.firstNumber.intValue + firstNumber.intValue;
    }
    
    return resultNumber;
    
}

@end
