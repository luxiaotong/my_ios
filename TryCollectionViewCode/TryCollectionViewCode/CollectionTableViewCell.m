//
//  CollectionTableViewCell.m
//  TryCollectionViewCode
//
//  Created by baidu on 15/12/30.
//  Copyright © 2015年 Luxiaotong. All rights reserved.
//

#import "CollectionTableViewCell.h"

@implementation CollectionTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if ( self ) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(100, 100);
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        NSInteger sectionInsetRight = screenRect.size.width - 3 * 100 - 2 * 5 - 5;
        
        layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, sectionInsetRight);
        layout.minimumInteritemSpacing = 5;
        layout.minimumLineSpacing = 5;
    
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"collectionCell"];
        self.collectionView.backgroundColor = [UIColor whiteColor];
        self.collectionView.scrollEnabled = NO;
        [self.contentView addSubview:self.collectionView];
    }
    
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.collectionView.frame = self.contentView.bounds;
}

@end
