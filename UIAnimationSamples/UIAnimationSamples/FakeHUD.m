//
//  FakeHUD.m
//  UIAnimationSamples
//
//  Created by 逯晓瞳 on 15/11/13.
//  Copyright © 2015年 逯晓瞳. All rights reserved.
//

#import "FakeHUD.h"
#import "UIView+Animation.h"

@implementation FakeHUD

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
 */

// create a new view from the xib
+ (id) newFakeHUD
{
    UINib *nib = [UINib nibWithNibName:@"FakeHUD" bundle:nil];
    NSArray *nibArray = [nib instantiateWithOwner:self options:nil];
    FakeHUD *me = [nibArray objectAtIndex: 0];
    return me;
}

- (IBAction)btnStop
{
    // the following method will be defined and explained later: ignore the warning
    [self removeWithSinkAnimation:40];
}

@end
