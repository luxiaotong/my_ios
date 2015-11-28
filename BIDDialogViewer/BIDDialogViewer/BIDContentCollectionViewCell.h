//
//  BIDContentCollectionViewCell.h
//  BIDDialogViewer
//
//  Created by 逯晓瞳 on 15/11/28.
//  Copyright © 2015年 逯晓瞳. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDContentCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) UILabel *label;
@property (copy, nonatomic) NSString *text;

+ (CGSize)sizeForContentString:(NSString *)string;

@end
