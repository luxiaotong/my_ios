//
//  LearnPerson.m
//  learnObjectC
//
//  Created by 逯晓瞳 on 15/4/3.
//  Copyright (c) 2015年 逯晓瞳. All rights reserved.
//

#import "LearnPerson.h"

@implementation LearnPerson

+ (id) person {
    return [[self alloc] init];
}

- (id) init {
    return [self initWithFirstName:@"Shannonaaaa" lastName:@"Lu"];
}

- (LearnPerson *) initWithFirstName:(NSString *)firstName lastName:(NSString *) lastName {
    self = [super init];
    if ( self ) {
        _firstName = firstName;
        _lastName  = lastName;
    }
    
    return self;
}

- (void) sayHello {
    NSString *word = [NSString stringWithFormat:@"Hi, I'm %@ %@", self.firstName, self.lastName];
    [self saySomething:word];
}

- (void) sayNight {
    [self saySomething:@"Good night, Shannon."];
}

- (void) saySomething:(NSString *)word {
    NSLog(@"%@", word);
}

- (void) sayHello1:(int)param1 Param2:(int)param2 Param3:(int)param3 {
    NSLog(@"I'm Shannon Lu. %d %d %d", param1, param2, param3);
}

- (void)dealloc {
    NSLog(@"LearnPerson is being deallocated");
}

@end
