//
//  BIDHeaderCollectionViewCell.m
//  BIDDialogViewer
//
//  Created by 逯晓瞳 on 15/11/28.
//  Copyright © 2015年 逯晓瞳. All rights reserved.
//

#import "BIDHeaderCollectionViewCell.h"

@implementation BIDHeaderCollectionViewCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if ( self ) {
        self.label.backgroundColor = [UIColor colorWithRed:0.8 green:0.9 blue:1.0 alpha:1.0];
        self.label.textColor = [UIColor blackColor];
    }
    return self;
}

+ (UIFont *)defaultFont {
    return [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
}

@end
