//
//  ATMorePlanViewController.m
//  AiTiTi
//
//  Created by 张金山 on 2018/5/31.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATMorePlanViewController.h"
#import "ATSystemRecommendViewController.h"
#import "ATStudentRecommendViewController.h"
#import "UIImage+ZJSImageColor.h"
#define SegMentViewHeight 50

@interface ATMorePlanViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, weak) UICollectionView *collectionMain;
@property (nonatomic, strong) NSArray *controllersClass;
@property (nonatomic, strong) NSMutableArray *controllers;
@property (nonatomic,strong) UISegmentedControl *segmentControl;

@end

@implementation ATMorePlanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNaviAttributes];
    [self createCollectionView];
}



- (void)setUpNaviAttributes{
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    self.controllersClass = @[@"ATSystemRecommendViewController",@"ATStudentRecommendViewController"];
    self.navigationItem.titleView = self.segmentControl;
    //    self.navigationItem.titleView.frame = CGRectMake(0, 0, 150, 36);
}

- (void)createCollectionView{
    UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc]init];
    flowlayout.minimumInteritemSpacing = 2;
    flowlayout.minimumLineSpacing = 2;
    CGRect frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height );
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
        for(int i = 0; i < self.controllersClass.count;i++){
            ATSystemRecommendViewController *listVC = [[ATSystemRecommendViewController alloc] init];
            [self addChildViewController:listVC];
            [controllers addObject:listVC];
            
            ATStudentRecommendViewController *mapVC = [[ATStudentRecommendViewController alloc] init];
            [self addChildViewController:mapVC];
            [controllers addObject:mapVC];
        }
        _controllers = controllers;
    }
    return _controllers;
}


- (UISegmentedControl *)segmentControl{
    if(!_segmentControl){
        NSArray *segmentedArray = [NSArray arrayWithObjects:@"系统推荐",@"同学推荐",nil];
        _segmentControl = [[UISegmentedControl alloc]initWithItems:segmentedArray];
        _segmentControl.frame = CGRectMake(0, 0, 178, 30);
        _segmentControl.layer.cornerRadius = 15.0f;
        _segmentControl.clipsToBounds = YES;
        _segmentControl.layer.borderColor = RGB(221, 221, 221).CGColor;
        _segmentControl.layer.borderWidth = 1.0;
        _segmentControl.backgroundColor = [UIColor whiteColor];
        UIFont *font = [UIFont systemFontOfSize:13.0f];
        NSDictionary *attributes = [NSDictionary dictionaryWithObject:font
                                                               forKey:UITextAttributeFont];
        NSDictionary *dics = [NSDictionary dictionaryWithObjectsAndKeys:RGB(51, 51, 51),UITextAttributeTextColor,nil];
        //        _segmentControl.tintColor = DEFAULTCOLOR;
        [_segmentControl setTitleTextAttributes:dics forState:UIControlStateNormal];
        [_segmentControl setTitleTextAttributes:attributes
                                       forState:UIControlStateNormal];
        
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor,nil];
        [_segmentControl setTitleTextAttributes:dic forState:UIControlStateSelected];
        _segmentControl.selectedSegmentIndex = 0;
        //        _segmentControl.tintColor = DEFAULTCOLOR;
        [_segmentControl addTarget:self action:@selector(indexDidChangeForSegmentedControl:) forControlEvents:UIControlEventValueChanged];
//        [_segmentControl setBackgroundImage:[UIImage ZJS_imageWithColor:RGB(34, 208, 144)]
//                                   forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
        [_segmentControl setBackgroundImage:[UIImage ZJS_imageWithColor:RGB(34, 208, 144)]
                                   forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
        [_segmentControl setBackgroundImage:[UIImage ZJS_imageWithColor:[UIColor whiteColor]]
                                   forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        //取代分割线
        [_segmentControl setDividerImage:[UIImage ZJS_imageWithColor:[UIColor clearColor]] forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
    return _segmentControl;
}

- (void)indexDidChangeForSegmentedControl:(UISegmentedControl *)sender{
    NSInteger selectIndex = sender.selectedSegmentIndex;
    if(selectIndex == 0){
        [_segmentControl setBackgroundImage:[UIImage ZJS_imageWithColor:RGB(34, 208, 144)]
                                   forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    }else{
        [_segmentControl setBackgroundImage:[UIImage ZJS_imageWithColor:RGB(131, 109, 249)]
                                   forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    }
    [self.collectionMain scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:selectIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}
@end

