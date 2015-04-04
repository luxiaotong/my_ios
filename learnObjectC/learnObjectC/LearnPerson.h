//
//  LearnPerson.h
//  learnObjectC
//
//  Created by 逯晓瞳 on 15/4/3.
//  Copyright (c) 2015年 逯晓瞳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LearnPerson : NSObject

@property NSString *firstName;
@property NSString *lastName;
@property NSDate   *dateOfBirth;

- (void) sayHello;
- (void) sayHello1:(int)param1 Param2:(int)param2 Param3:(int)param3;
+ (void) person;

@end
