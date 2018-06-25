//
//  FooterHelper.m
//  HelperDemo
//
//  Created by 林泽华 on 2018/6/25.
//  Copyright © 2018年 林泽华. All rights reserved.
//

#import "FooterHelper.h"
#import "FooterCell.h"

@interface FooterHelper ()

@property (nonatomic, copy) NSArray *titles;

@end

@implementation FooterHelper

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.titles = @[
                        @"赞",
                        @"收藏",
                        @"分享",
                        @"举报"
                        ];
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return self.titles.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"FooterCell";
    FooterCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    NSString *title = self.titles[indexPath.item];
    [cell.button setTitle:title forState:UIControlStateNormal];
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout *)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsZero;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(64, collectionView.bounds.size.height);
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    
}

@end
