//
//  UIView+Animation.m
//  UIAnimationSamples
//
//  Created by 逯晓瞳 on 15/11/13.
//  Copyright © 2015年 逯晓瞳. All rights reserved.
//

#import "UIView+Animation.h"

@implementation UIView (Animation)
- (void)moveTo:(CGPoint)destination duration:(float)secs option:(UIViewAnimationOptions)option {
    [UIView animateWithDuration:secs
                          delay:0.0
                        options:option
                     animations:^{
                         self.frame = CGRectMake(destination.x,
                                                 destination.y,
                                                 self.frame.size.width,
                                                 self.frame.size.height);
                     }
                     completion:nil];
}
@end
