//
//  ATLASubjectViewController.m
//  AiTiTi
//
//  Created by LA on 2018/6/3.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATLASubjectViewController.h"
#import "JPullDownMenu.h"
#import "ATSubjectModels.h"
#import "ATSubjectViewModel.h"
#import "ATSubjectMainCell.h"
#import "ATExamPaperListCell.h"
#import "ATSubjectSectionHeader.h"
#import "ATSubjectDetailController.h"

#define kSubjectHeaderHeight 50

@interface ATLASubjectViewController ()
@property (nonatomic, strong) JPullDownMenu *menu;
@property (nonatomic, strong) ATSubjectViewModel *viewModel;

@end

@implementation ATLASubjectViewController

- (void)viewDidLoad {
    self.tableViewStyle = UITableViewStyleGrouped;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"专题";
}

- (void)tx_configSubViews {
    for (int i = 0; i < 10; i++) {
        ATSubjectModels *model = [[ATSubjectModels alloc] init];
        [self.viewModel.dataArray addObject:model];
        [self.tableView reloadData];
    }
    [self setUpMenuView];
    self.tableViewRowHeight = 55;
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ATSubjectMainCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([ATSubjectMainCell class])];
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(kSubjectHeaderHeight, 0, 0, 0));
    }];
    
}

- (void)setUpMenuView {
    self.menu = [[JPullDownMenu alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, kSubjectHeaderHeight) menuTitleArray:@[@"工作岗位",@"薪资",@"工作经验"]];
    NSArray *regionArray = @[
                             @{@"title":@"工作岗位",@"image":@""},
                             @{@"title":@"iOS开发",@"image":@""},
                             @{@"title":@"java开发",@"image":@"VIP1"},
                             @{@"title":@"H5开发",@"image":@"VIP2"}
                             ];
    NSArray *classTypeArray=@[
                              @{@"title":@"高一",@"image":@""},
                              @{@"title":@"语文",@"image":@""},
                              @{@"title":@"大题",@"image":@"VIP1"},
                              @{@"title":@"精品课程",@"image":@"VIP2"}
                              ];
    NSArray *expericeArray = @[@{@"title":@"工作经验",@"image":@""},
                               @{@"title":@"2年",@"image":@""},
                               @{@"title":@"5年",@"image":@"VIP1"},
                               @{@"title":@"7年",@"image":@"VIP2"}
                               ];
    self.menu.menuDataArray = [NSMutableArray arrayWithObjects:regionArray,classTypeArray,expericeArray, nil];
    [self.view addSubview:self.menu];
    
//    @weakify(self);
    [self.menu setHandleSelectDataBlock:^(NSString *selectTitle, NSUInteger selectIndex, NSUInteger selectButtonTag) {
        
    }];
}

- (void)tx_loadData {
    //    if(self.viewModel.dataArray.count > 0){
    //        [self.tableView.mj_footer resetNoMoreData];
    //    }
    //
    //    [self.viewModel.loadDataCommand execute:nil];
    //    self.tableView.mj_footer.hidden = YES;
}

- (void)tx_bindViewModel{
    //    @weakify(self);
    //    [self.viewModel.loadDataCommand.executionSignals.switchToLatest subscribeNext:^(id x) {
    //        @strongify(self);
    //
    //        [self.tableView reloadData];
    //    }];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.viewModel.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.viewModel.dataArray.count > 0) {
        ATSubjectModels *model = self.viewModel.dataArray[section];
        if (model.isShow) {
            return 3;
        }
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ATSubjectMainCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ATSubjectMainCell class])];
    self.tableView.separatorColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //    [cell setViewModel:self.viewModel indexPath:indexPath];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 180;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ATSubjectDetailController *detailVC = [[ATSubjectDetailController alloc] init];
    [self.navigationController pushViewController:detailVC animated:YES];
}




- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    ATSubjectSectionHeader *sectionHeader = [ATSubjectSectionHeader subjectSectionHeaderWithModel];
    sectionHeader.userInteractionEnabled = YES;
    sectionHeader.tag = 100 + section;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    ATSubjectModels *model = self.viewModel.dataArray[section];
    @weakify(self);
    [[tap rac_gestureSignal] subscribeNext:^(id x) {
        @strongify(self);
        model.isShow = !model.isShow;
        [sectionHeader changeArrowDirection];
        NSIndexSet *indexSet = [[NSIndexSet alloc] initWithIndex:section];
        [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
    [sectionHeader addGestureRecognizer:tap];
    return sectionHeader;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 64;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0001f;
}

- (ATSubjectViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[ATSubjectViewModel alloc] init];
    }
    return _viewModel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


