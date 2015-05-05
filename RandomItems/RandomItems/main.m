//
//  main.m
//  RandomItems
//
//  Created by 逯晓瞳 on 15/5/4.
//  Copyright (c) 2015年 逯晓瞳. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        for ( int i = 0; i < 10; i ++) {
            BNRItem *bnrItemObj = [BNRItem randomItem];
            NSLog(@"%@", bnrItemObj);
        }
    }
    return 0;
}
