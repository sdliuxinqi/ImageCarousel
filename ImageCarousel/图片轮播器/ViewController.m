//
//  ViewController.m
//  图片轮播器
//
//  Created by cssweb on 2017/9/22.
//  Copyright © 2017年 cssweb. All rights reserved.
//

#import "ViewController.h"
#import "CollectionView.h"

@interface ViewController (){

    NSArray<NSURL *> *_imageArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:10];
    
    for (int i = 0; i < 3; i++) {
        NSString *fileName = [NSString stringWithFormat:@"%02d", i + 1];
        NSURL *url = [[NSBundle mainBundle] URLForResource:fileName withExtension:@"JPG"];
        [tempArray addObject:url];
    }
    _imageArray = [tempArray copy];
    NSLog(@"%@", _imageArray);
    
    CollectionView *collectionV = [[CollectionView alloc]initWithURLs:_imageArray];
    collectionV.frame = self.view.bounds;
    [self.view addSubview:collectionV];
    
    NSIndexPath *indxPath = [NSIndexPath indexPathForItem:_imageArray.count inSection:0];
    [collectionV scrollToItemAtIndexPath:indxPath atScrollPosition:UICollectionViewScrollPositionNone animated:NO];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
