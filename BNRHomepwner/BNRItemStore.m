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

- (BNRItem *)createEmptyItem
{
    BNRItem *bnrItemObj = [[BNRItem alloc] init];
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

- (void)removeAtIndex:(NSUInteger)fromIndex
              toIndex:(NSUInteger)toIndex
{
    BNRItem *tmpItem = self.privateItems[fromIndex];
    [self.privateItems removeObjectAtIndex:fromIndex];
    [self.privateItems insertObject:tmpItem atIndex:toIndex];
}

- (void)saveChange
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *cacheDirectory = [paths objectAtIndex:0];
    NSString *fullPath = [cacheDirectory stringByAppendingPathComponent:@"archive.data"];

    [NSKeyedArchiver archiveRootObject:self.privateItems toFile:fullPath];
//    NSLog(@"fullPath %@", fullPath);
}

- (void)recover
{
    NSLog(@"%@", _privateItems);
    if ( 1 || !_privateItems ) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *cacheDirectory = [paths objectAtIndex:0];
        NSString *fullPath = [cacheDirectory stringByAppendingPathComponent:@"archive.data"];
        
        _privateItems = [NSKeyedUnarchiver unarchiveObjectWithFile:fullPath];
        NSLog(@"fullPath %@", fullPath);
    }
}
@end
