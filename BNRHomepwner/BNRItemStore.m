//
//  BNRItemStore.m
//  BNRHomepwner
//
//  Created by 逯晓瞳 on 15/5/17.
//  Copyright (c) 2015年 逯晓瞳. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemStore ()

@property (nonatomic) NSMutableArray *privateItems;

@end

@implementation BNRItemStore

+ (instancetype)sharedStore
{
    static BNRItemStore *sharedStore = nil;
    if ( sharedStore == nil ) {
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}

- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use +[BNRItemStore sharedStore]" userInfo:nil];
}

- (instancetype)initPrivate
{
    self = [super init];
    if ( !_privateItems ) {
        _privateItems = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (BNRItem *)createItem
{
    BNRItem *bnrItemObj = [BNRItem randomItem];
    [self.privateItems addObject:bnrItemObj];
    return bnrItemObj;
}

- (NSArray *)allItems
{
    return self.privateItems;
}

- (void)removeAtIndex:(NSInteger)index
{
    [self.privateItems removeObjectAtIndex:(NSUInteger)index];
}

@end
