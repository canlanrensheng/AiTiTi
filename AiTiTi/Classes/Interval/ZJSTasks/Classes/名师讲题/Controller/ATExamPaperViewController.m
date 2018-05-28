//
//  ATExamPaperViewController.m
//  AiTiTi
//
//  Created by 张金山 on 2018/5/28.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATExamPaperViewController.h"
#import "ATExamPaperSectionView.h"
#import "ATExamPaperViewModel.h"
#import "ATExamPaperListCell.h"
#import "ATExamPaperModel.h"
#import "CFDropDownMenuView.h"
#define kSubjectHeaderHeight 47
@interface ATExamPaperViewController ()<CFDropDownMenuViewDelegate>

@property (nonatomic,strong) ATExamPaperViewModel *viewModel;
@property (nonatomic, strong) CFDropDownMenuView *dropDownMenuView;

@end

@implementation ATExamPaperViewController

- (void)viewDidLoad {
    self.tableViewStyle = UITableViewStyleGrouped;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)tx_configSubViews{
    for(int i = 0; i < 10;i++){
        ATExamPaperModel *model = [[ATExamPaperModel alloc] init];
        [self.viewModel.dataArray addObject:model];
        [self.tableView reloadData];
    }
    self.tableViewRowHeight = 55;
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.dropDownMenuView];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ATExamPaperListCell" bundle:nil] forCellReuseIdentifier:@"ATExamPaperListCell"];
    
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(kSubjectHeaderHeight, 0, 0, 0));
    }];
}

- (void)tx_loadData{
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 64;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.viewModel.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ATExamPaperListCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ATExamPaperListCell"];
    self.tableView.separatorColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //    [cell setViewModel:self.viewModel indexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
    
//    static NSString * identy = @"ATExamPaperSectionView";
//    ATExamPaperSectionView *sectionHeaderView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identy];
//    if (!sectionHeaderView) {
//        sectionHeaderView = [[[NSBundle mainBundle] loadNibNamed:@"ATExamPaperSectionView" owner:self options:nil] lastObject];
//        sectionHeaderView.backgroundColor = [UIColor whiteColor];
//    }
//    ATExamPaperModel *model = self.viewModel.dataArray[section];
//    @weakify(self);
//    [sectionHeaderView.openButtonSubject subscribeNext:^(id x) {
//        @strongify(self);
//        model.isShow = !model.isShow;
//        NSIndexSet *indexSet = [[NSIndexSet alloc] initWithIndex:section];
//        [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
//    }];
//    return sectionHeaderView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.0001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0001f;
}

- (ATExamPaperViewModel *)viewModel{
    if(!_viewModel){
        _viewModel = [[ATExamPaperViewModel alloc] init];
    }
    return _viewModel;
}

- (CFDropDownMenuView *)dropDownMenuView{
    // DEMO
    _dropDownMenuView = [[CFDropDownMenuView alloc] initWithFrame:CGRectMake(0, 0, ATScreenWidth, kSubjectHeaderHeight)];
    // 注:  需先 赋值数据源dataSourceArr二维数组  再赋值defaulTitleArray一维数组
    _dropDownMenuView.dataSourceArr = @[
                                        @[@"选择题", @"填空题", @"大题", @"精品推荐", @"重点推荐"],
                                        @[@"高一", @"高二", @"高三"],
                                        @[@"1年以内", @"1-3年", @"3-5年", @"5年以上"]
                                        ].mutableCopy;
    
    _dropDownMenuView.defaulTitleArray = [NSArray arrayWithObjects:@"数学",@"年份", @"地区", nil];
    
    _dropDownMenuView.delegate = self;
    
    // 下拉列表 起始y
    _dropDownMenuView.startY = CGRectGetMaxY(_dropDownMenuView.frame);
    
    /**
     *  回调方式一: block
     */
    //    __weak typeof(self) weakSelf = self;
    _dropDownMenuView.chooseConditionBlock = ^(NSString *currentTitle, NSArray *currentTitleArray){
        
    };
    return _dropDownMenuView;
    
}

@end


