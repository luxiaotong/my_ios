//
//  LearnPerson.h
//  learnObjectC
//
//  Created by 逯晓瞳 on 15/4/3.
//  Copyright (c) 2015年 逯晓瞳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LearnPerson : NSObject

@property (copy) NSString *firstName;
@property (copy) NSString *lastName;
@property NSDate   *dateOfBirth;
@property (readonly) NSInteger *height;
@property (readonly) NSInteger *weight;

+ (id) person;
- (id) init;
- (LearnPerson *) initWithFirstName:(NSString *)firstName lastName:(NSString *) lastName;
- (void) sayHello;
- (void) sayNight;
- (void) saySomething:(NSString *)word;
- (void) sayHello1:(int)param1 Param2:(int)param2 Param3:(int)param3;
- (void) dealloc;

- (void) measureHeight:(NSInteger *)height;
- (void) measureWeight:(NSInteger *)weight;

@end
