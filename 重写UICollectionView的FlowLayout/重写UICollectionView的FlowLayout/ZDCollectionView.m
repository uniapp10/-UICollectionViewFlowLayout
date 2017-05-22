//
//  ZDCollectionView.m
//  重写UICollectionView的FlowLayout
//
//  Created by zhudong on 2017/5/19.
//  Copyright © 2017年 zhudong. All rights reserved.
//

#import "ZDCollectionView.h"
#import "ZDCollectionViewCell.h"

@interface ZDCollectionView ()<UICollectionViewDataSource>

@end

@implementation ZDCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.dataSource = self;
        [self registerNib:[UINib nibWithNibName:@"ZDCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"ZDCollectionViewCell"];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZDCollectionViewCell *collectionC = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZDCollectionViewCell" forIndexPath:indexPath];
    collectionC.iconV.image = [UIImage imageNamed:self.dataArray[indexPath.row]];
    return collectionC;
}

- (void)setDataArray:(NSArray *)dataArray{
    _dataArray = dataArray;
    [self reloadData];
}

@end
