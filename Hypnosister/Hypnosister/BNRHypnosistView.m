//
//  BNRHypnosistView.m
//  Hypnosister
//
//  Created by 逯晓瞳 on 15/5/10.
//  Copyright (c) 2015年 逯晓瞳. All rights reserved.
//

#import "BNRHypnosistView.h"

@implementation BNRHypnosistView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if ( self ) {
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGRect bounds = self.bounds;
    
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width  / 2;
    center.y = bounds.origin.y + bounds.size.height / 2;
    
    //float radius = MIN(bounds.size.width, bounds.size.height) / 2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    for ( float radius = hypot(bounds.size.width, bounds.size.height) / 2.0; radius > 0; radius -= 20 ) {
        [path moveToPoint:CGPointMake(center.x+radius, center.y)];
        [path addArcWithCenter:center radius:radius startAngle:0 endAngle:M_PI*2 clockwise:YES];
    }
    
    path.lineWidth = 10;
    [[UIColor lightGrayColor] setStroke];
    [path stroke];
    
    UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
    [logoImage drawInRect:rect];
}

@end
