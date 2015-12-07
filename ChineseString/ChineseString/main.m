//
//  main.m
//  ChineseString
//
//  Created by baidu on 15/12/7.
//  Copyright © 2015年 Luxiaotong. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSString *str = @"你好世界hhh";
        
        NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        NSData* da = [str dataUsingEncoding:enc];
        NSLog(@"%ld", [da length]);
        NSLog(@"%ld", [str length]);
        
        
        //截取字符index为2 到结尾之间的内容
        NSString * from = [str substringFromIndex:2];
        NSLog(@"%@", from);
    }
    return 0;
}
