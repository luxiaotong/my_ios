//
//  TFDigitTextField.m
//  TestForSixDigitPassward
//
//  Created by 逯晓瞳 on 16/3/18.
//  Copyright © 2016年 逯晓瞳. All rights reserved.
//

#import "TFDigitTextField.h"

@implementation TFDigitTextField

- (void)deleteBackward {
    [self.digitDelegate backToLastTextField:self];
}

//Hide the cursor
- (CGRect)caretRectForPosition:(UITextPosition *)position
{
    return CGRectZero;
}

@end
