//
//  BaseCollectionViewController.m
//  Zhuan
//
//  Created by 张金山 on 17/10/9.
//  Copyright © 2017年 黄宜波. All rights reserved.
//

#import "BaseCollectionViewController.h"

@interface BaseCollectionViewController ()

@end

@implementation BaseCollectionViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = white_color;
    [self.view addSubview:self.collectionView];
    [self setUpIndicator];
    [self setUpRefreshData];
}


#pragma EmptyPageDelegate
- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView{
    return YES;
}

#pragma mark UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"BaseCollectionViewCellID";
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}

//设置每个cell的大小 Item网格
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(0, 0);
}

//设置cell上下左右侧距离
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

#pragma mark CollectionViewSectionHeaderDelagate
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath{
    static NSString *footerIdentifier = @"CollectionFooterIdentifier";
    static NSString *headerIdentifier = @"CollectionHeaderIdentifier";
    NSString *reuseIdentifier;
    if ([kind isEqualToString: UICollectionElementKindSectionFooter ]){
        reuseIdentifier = footerIdentifier;
    }else{
        reuseIdentifier = headerIdentifier;
    }
    UICollectionReusableView *view =  [collectionView dequeueReusableSupplementaryViewOfKind :kind   withReuseIdentifier:reuseIdentifier   forIndexPath:indexPath];
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]){
    }else if ([kind isEqualToString:UICollectionElementKindSectionFooter]){
    }
    return view;
}

//Collection 区头的高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(0, 0);
}

//Collection 区尾的高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeMake(0, 0);
}


#pragma mark layLoad
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height - kNavigationBarHeight) collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = white_color;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.alwaysBounceVertical = YES;
        flowLayout.minimumInteritemSpacing = 5;
        flowLayout.minimumLineSpacing = 10;
    }
    return _collectionView;
}

- (NSMutableArray *)dataArray{
    if(!_dataArray){
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

//创建加载指示器
- (void)setUpIndicator{
    _loadingIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self.view addSubview:_loadingIndicator];
    [_loadingIndicator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view).offset(-100);
        make.size.mas_equalTo(CGSizeMake(200, 200));
    }];
}

#pragma mark LoadingIndicator
//开始加载
- (void)startLoad{
    [_loadingIndicator startAnimating];
    self.view.userInteractionEnabled = NO;
}

//关闭加载
- (void)stopLoad{
    [_loadingIndicator stopAnimating];
    self.view.userInteractionEnabled = YES;
}

- (void)setUpRefreshData{
    
}


@end
