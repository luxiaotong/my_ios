//
//  TFDigitTextField.h
//  TestForSixDigitPassward
//
//  Created by 逯晓瞳 on 16/3/18.
//  Copyright © 2016年 逯晓瞳. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TFDigitTextField : UITextField <UIKeyInput>

@property (nonatomic, weak) id digitDelegate;

@end

@protocol TFDigitTextFieldDelegate

@optional
- (void)backToLastTextField:(TFDigitTextField *)textField;

@end