//
//  BNRContainer.h
//  RandomItems
//
//  Created by 逯晓瞳 on 15/5/9.
//  Copyright (c) 2015年 逯晓瞳. All rights reserved.
//

#import "BNRItem.h"

@interface BNRContainer : BNRItem
{
    NSMutableArray *_subitems;
}

- (void) setSubitems:(BNRItem *)item;
- (NSMutableArray *) subitems;
@end
