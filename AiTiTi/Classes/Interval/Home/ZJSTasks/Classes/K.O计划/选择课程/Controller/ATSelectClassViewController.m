//
//  ATSelectClassViewController.m
//  AiTiTi
//
//  Created by 张金山 on 2018/6/3.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATSelectClassViewController.h"
//
//  ATMorePlanViewController.m
//  AiTiTi
//
//  Created by 张金山 on 2018/5/31.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATSelectClassViewController.h"
#import "ATTrueTitleViewController.h"
#import "ATProjectTitleViewController.h"
#import "ATSystemClassViewController.h"
#import "TopButtonView.h"

#define SegMentViewHeight 50

@interface ATSelectClassViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,strong) TopButtonView *topButtonView;
@property (nonatomic, weak) UICollectionView *collectionMain;
@property (nonatomic, strong) NSArray *controllersClass;
@property (nonatomic, strong) NSMutableArray *controllers;
@property (nonatomic, strong) NSMutableArray *itemsArray;
@property (nonatomic,strong) UISegmentedControl *segmentControl;

@end

@implementation ATSelectClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNaviAttributes];
    [self createCollectionView];
    self.itemsArray = (NSMutableArray *)@[@"真题",@"专题",@"系统课"];
    [self.view addSubview:self.topButtonView];
}

- (TopButtonView *)topButtonView{
    if(!_topButtonView){
        _topButtonView = [[TopButtonView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, SegMentViewHeight) withTitleArray:self.itemsArray];
        _topButtonView.selectTitleColor = RGB(23, 207, 151);
        _topButtonView.titleColor = [UIColor darkGrayColor];
        _topButtonView.showBottomLine = YES;
        @weakify(self);
        [_topButtonView.clickSubject subscribeNext:^(id x) {
            @strongify(self);
            //定位到相应的控制器
            NSInteger selectIndex = [x integerValue];
            [self.collectionMain scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:selectIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
        }];
    }
    return _topButtonView;
}

- (void)setUpNaviAttributes{
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    self.controllersClass = @[@"ATTrueTitleViewController",@"ATProjectTitleViewController",@"ATSystemClassViewController"];
    self.navigationItem.titleView = self.segmentControl;
    //    self.navigationItem.titleView.frame = CGRectMake(0, 0, 150, 36);
    
    self.title = @"选择课程";
}

- (void)createCollectionView{
    UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc]init];
    flowlayout.minimumInteritemSpacing = 2;
    flowlayout.minimumLineSpacing = 2;
    CGRect frame = CGRectMake(0, SegMentViewHeight, self.view.frame.size.width, self.view.frame.size.height - SegMentViewHeight);
    [flowlayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    UICollectionView *collectionMain = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:flowlayout];
    collectionMain.backgroundColor = [UIColor colorWithRed:240/255.0f green:240/255.0f blue:240/255.0f alpha:1];
    collectionMain.dataSource = self;
    collectionMain.delegate = self;
    collectionMain.pagingEnabled = YES;
    
    collectionMain.bounces = NO;
    collectionMain.scrollEnabled = NO;
    collectionMain.showsHorizontalScrollIndicator = NO;
    [collectionMain registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    if (@available(iOS 11.0, *)) {
        collectionMain.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    self.collectionMain = collectionMain;
    
    [self.view addSubview:collectionMain];
    [self.view bringSubviewToFront:collectionMain];
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return collectionView.frame.size;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

#pragma mark - UICollectionViewDataSource && UICollectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.controllersClass.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    UIViewController * vc = self.controllers[indexPath.row];
    [vc.view removeFromSuperview];
    [cell.contentView addSubview:vc.view];
    vc.view.frame = cell.bounds;
    return cell;
}

- (NSMutableArray *)controllers{
    if (!_controllers) {
        NSMutableArray *controllers = [NSMutableArray array];
        ATTrueTitleViewController *listVC = [[ATTrueTitleViewController alloc] init];
        [self addChildViewController:listVC];
        [controllers addObject:listVC];
        
        ATProjectTitleViewController *listVC1 = [[ATProjectTitleViewController alloc] init];
        [self addChildViewController:listVC1];
        [controllers addObject:listVC1];
        
        ATSystemClassViewController *listVC2 = [[ATSystemClassViewController alloc] init];
        [self addChildViewController:listVC2];
        [controllers addObject:listVC2];
        _controllers = controllers;
    }
    return _controllers;
}


- (void)indexDidChangeForSegmentedControl:(UISegmentedControl *)sender{
    NSInteger selectIndex = sender.selectedSegmentIndex;
    [self.collectionMain scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:selectIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}
@end

