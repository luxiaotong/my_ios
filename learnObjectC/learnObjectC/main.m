//
//  main.m
//  learnObjectC
//
//  Created by 逯晓瞳 on 15/4/3.
//  Copyright (c) 2015年 逯晓瞳. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LearnPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        LearnPerson *lpObj = [LearnPerson new];
        [lpObj sayHello1:1 Param2:2 Param3:3];
    }
    return 0;
}
