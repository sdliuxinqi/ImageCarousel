//
//  CollectionView.m
//  图片轮播器
//
//  Created by cssweb on 2017/9/22.
//  Copyright © 2017年 cssweb. All rights reserved.
//

#import "CollectionView.h"
#import "CollectionFlowLayout.h"
#import "CollectionViewCell.h"

NSString *const cellID = @"cellReuseID";
@interface CollectionView()<UICollectionViewDataSource, UICollectionViewDelegate> {
    NSMutableArray *_urls;
}

@end

@implementation CollectionView

- (instancetype)initWithURLs:(NSArray<NSURL *> *)urls
{
    self = [super initWithFrame:CGRectZero collectionViewLayout:[[CollectionFlowLayout alloc]init]];
    if (self) {
        _urls = [NSMutableArray arrayWithArray:urls];
        for (NSURL *url in urls) {
            [_urls addObject:url];
        }
        self.dataSource = self;
        self.delegate = self;
        [self registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:cellID];
    }
    return self;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _urls.count;
    
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.url = _urls[indexPath.item];
    return cell;
    
}

#pragma mark - UICollectionViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger offset = scrollView.contentOffset.x / self.bounds.size.width;
    if (offset == 0 || offset == _urls.count - 1) {
        if (offset == 0) {
            [scrollView setContentOffset:CGPointMake(_urls.count / 2 * self.bounds.size.width, 0)];
        }else {
            [scrollView setContentOffset:CGPointMake((_urls.count - 1) / 2 * self.bounds.size.width, 0)];
        }
    }
}
@end
