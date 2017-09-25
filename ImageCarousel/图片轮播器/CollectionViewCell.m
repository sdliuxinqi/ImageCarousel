//
//  CollectionViewCell.m
//  图片轮播器
//
//  Created by cssweb on 2017/9/22.
//  Copyright © 2017年 cssweb. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell{
    UIImageView *_imageView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [[UIImageView alloc]initWithFrame:self.bounds];
        [self.contentView addSubview:_imageView];
    }
    return self;
}

- (void)setUrl:(NSURL *)url{
    NSData *data = [[NSData alloc]initWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    _imageView.image = image;

}

@end
