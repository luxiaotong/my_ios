//
//  BNRItemStore.h
//  BNRHomepwner
//
//  Created by 逯晓瞳 on 15/5/17.
//  Copyright (c) 2015年 逯晓瞳. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BNRItem;

@interface BNRItemStore : NSObject

+ (instancetype)sharedStore;
- (BNRItem *)createItem;
- (BNRItem *)createEmptyItem;
- (NSArray *)allItems;
- (void)removeAtIndex:(NSInteger)index;
- (void)removeAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;

@end
