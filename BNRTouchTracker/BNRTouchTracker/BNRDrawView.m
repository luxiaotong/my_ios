//
//  BNRDrawView.m
//  BNRTouchTracker
//
//  Created by 逯晓瞳 on 15/6/1.
//  Copyright (c) 2015年 逯晓瞳. All rights reserved.
//

#import "BNRDrawView.h"
#import "BNRLine.h"

@interface BNRDrawView ()

@property (nonatomic) BNRLine *currentLine;
@property (nonatomic) NSMutableArray *finishedLines;

@end

@implementation BNRDrawView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if ( self ) {
        self.finishedLines = [[NSMutableArray alloc] init];
        self.backgroundColor = [UIColor grayColor];
    }
    return self;
}

- (void)strokeLine:(BNRLine *)line
{
    UIBezierPath *bp    = [[UIBezierPath alloc] init];
    bp.lineWidth        = 10;
    bp.lineCapStyle     = kCGLineCapRound;
    
    [bp moveToPoint:line.begin];
    [bp addLineToPoint:line.end];
    [bp stroke];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [[UIColor blackColor] set];
    for ( BNRLine *line in self.finishedLines ) {
        [self strokeLine:line];
    }
    
    if ( self.currentLine ) {
        [[UIColor redColor] set];
        [self strokeLine:self.currentLine];
    }
}

#pragma mark - touch

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch      = [touches anyObject];
    CGPoint location    = [touch locationInView:self];
    
    self.currentLine        = [[BNRLine alloc] init];
    self.currentLine.begin  = location;
    self.currentLine.end    = location;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
    
    self.currentLine.end = location;
    
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.finishedLines addObject:self.currentLine];

    self.currentLine = nil;
    
    [self setNeedsDisplay];
}


@end
