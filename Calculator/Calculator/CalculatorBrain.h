//
//  CalculatorBrain.h
//  Calculator
//
//  Created by 逯晓瞳 on 15/4/21.
//  Copyright (c) 2015年 逯晓瞳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

- (void) fillBrainWithNumber:(NSNumber *)number;
- (void) fillBrainWithOperators:(NSString *)operators;
- (NSNumber *) operationWithBrain;
- (void) clearBrain;

@end
