//
//  LearnPerson.m
//  learnObjectC
//
//  Created by 逯晓瞳 on 15/4/3.
//  Copyright (c) 2015年 逯晓瞳. All rights reserved.
//

#import "LearnPerson.h"

@implementation LearnPerson

+ (LearnPerson *) person {
    return [[self alloc] init];
}

- (void) sayHello {
    [self saySomething:@"Hi, I'm Shannon Lu."];
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


@end
