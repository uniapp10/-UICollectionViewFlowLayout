//
//  ViewController.m
//  重写UICollectionView的FlowLayout
//
//  Created by zhudong on 2017/5/19.
//  Copyright © 2017年 zhudong. All rights reserved.
//

#import "ViewController.h"
#import "ZDCollectionView.h"
#import "ZDFlowLayout.h"
#define ScreenSize [UIScreen mainScreen].bounds.size

@interface ViewController ()

@property (nonatomic, strong) ZDCollectionView *collectionV;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat leftM = 50;
    CGFloat btnW = (ScreenSize.width - 3 * leftM) * 0.5;
    UIButton *showBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    showBtn.frame = CGRectMake(leftM, 30, btnW, 40);
    [showBtn setTitle:@"show" forState:UIControlStateNormal];
    showBtn.backgroundColor = [UIColor greenColor];
    
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    closeBtn.frame = CGRectMake(leftM + btnW + leftM, 30, btnW, 40);
    [closeBtn setTitle:@"close" forState:UIControlStateNormal];
    closeBtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:showBtn];
    [self.view addSubview:closeBtn];
    
    [showBtn addTarget:self action:@selector(show) forControlEvents:UIControlEventTouchUpInside];
    [closeBtn addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)show{
    self.collectionV.dataArray = @[@"0.jpg",@"1.png",@"2.png",@"3.png",];
    [self.view addSubview:_collectionV];
}

- (void)close{
    [self.collectionV removeFromSuperview];
}

- (ZDCollectionView *)collectionV{
    if (!_collectionV) {
        CGFloat collectionLeftMargin = 50;
        CGFloat collectionTopMargin = 100;
        CGFloat collectionWidth = ScreenSize.width - 2 * collectionLeftMargin;
        CGFloat collectionHeight = ScreenSize.height - 2 * collectionTopMargin;
        
        CGFloat margin = 30;
        ZDFlowLayout *flowLayout = [[ZDFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(collectionWidth - 5 * margin, collectionHeight - 5 * margin);
        flowLayout.minimumInteritemSpacing = 10;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.needAlpha = true;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 2.5 * margin, 0, 2.5 * margin);
        _collectionV = [[ZDCollectionView alloc] initWithFrame:CGRectMake(collectionLeftMargin, collectionTopMargin , collectionWidth, collectionHeight) collectionViewLayout:flowLayout];
        _collectionV.backgroundColor = [UIColor yellowColor];
    }
    return _collectionV;
}
@end
