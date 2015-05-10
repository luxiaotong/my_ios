//
//  BNRItem.h
//  RandomItems
//
//  Created by 逯晓瞳 on 15/5/4.
//  Copyright (c) 2015年 逯晓瞳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject
{
    NSString *_itemName;
    NSString *_serialNumber;
    int _valueInDollars;
    NSDate *_dateCreated;
}

+ (instancetype) randomItem;

- (instancetype) initWithItemName:(NSString *)name
                   valueInDollars:(int)value
                     serialNumber:(NSString *)sNumber;

- (instancetype) initWithItemName:(NSString *)name;

- (instancetype) initWithItemName:(NSString *)name
                     serialNumber:(NSString *)sNumber;

- (NSString *) itemName;
- (void) setItemName:(NSString *)str;

- (NSString *) serialNumber;
- (void) setSerialNumber:(NSString *)str;

- (int) valueInDollars;
- (void) setValueInDollars:(int)v;

- (NSDate *)dateCreated;
@end
