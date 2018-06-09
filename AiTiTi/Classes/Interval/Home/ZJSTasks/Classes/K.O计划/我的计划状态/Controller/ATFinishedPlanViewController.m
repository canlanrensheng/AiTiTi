//
//  ATFinishedPlanViewController.m
//  AiTiTi
//
//  Created by Oma-002 on 2018/6/1.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATFinishedPlanViewController.h"
#import "ATPlanHeaderView.h"
#import "ATFinishedPlanStateCell.h"

//#define kSubjectHeaderHeight 50
@interface ATFinishedPlanViewController ()

@property (nonatomic,strong) ATPlanHeaderView *headerView;


@end

@implementation ATFinishedPlanViewController

- (void)viewDidLoad {
    self.tableViewStyle = UITableViewStyleGrouped;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)tx_configSubViews{
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    UIView *headerV = [[UIView alloc] initWithFrame:CGRectMake(0, 20, Screen_Width, 40)];
    self.headerView = [[[NSBundle mainBundle] loadNibNamed:@"ATPlanHeaderView" owner:self options:nil] lastObject];
    self.headerView.frame = CGRectMake(0, 0, Screen_Width, 40);
    [headerV addSubview:self.headerView];
    self.tableView.tableHeaderView = headerV;
    
    [self.tableView registerNibCell:[ATFinishedPlanStateCell class]];
    
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0,10, 0));
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
    return 290;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //    return self.viewModel.dataArray.count;
    
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ATFinishedPlanStateCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ATFinishedPlanStateCell" forIndexPath:indexPath];
    self.tableView.separatorColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //    [cell setViewModel:self.viewModel indexPath:indexPath];
    if(indexPath.row == 0){
        cell.headerBackView.backgroundColor = RGBA(23,207,151,0.1);
        cell.classNameLabel.backgroundColor = RGB(23, 207, 151);
        cell.koImageView.image = IMAGE(@"已KO_绿");
    }else{
        cell.headerBackView.backgroundColor = RGBA(131,109,249,0.1);
        cell.classNameLabel.backgroundColor = RGB(131,109,249);
        cell.koImageView.image = IMAGE(@"已KO_紫");
    }
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


@end


