//
//  CalculatorBrain.m
//  Calculator
//
//  Created by 逯晓瞳 on 15/4/21.
//  Copyright (c) 2015年 逯晓瞳. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain ()

@property NSMutableArray *numberArray;
@property NSMutableArray *operatorArray;

@end

@implementation CalculatorBrain

- (CalculatorBrain *) init {
    CalculatorBrain *CBObj = [super init];
    
    if ( CBObj != nil ) {
        self.numberArray   = [NSMutableArray array];
        self.operatorArray = [NSMutableArray array];
    }
    
    return CBObj;
}

- (void) fillBrainWithNumber:(NSNumber *)number {
    [self.numberArray addObject:number];
}

- (void) fillBrainWithOperators:(NSString *)operators {
    [self.operatorArray addObject:operators];
}

- (NSNumber *) operationWithBrain {
    
    NSNumber *resultFromBrain = @0;
    
    if ( self.operatorArray.count > 1 && self.numberArray.count > 1 ) {
        NSNumber *aNumber = self.numberArray.lastObject;
        [self.numberArray removeLastObject];
        
        NSNumber *bNumber = self.numberArray.lastObject;
        [self.numberArray removeLastObject];
        
        NSString *cOperator = self.operatorArray.lastObject;
        [self.operatorArray removeLastObject];
        
        NSString *dOperator = self.operatorArray.lastObject;
        [self.operatorArray removeLastObject];

        
        if ( [dOperator isEqualToString:@"+"] ) {
            resultFromBrain = [NSNumber numberWithInt:(aNumber.intValue + bNumber.intValue)];
        } else if ( [dOperator isEqualToString:@"-"] ) {
            resultFromBrain = [NSNumber numberWithInt:(bNumber.intValue - aNumber.intValue)];
        } else if ( [dOperator isEqualToString:@"*"] ) {
            resultFromBrain = [NSNumber numberWithInt:(aNumber.intValue * bNumber.intValue)];
        } else if ( [dOperator isEqualToString:@"/"] ) {
            resultFromBrain = [NSNumber numberWithInt:(bNumber.intValue / aNumber.intValue)];
        }

        if ( ! [cOperator isEqualToString:@"="] ) {
            [self.numberArray addObject:resultFromBrain];
            [self.operatorArray addObject:cOperator];
        }
    }
    
    return resultFromBrain;
}

- (void) clearBrain {
    [self.numberArray removeAllObjects];
    [self.operatorArray removeAllObjects];
}

@end
