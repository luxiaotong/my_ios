//
//  AnimationCurvePicker.m
//  UIAnimationSamples
//
//  Created by 逯晓瞳 on 15/11/13.
//  Copyright © 2015年 逯晓瞳. All rights reserved.
//

#import "AnimationCurvePicker.h"

@implementation AnimationCurvePicker

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+ (id)newAnimationCurvePicker:(id)pickDelegate {
    UINib *nib = [UINib nibWithNibName:@"AnimationCurvePicker" bundle:nil];
    NSArray *nibArray = [nib instantiateWithOwner:self options:nil];
    AnimationCurvePicker *me = [nibArray objectAtIndex: 0];
    me.animationlist.delegate = pickDelegate;
    me.animationlist.dataSource = pickDelegate;
    return me;
}

@end
