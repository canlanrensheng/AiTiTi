//
//  ATSystemClassDetailViewController.m
//  AiTiTi
//
//  Created by LA on 2018/6/6.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATSystemClassDetailViewController.h"
#import "ATTeacherDetailTableView.h"
#import "ATTeacherDetailBottomCell.h"
#import "ATSubjectDetailView.h"
#import "ATContentViewCell.h"
#import "ATBottomViewTool.h"
#import "ATSystemClassDirectoryViewController.h"
#import "ATSystemClassDescriptionViewController.h"
#import "ATSystemClassCommentController.h"

@interface ATSystemClassDetailViewController ()<ATNavigationBarDelegate,FSPageContentViewDelegate,FSSegmentTitleViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, assign) BOOL canScroll;
@property (nonatomic, strong) ATTeacherDetailTableView *tableViews;
@property (nonatomic, strong) ATContentViewCell *contentCell;
@property (nonatomic, strong) FSSegmentTitleView *titleView;
@end

@implementation ATSystemClassDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"系统详情";
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeScrollStatus) name:@"leaveTop" object:nil];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setupUI];
}



- (void)setupUI {
    self.canScroll = YES;
    __weak typeof(self) weakSelf = self;
    self.tableViews.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
        [weakSelf insertRowAtTop];
    }];
    [self.tableViews.mj_header beginRefreshing];
    
    ATBottomViewTool *toolView = [ATBottomViewTool setUpBottomViewTool];
    [toolView.startLearnBtn setBackgroundColor:RGB(251, 139, 38)];
    [self.view addSubview:toolView];
    [toolView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom);
        make.height.mas_offset(54);
        make.left.right.equalTo(self.view);    }];
}

- (void)insertRowAtTop {
    NSArray *sortTitles = @[@"课程介绍",@"目录",@"评价"];
    self.contentCell.currentTagStr = sortTitles[self.titleView.selectIndex];
    self.contentCell.isRefresh = YES;
    [self.tableViews.mj_header endRefreshing];
}

#pragma mark - notify
- (void)changeScrollStatus {
    self.canScroll = YES;
    self.contentCell.cellCanScroll = NO;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return CGRectGetHeight(self.view.bounds) - 64;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    self.titleView = [[FSSegmentTitleView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 50) titles:@[@"课程介绍",@"目录",@"评价"] delegate:self indicatorType:FSIndicatorTypeCustom];
    self.titleView.backgroundColor = [UIColor whiteColor];
    self.titleView.titleNormalColor = kColorTeacherCellGrayText;
    self.titleView.titleSelectColor = kColorTeacherCellSelectText;
    self.titleView.indicatorColor = RGB(45,180,255);
    self.titleView.indicatorExtension = 10;
    return self.titleView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    _contentCell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!_contentCell) {
        _contentCell = [[ATContentViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        //        NSArray *titles = @[@"课程介绍",@"目录",@"评价"];
        //        NSMutableArray *contentVCs = [NSMutableArray array];
        //        for (NSString *title in titles) {
        //            ATSubjectDetailContentController *vc = [[ATSubjectDetailContentController alloc] init];
        //            vc.title = title;
        //            vc.str = title;
        //            [contentVCs addObject:vc];
        //        }
        ATSystemClassDescriptionViewController *descriptionVC = [[ATSystemClassDescriptionViewController alloc] init];
        descriptionVC.title = @"课程介绍";
        ATSystemClassDirectoryViewController *directoryVC = [[ATSystemClassDirectoryViewController alloc] init];
        directoryVC.title = @"目录";
        ATSystemClassCommentController *commentVC = [[ATSystemClassCommentController alloc] init];
        commentVC.title = @"评价";
        NSArray *contentVCs =  @[descriptionVC,directoryVC,commentVC].mutableCopy;
        _contentCell.viewControllers = [NSMutableArray arrayWithArray:contentVCs];
        _contentCell.pageContentView = [[FSPageContentView alloc] initWithFrame:CGRectMake(0, 0, ATScreenWidth, ATScreenHeight - 64) childVCs:contentVCs parentVC:self delegate:self];
        [_contentCell.contentView addSubview:_contentCell.pageContentView];
    }
    return _contentCell;
}

#pragma mark - lazy
- (ATTeacherDetailTableView *)tableViews {
    if (!_tableViews) {
        _tableViews = [[ATTeacherDetailTableView alloc] initWithFrame:CGRectMake(0, NavBarHeight, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - NavBarHeight) style:UITableViewStylePlain];
        _tableViews.delegate = self;
        _tableViews.dataSource = self;
        _tableViews.backgroundColor = [UIColor whiteColor];
        ATSubjectDetailView *headerView = [ATSubjectDetailView subjectDetailHeaderView];
        _tableViews.tableHeaderView = headerView;
        [self.view addSubview:_tableViews];
    }
    return _tableViews;
}

#pragma mark - FSSegmentTitleViewDelegate
- (void)FSContenViewDidEndDecelerating:(FSPageContentView *)contentView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex {
    self.titleView.selectIndex = endIndex;
    _tableViews.scrollEnabled = YES;// 此处其实是监测scrollview滚动，pageView滚动结束主tableview可以滑动，或者通过手势监听或者kvo，这里只是提供一种实现方式
}

- (void)FSSegmentTitleView:(FSSegmentTitleView *)titleView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex {
    self.contentCell.pageContentView.contentViewCurrentIndex = endIndex;
}

- (void)FSContentViewDidScroll:(FSPageContentView *)contentView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex progress:(CGFloat)progress {
    _tableViews.scrollEnabled = NO; //pageView开始滚动主tableview禁止滑动
}

#pragma mark - UIScrollView
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat bottomCellOffSet = [_tableViews rectForSection:0].origin.y;
    if (scrollView.contentOffset.y >= bottomCellOffSet) {
        scrollView.contentOffset = CGPointMake(0, bottomCellOffSet);
        if (self.canScroll) {
            self.canScroll = NO;
            self.contentCell.cellCanScroll = YES;
        }
    }else {
        if (!self.canScroll) {// 子视图没到顶部
            scrollView.contentOffset = CGPointMake(0, bottomCellOffSet);
        }
    }
    self.tableViews.showsVerticalScrollIndicator = _canScroll ? YES : NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
