//
//  TestForSon.m
//  TestForSuper
//
//  Created by 逯晓瞳 on 16/3/27.
//  Copyright © 2016年 逯晓瞳. All rights reserved.
//

#import "TestForSon.h"

@implementation TestForSon

-(instancetype)init {
    self = [super init];
    if ( self ) {
        NSLog(@"%@", NSStringFromClass([self class]));
        NSLog(@"%@", NSStringFromClass([super class]));
    }
    return self;
}

@end
