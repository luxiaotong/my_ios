//
//  BNRItem.m
//  RandomItems
//
//  Created by 逯晓瞳 on 15/5/4.
//  Copyright (c) 2015年 逯晓瞳. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

+ (instancetype) randomItem
{
    NSArray *randomAdjectiveList    = @[@"Fluffy", @"Rusty", @"Shiny"];
    NSArray *randomNounList         = @[@"Bear", @"Pork", @"Mac"];
    
    int adjectiveIndex              = arc4random() % randomAdjectiveList.count;
    int nounIndex                   = arc4random() % randomNounList.count;
    
    NSString *randomName            = [NSString stringWithFormat:@"%@ %@",
                                                randomAdjectiveList[adjectiveIndex],
                                                randomNounList[nounIndex]];
    
    int randomValue                 = arc4random() % 100;
    
    NSString *randomSerialNumber    = [NSString stringWithFormat:@"%c%c%c%c%c",
                                       '0' + arc4random() % 10,
                                       'A' + arc4random() % 26,
                                       '0' + arc4random() % 10,
                                       'A' + arc4random() % 26,
                                       '0' + arc4random() % 10];
    
    BNRItem *bnrRandomItem          = [[BNRItem alloc] initWithItemName:randomName
                                                         valueInDollars:randomValue
                                                           serialNumber:randomSerialNumber];
    
    return bnrRandomItem;
}

- (instancetype) init
{
    return [self initWithItemName:@"item"];
}

- (instancetype) initWithItemName:(NSString *)name
                   valueInDollars:(int)value
                     serialNumber:(NSString *)sNumber
{
    self = [super init];
    
    if ( self ) {
        _itemName = name;
        _valueInDollars = value;
        _serialNumber = sNumber;
        _dateCreated = [[NSDate alloc] init];
    }
    
    return self;
}

- (instancetype) initWithItemName:(NSString *)name
{
    return [self initWithItemName:name valueInDollars:0 serialNumber:@""];
}

- (instancetype) initWithItemName:(NSString *)name
                     serialNumber:(NSString *)sNumber
{
    return [self initWithItemName:name valueInDollars:0 serialNumber:sNumber];
}

/*
- (NSString *) itemName
{
    return _itemName;
}

- (void) setItemName:(NSString *)str
{
    _itemName = str;
}

- (NSString *) serialNumber
{
    return _serialNumber;
}

- (void) setSerialNumber:(NSString *)str
{
    _serialNumber = str;
}

- (int) valueInDollars
{
    return _valueInDollars;
}

- (void) setValueInDollars:(int)v
{
    _valueInDollars = v;
}

- (NSDate *)dateCreated
{
    return _dateCreated;
}
*/

- (NSString *) description
{
    return [NSString stringWithFormat:@"itemName: %@, valueInDollars: %d, serialNumber: %@, dateCreated:%@", self.itemName, self.valueInDollars, self.serialNumber, self.dateCreated];
}

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    
    if ( self ) {
        self.itemName       = [coder decodeObjectForKey:@"itemName"];
        self.serialNumber   = [coder decodeObjectForKey:@"serialNumber"];
        self.valueInDollars = [coder decodeIntForKey:@"valueInDollars"];
        self.dateCreated    = [coder decodeObjectForKey:@"dateCreated"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    if ( self ) {
        [aCoder encodeObject:self.itemName forKey:@"itemName"];
        [aCoder encodeObject:self.serialNumber forKey:@"serialNumber"];
        [aCoder encodeInt:self.valueInDollars forKey:@"valueInDollars"];
        [aCoder encodeObject:self.dateCreated forKey:@"dateCreated"];
    }
}

@end
