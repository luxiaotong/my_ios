//
//  BIDContentCollectionViewCell.m
//  BIDDialogViewer
//
//  Created by 逯晓瞳 on 15/11/28.
//  Copyright © 2015年 逯晓瞳. All rights reserved.
//

#import "BIDContentCollectionViewCell.h"

@implementation BIDContentCollectionViewCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if ( self ) {
        self.label = [[UILabel alloc] initWithFrame:self.contentView.bounds];
        self.label.opaque = NO;
        self.label.backgroundColor = [UIColor colorWithRed:0.8 green:0.9 blue:1.0 alpha:1.0];
        self.label.textColor = [UIColor blackColor];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.font = [[self class] defaultFont];
        [self.contentView addSubview:self.label];
    }
    return self;
}

+ (UIFont *)defaultFont {
    return [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
}

- (void)setText:(NSString *)text {
    self.label.text = text;
    CGSize textSize = [[self class] sizeForContentString:text];
    
    CGRect newLabelFrame = self.label.frame;
    CGRect newContentFrame = self.contentView.frame;
    
    newLabelFrame.size = textSize;
    newContentFrame.size = textSize;
    
    self.label.frame = newLabelFrame;
    self.contentView.frame = newContentFrame;
}

+ (CGSize)sizeForContentString:(NSString *)string {
    CGSize maxSize = CGSizeMake(300, 1000);
    NSStringDrawingOptions opts = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineBreakMode:NSLineBreakByCharWrapping];
    
    NSDictionary *attributes = @{NSFontAttributeName: [self defaultFont],
                                 NSParagraphStyleAttributeName: style};
    CGRect rect = [string boundingRectWithSize:maxSize
                                       options:opts
                                    attributes:attributes
                                       context:nil];
    return rect.size;
}

@end
