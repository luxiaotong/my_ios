//
//  TestInIOSTableViewCell.m
//  TestInIOS
//
//  Created by 逯晓瞳 on 15/4/12.
//  Copyright (c) 2015年 逯晓瞳. All rights reserved.
//

#import "TestInIOSTableViewCell.h"

@implementation TestInIOSTableViewCell

@synthesize nameLabel = _nameLabel;
@synthesize timeLabel = _timeLabel;
@synthesize thumbnailImageView = _thumbnailImageView;
@synthesize contentTextView = _contentTextView;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
