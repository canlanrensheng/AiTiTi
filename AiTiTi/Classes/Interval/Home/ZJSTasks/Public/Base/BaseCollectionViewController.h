//
//  BaseCollectionViewController.h
//  ZhuanMCH
//
//  Created by txooo on 17/6/29.
//  Copyright © 2017年 黄宜波. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseCollectionViewControllerProtocol.h"

@interface BaseCollectionViewController : BaseViewController<UICollectionViewDelegate,UICollectionViewDataSource,BaseCollectionViewControllerProtocol>

@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,strong) NSMutableArray *dataArray;

@property (nonatomic,strong) RACCommand *loadDataCommond;

@property (nonatomic,strong) UIActivityIndicatorView *loadingIndicator;

- (void)startLoad;

- (void)stopLoad;

@end
