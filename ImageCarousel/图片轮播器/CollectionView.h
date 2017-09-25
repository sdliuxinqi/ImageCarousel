//
//  CollectionView.h
//  图片轮播器
//
//  Created by cssweb on 2017/9/22.
//  Copyright © 2017年 cssweb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionView : UICollectionView
- (instancetype)initWithURLs:(NSArray<NSURL *> *)urls;
@end
