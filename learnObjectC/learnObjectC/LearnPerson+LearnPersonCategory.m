//
//  LearnPerson+LearnPersonCategory.m
//  learnObjectC
//
//  Created by 逯晓瞳 on 15/4/6.
//  Copyright (c) 2015年 逯晓瞳. All rights reserved.
//

#import "LearnPerson+LearnPersonCategory.h"

@implementation LearnPerson (LearnPersonCategory)

- (void) displayPersonName {
    NSString *word = [NSString stringWithFormat:@"%@...%@",self.lastName,self.firstName];
    NSLog(@"%@", word);
}

@end
