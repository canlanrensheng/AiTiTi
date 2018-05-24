//
//  ATDetailContentController.m
//  AiTiTi
//
//  Created by 童城 on 2018/5/13.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATDetailContentController.h"
#import "ATTeacherDetailCell.h"

#define RandomData [NSString stringWithFormat:@"随机数据---%d", arc4random_uniform(1000000)]

@interface ATDetailContentController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, assign) BOOL fingerIsTouch;
/** 用来显示的假数据 */
@property (strong, nonatomic) NSMutableArray *data;
@end

static NSString *cellID = @"ATTeacherDetailCell";
@implementation ATDetailContentController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"---%@",self.title);
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [ATDetailContentController randomColor];
    [self setupSubViews];
}

- (void)setupSubViews
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //    _tableView.bounces = NO;
    [self.view addSubview:_tableView];
    __weak typeof(self) weakSelf = self;
//    [self.tableView addInfiniteScrollingWithActionHandler:^{
//
//    }];
    [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ATTeacherDetailCell class]) bundle:nil] forCellReuseIdentifier:cellID];
    self.tableView.mj_footer = [MJRefreshFooter footerWithRefreshingBlock:^{
         [weakSelf insertRowAtBottom];
    }];
}

- (void)insertRowAtTop
{
    for (int i = 0; i<5; i++) {
        [self.data insertObject:RandomData atIndex:0];
    }
    __weak UITableView *tableView = self.tableView;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [tableView reloadData];
    });
}

- (void)insertRowAtBottom
{
    for (int i = 0; i<5; i++) {
        [self.data addObject:RandomData];
    }
    __weak UITableView *tableView = self.tableView;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [tableView reloadData];
//        [tableView.infiniteScrollingView stopAnimating];
        [tableView.mj_footer endRefreshing];
    });
}

#pragma mark Setter
- (void)setIsRefresh:(BOOL)isRefresh
{
    _isRefresh = isRefresh;
    [self insertRowAtTop];
}

#pragma mark UITableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 85;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ATTeacherDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];

//    cell.textLabel.text = [NSString stringWithFormat:@"%@--%@",self.title,self.data[indexPath.row]];
    return cell;
}

#pragma mark UIScrollView
//判断屏幕触碰状态
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    ATLog(@"接触屏幕");
    self.fingerIsTouch = YES;
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    ATLog(@"离开屏幕");
    self.fingerIsTouch = NO;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (!self.vcCanScroll) {
        scrollView.contentOffset = CGPointZero;
    }
    if (scrollView.contentOffset.y <= 0) {
        //        if (!self.fingerIsTouch) {//这里的作用是在手指离开屏幕后也不让显示主视图，具体可以自己看看效果
        //            return;
        //        }
        self.vcCanScroll = NO;
        scrollView.contentOffset = CGPointZero;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"leaveTop" object:nil];//到顶通知父视图改变状态
    }
    self.tableView.showsVerticalScrollIndicator = _vcCanScroll?YES:NO;
}

#pragma mark LazyLoad

+ (UIColor*) randomColor{
    NSInteger r = arc4random() % 255;
    NSInteger g = arc4random() % 255;
    NSInteger b = arc4random() % 255;
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1];
}

- (NSMutableArray *)data
{
    if (!_data) {
        self.data = [NSMutableArray array];
        for (int i = 0; i<20; i++) {
            [self.data addObject:RandomData];
        }
    }
    return _data;
}


@end
