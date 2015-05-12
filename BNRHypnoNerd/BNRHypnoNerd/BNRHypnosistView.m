//
//  BNRHypnosistView.m
//  Hypnosister
//
//  Created by 逯晓瞳 on 15/5/10.
//  Copyright (c) 2015年 逯晓瞳. All rights reserved.
//

#import "BNRHypnosistView.h"

@interface BNRHypnosistView ()

@property (strong, nonatomic) UIColor *circleColor;

@end

@implementation BNRHypnosistView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if ( self ) {
        self.backgroundColor = [UIColor clearColor];
        self.circleColor     = [UIColor lightGrayColor];
        NSLog(@"background color: %@", self.backgroundColor);
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
    [self.circleColor setStroke];
    [path stroke];
    
    UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
    [logoImage drawInRect:rect];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    float red   = (arc4random() % 100) / 100.0;
    float green = (arc4random() % 100) / 100.0;
    float blue  = (arc4random() % 100) / 100.0;
    
    UIColor *randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    self.circleColor = randomColor;
}

- (void)setCircleColor:(UIColor *)circleColor
{
    _circleColor = circleColor;
    [self setNeedsDisplay];
}

@end
