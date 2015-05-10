//
//  main.m
//  RandomItems
//
//  Created by 逯晓瞳 on 15/5/4.
//  Copyright (c) 2015年 逯晓瞳. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"
#import "BNRContainer.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /*
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
        for ( int i = 0; i < 10; i ++) {
            BNRItem *bnrItemObj = [BNRItem randomItem];
            [items addObject:bnrItemObj];
        }
        
        for (BNRItem *item in items) {
            NSLog(@"%@", item);
        }
         */
        
        BNRContainer *containerObj = [[BNRContainer alloc] init];
        
        
        for ( int i = 0; i < 10; i ++) {
            containerObj.subitems = [BNRItem randomItem];
        }
        
        NSLog(@"%@", containerObj);
    }
    return 0;
}
