//
//  BNRCircleView.m
//  BNRUseScrollView
//
//  Created by baidu on 15/12/22.
//  Copyright © 2015年 Luxiaotong. All rights reserved.
//

#import "BNRCircleView.h"

@implementation BNRCircleView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGPoint center = CGPointMake(rect.size.width/2, rect.size.height/2);
    CGFloat radius = rect.size.width / 2 - 10;
    
    for ( ; radius > 10; radius -= 30 ) {
        
        UIBezierPath *bp = [UIBezierPath bezierPathWithArcCenter:center
                                                          radius:radius
                                                      startAngle:0
                                                        endAngle:M_PI * 2
                                                       clockwise:YES];
        
        [[UIColor whiteColor] setStroke];
        [bp setLineWidth:10.0];
        
        [bp stroke];
    }
}

@end
