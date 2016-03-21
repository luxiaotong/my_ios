//
//  TFDigitTextField.m
//  TestForSixDigitPassward
//
//  Created by 逯晓瞳 on 16/3/18.
//  Copyright © 2016年 逯晓瞳. All rights reserved.
//

#import "TFDigitTextField.h"

@implementation TFDigitTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)deleteBackward {
    [self.digitDelegate backToLastTextField:self];
}

- (CGRect)caretRectForPosition:(UITextPosition *)position
{
    return CGRectZero;
}

@end
