//
//  ATTeacherDetailController.m
//  AiTiTi
//
//  Created by 童城 on 2018/5/8.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATTeacherDetailController.h"
#import "ATNavigationBar.h"
#import "ATTeacherDetailHeaderView.h"
#import "FSScrollContentView.h"
#import "ATTeacherDetailTableView.h"
#import "ATTeacherDetailBottomCell.h"
#import "ATDetailContentController.h"

@interface ATTeacherDetailController ()<ATNavigationBarDelegate,UITableViewDelegate,UITableViewDataSource,FSPageContentViewDelegate,FSSegmentTitleViewDelegate>

@property (nonatomic, strong) ATTeacherDetailTableView *tableView;
@property (nonatomic, strong) ATTeacherDetailBottomCell *contentCell;
@property (nonatomic, strong) FSSegmentTitleView *titleView;
@property (nonatomic, assign) BOOL canScroll;

@end

@implementation ATTeacherDetailController
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    ATNavigationBar *navBar = [[ATNavigationBar alloc] initWithTitle:@"老师详情" leftName:nil rightName:nil delegate:self];
    
//    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, navBar.bottom, ATScreenWidth, ATScreenHeight - navBar.height)];
//    scrollView.showsVerticalScrollIndicator = NO;
//    scrollView.showsHorizontalScrollIndicator = NO;
    
//    [self.view addSubview:scrollView];
    
//    [scrollView addSubview:headerView];
//    scrollView.contentSize = CGSizeMake(ATScreenWidth, ATScreenHeight + headerView.height);
    

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeScrollStatus) name:@"leaveTop" object:nil];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setupSubViews];
    
}

- (void)setupSubViews
{
    self.canScroll = YES;
    self.tableView.backgroundColor = [UIColor whiteColor];
    __weak typeof(self) weakSelf = self;
    
    self.tableView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
         [weakSelf insertRowAtTop];
    }];
    [self.tableView.mj_header beginRefreshing];
}

- (void)insertRowAtTop
{
    NSArray *sortTitles = @[@"热门真题",@"热门专题",@"系统课"];
    self.contentCell.currentTagStr = sortTitles[self.titleView.selectIndex];
    self.contentCell.isRefresh = YES;
//    [self.tableView.pullToRefreshView stopAnimating];
    [self.tableView.mj_header endRefreshing];
}

#pragma mark notify
- (void)changeScrollStatus//改变主视图的状态
{
    self.canScroll = YES;
    self.contentCell.cellCanScroll = NO;
}

#pragma mark UITableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
        return 1;
 
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return CGRectGetHeight(self.view.bounds) - 64;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{

    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    self.titleView = [[FSSegmentTitleView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 50) titles:@[@"热门真题",@"热门专题",@"系统课"] delegate:self indicatorType:FSIndicatorTypeCustom];
    self.titleView.backgroundColor = [UIColor whiteColor];
    self.titleView.titleNormalColor = kColorTeacherCellGrayText;
    self.titleView.titleSelectColor = kColorTeacherCellSelectText;
    self.titleView.indicatorColor = RGB(45,180,255);
    self.titleView.indicatorExtension = 10;
    return self.titleView;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    _contentCell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!_contentCell) {
        _contentCell = [[ATTeacherDetailBottomCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        NSArray *titles = @[@"热门真题",@"热门专题",@"系统课"];
        NSMutableArray *contentVCs = [NSMutableArray array];
        for (NSString *title in titles) {
            ATDetailContentController *vc = [[ATDetailContentController alloc]init];
            vc.title = title;
            vc.str = title;
            [contentVCs addObject:vc];
        }
        _contentCell.viewControllers = contentVCs;
        _contentCell.pageContentView = [[FSPageContentView alloc]initWithFrame:CGRectMake(0, 0, ATScreenWidth, ATScreenHeight - 64) childVCs:contentVCs parentVC:self delegate:self];
        [_contentCell.contentView addSubview:_contentCell.pageContentView];
    }
    return _contentCell;
    
    
    return nil;
}

#pragma mark FSSegmentTitleViewDelegate
- (void)FSContenViewDidEndDecelerating:(FSPageContentView *)contentView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex
{
    self.titleView.selectIndex = endIndex;
    _tableView.scrollEnabled = YES;//此处其实是监测scrollview滚动，pageView滚动结束主tableview可以滑动，或者通过手势监听或者kvo，这里只是提供一种实现方式
}

- (void)FSSegmentTitleView:(FSSegmentTitleView *)titleView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex
{
    self.contentCell.pageContentView.contentViewCurrentIndex = endIndex;
}

- (void)FSContentViewDidScroll:(FSPageContentView *)contentView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex progress:(CGFloat)progress
{
    _tableView.scrollEnabled = NO;//pageView开始滚动主tableview禁止滑动
}

#pragma mark UIScrollView
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat bottomCellOffset = [_tableView rectForSection:0].origin.y;
    if (scrollView.contentOffset.y >= bottomCellOffset) {
        scrollView.contentOffset = CGPointMake(0, bottomCellOffset);
        if (self.canScroll) {
            self.canScroll = NO;
            self.contentCell.cellCanScroll = YES;
        }
    }else{
        if (!self.canScroll) {//子视图没到顶部
            scrollView.contentOffset = CGPointMake(0, bottomCellOffset);
        }
    }
    self.tableView.showsVerticalScrollIndicator = _canScroll?YES:NO;
}

#pragma mark LazyLoad
- (ATTeacherDetailTableView *)tableView
{
    if (!_tableView) {
        _tableView = [[ATTeacherDetailTableView alloc]initWithFrame:CGRectMake(0, NavBarHeight, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - NavBarHeight) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        //        _tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
        //        _tableView.bounces = NO;
       ATTeacherDetailHeaderView *headerView = [ATTeacherDetailHeaderView headerView];
        _tableView.tableHeaderView = headerView;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
