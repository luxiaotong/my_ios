//
//  LXTSecondRowTableViewCell.m
//  Double Cell
//
//  Created by 逯晓瞳 on 15/9/27.
//  Copyright © 2015年 逯晓瞳. All rights reserved.
//

#import "LXTSecondRowTableViewCell.h"

@implementation LXTSecondRowTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    UILabel *lbl1 = [[UILabel alloc] init];
    [lbl1 setFrame:CGRectMake(10,10,100,20)];
    lbl1.backgroundColor=[UIColor clearColor];
    lbl1.textColor=[UIColor blackColor];
    lbl1.userInteractionEnabled=NO;
    lbl1.text= @"Second";
    [self addSubview:lbl1];
    
    self.backgroundColor = [UIColor lightGrayColor];
    
    return self;
}
@end
