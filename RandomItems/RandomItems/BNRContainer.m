//
//  BNRContainer.m
//  RandomItems
//
//  Created by 逯晓瞳 on 15/5/9.
//  Copyright (c) 2015年 逯晓瞳. All rights reserved.
//

#import "BNRContainer.h"

@implementation BNRContainer

- (instancetype)init
{
    self = [super init];
    
    if ( self ) {
        _subitems = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)setSubitems:(BNRItem *)item
{
    [_subitems addObject:item];
}

- (NSMutableArray *)subitems
{
    return _subitems;
}

- (NSString *) description
{
    NSMutableString *subitemsResult = [[NSMutableString alloc] init];
    int totalValue = 0;
    
    for (BNRItem *item in self.subitems) {
        totalValue += item.valueInDollars;
        subitemsResult = (NSMutableString *) [subitemsResult stringByAppendingFormat:@"name:%@, value:%d\n", item.itemName, item.valueInDollars];
    }
    
    return [subitemsResult stringByAppendingString:[NSString stringWithFormat:@"total value:%d\n", totalValue]];
}
@end
