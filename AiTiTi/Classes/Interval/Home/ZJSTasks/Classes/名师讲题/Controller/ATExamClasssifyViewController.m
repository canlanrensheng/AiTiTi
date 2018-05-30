//
//  ATExamClasssifyViewController.m
//  AiTiTi
//
//  Created by 张金山 on 2018/5/28.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATExamClasssifyViewController.h"
#import "ATExamClasssifySectionView.h"
#import "ATExamClasssifyViewModel.h"
#import "ATExamClasssifyListCell.h"
#import "ATExamClasssifyListModel.h"
#import "JPullDownMenu.h"
#import "ATTestAnalysisViewController.h"
#define kSubjectHeaderHeight 50
@interface ATExamClasssifyViewController ()

@property (nonatomic,strong) ATExamClasssifyViewModel *viewModel;
@property (nonatomic) JPullDownMenu *menu;

@end

@implementation ATExamClasssifyViewController

- (void)viewDidLoad {
    self.tableViewStyle = UITableViewStyleGrouped;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)tx_configSubViews{
    
    for(int i = 0; i < 10;i++){
        ATExamClasssifyListModel *model = [[ATExamClasssifyListModel alloc] init];
        [self.viewModel.dataArray addObject:model];
        [self.tableView reloadData];
    }
    
//    self.numberOfSections = 10;
    self.tableViewRowHeight = 55;
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self setUpMenuView];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ATExamClasssifyListCell" bundle:nil] forCellReuseIdentifier:@"ATExamClasssifyListCell"];
    
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(kSubjectHeaderHeight, 0, 0, 0));
    }];
}

- (void)setUpMenuView{
    self.menu = [[JPullDownMenu alloc]initWithFrame:CGRectMake(0, 0,self.view.frame.size.width, kSubjectHeaderHeight) menuTitleArray:@[@"数学",@"高一",@"精选"]];
    
    NSArray * regionArray =@[@{@"title":@"数学",@"image":@""},@{@"title":@"语文",@"image":@""},@{@"title":@"大题",@"image":@"VIP1"},@{@"title":@"精品课程",@"image":@"VIP2"}];
    NSArray *classTypeArray=@[@{@"title":@"高一",@"image":@""},@{@"title":@"语文",@"image":@""},@{@"title":@"大题",@"image":@"VIP1"},@{@"title":@"精品课程",@"image":@"VIP2"}];
    NSArray *sortRuleArray=@[@{@"title":@"精选",@"image":@""},@{@"title":@"语文",@"image":@""},@{@"title":@"大题",@"image":@"VIP1"},@{@"title":@"精品课程",@"image":@"VIP2"}];
    
    
    self.menu.menuDataArray = [NSMutableArray arrayWithObjects:regionArray, classTypeArray , sortRuleArray,  nil];
    
    [self.view addSubview:self.menu];
    
    __weak typeof(self) _self = self;
    [self.menu setHandleSelectDataBlock:^(NSString *selectTitle, NSUInteger selectIndex, NSUInteger selectButtonTag) {
        
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
    return 44;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.viewModel.dataArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(self.viewModel.dataArray.count > 0){
        ATExamClasssifyListModel *model = self.viewModel.dataArray[section];
        if(model.isShow){
            return 3;
        }
    }
    return 0;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ATExamClasssifyListCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ATExamClasssifyListCell"];
    self.tableView.separatorColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //    [cell setViewModel:self.viewModel indexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ATTestAnalysisViewController *attestAnalysisVC = [[ATTestAnalysisViewController alloc] init];
    [self.navigationController pushViewController:attestAnalysisVC animated:YES];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    static NSString * identy = @"ATExamClasssifySectionView";
    ATExamClasssifySectionView *sectionHeaderView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identy];
    if (!sectionHeaderView) {
        sectionHeaderView = [[[NSBundle mainBundle] loadNibNamed:@"ATExamClasssifySectionView" owner:self options:nil] lastObject];
        sectionHeaderView.backgroundColor = [UIColor whiteColor];
    }
    ATExamClasssifyListModel *model = self.viewModel.dataArray[section];
    @weakify(self);
    [sectionHeaderView.openButtonSubject subscribeNext:^(id x) {
        @strongify(self);
        model.isShow = !model.isShow;
        NSIndexSet *indexSet = [[NSIndexSet alloc] initWithIndex:section];
        [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
    return sectionHeaderView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 64;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0001f;
}

- (ATExamClasssifyViewModel *)viewModel{
    if(!_viewModel){
        _viewModel = [[ATExamClasssifyViewModel alloc] init];
    }
    return _viewModel;
}

@end


