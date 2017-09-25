//
//  CollectionFlowLayout.m
//  图片轮播器
//
//  Created by cssweb on 2017/9/22.
//  Copyright © 2017年 cssweb. All rights reserved.
//

#import "CollectionFlowLayout.h"

@implementation CollectionFlowLayout

- (void)prepareLayout{
    [super prepareLayout];
    self.itemSize = self.collectionView.bounds.size;
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView.pagingEnabled = YES;
    self.collectionView.bounces = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
}

@end
