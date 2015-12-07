//
//  BIDCollectionViewController.m
//  BIDDialogViewer
//
//  Created by 逯晓瞳 on 15/11/28.
//  Copyright © 2015年 逯晓瞳. All rights reserved.
//

#import "BIDCollectionViewController.h"
#import "BIDHeaderCollectionViewCell.h"
#import "BIDContentCollectionViewCell.h"

@interface BIDCollectionViewController ()

@property (copy, nonatomic) NSArray *sections;

@end

@implementation BIDCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    self.sections =
    @[
      @{@"header" : @"First Witch", @"content" : @"Hey, when will the three of us meet up later?"},
      @{@"header" : @"Second Witch", @"content" : @"When everything's straitened out."},
      @{@"header" : @"Third Witch", @"content" : @"That'll be just before sunset."},
      @{@"header" : @"First Witch", @"content" : @"Where?"},
      @{@"header" : @"Second Witch", @"content" : @"The dirt patch"},
      @{@"header" : @"Third Witch", @"content" : @"I guess we'll see Mac there."},
      ];
    
    [self.collectionView registerClass:[BIDContentCollectionViewCell class]
            forCellWithReuseIdentifier:@"content"];
    [self.collectionView registerClass:[BIDHeaderCollectionViewCell class]
            forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                   withReuseIdentifier:@"header"];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    UIEdgeInsets contentInset =  self.collectionView.contentInset;
    contentInset.top = 20;
    [self.collectionView setContentInset:contentInset];
    
    UICollectionViewLayout *layout = self.collectionView.collectionViewLayout;
    UICollectionViewFlowLayout *flow = (UICollectionViewFlowLayout *)layout;
    flow.sectionInset = UIEdgeInsetsMake(10, 20, 30, 30);
    
    flow.headerReferenceSize = CGSizeMake(100, 25);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)wordsInSection:(NSInteger)section {
    NSString *content = self.sections[section][@"content"];
    NSArray *words = [content componentsSeparatedByString:@" "];
    return words;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [self.sections count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[self wordsInSection:section] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    BIDContentCollectionViewCell *cell =
    [self.collectionView dequeueReusableCellWithReuseIdentifier:@"content" forIndexPath:indexPath];
    
    cell.text = [self wordsInSection:indexPath.section][indexPath.row];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath {
    
    if ( [kind isEqual:UICollectionElementKindSectionHeader] ) {
        BIDHeaderCollectionViewCell *cell =
        [self.collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                withReuseIdentifier:@"header"
                                                       forIndexPath:indexPath];
        
        cell.text = self.sections[indexPath.section][@"header"];
        return cell;
    }
    return nil;
}

-(CGSize)collectionView:(UICollectionView *)collectionView
                 layout:(UICollectionViewLayout *)collectionViewLayout
 sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *words = [self wordsInSection:indexPath.section];
    return [[BIDContentCollectionViewCell class] sizeForContentString:words[indexPath.row]];
    
}

@end
