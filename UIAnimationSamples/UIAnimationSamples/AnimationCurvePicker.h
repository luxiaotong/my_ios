//
//  AnimationCurvePicker.h
//  UIAnimationSamples
//
//  Created by 逯晓瞳 on 15/11/13.
//  Copyright © 2015年 逯晓瞳. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimationCurvePicker : UIView

@property (weak, nonatomic) IBOutlet UITableView *animationlist;

+ (id) newAnimationCurvePicker:(id)pickDelegate;

@end
