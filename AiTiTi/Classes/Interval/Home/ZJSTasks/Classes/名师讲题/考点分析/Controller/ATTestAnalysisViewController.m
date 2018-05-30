//
//  ATExamClasssifyViewController.m
//  AiTiTi
//
//  Created by 张金山 on 2018/5/28.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATTestAnalysisViewController.h"

#import "ATTestAnalysisViewModel.h"
#import "ATTestAnalysisCell.h"
#import "ATTestFrequencyCell.h"
#import "ATTestDirrectionCell.h"
#import "ATDifficultyDistributionCell.h"

static NSString *ATTestAnalysisCellID = @"ATTestAnalysisCell";
static NSString *ATTestFrequencyCellID = @"ATTestFrequencyCell";
static NSString *ATTestDirrectionCellID = @"ATTestDirrectionCell";
static NSString *ATDifficultyDistributionCellID = @"ATDifficultyDistributionCell";

@interface ATTestAnalysisViewController ()

@property (nonatomic,strong) ATTestAnalysisViewModel *viewModel;
@property (nonatomic,strong) UIView *footerView;


@end

@implementation ATTestAnalysisViewController

- (void)viewDidLoad {
    self.tableViewStyle = UITableViewStyleGrouped;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)tx_configSubViews{
    self.title = @"考点分析";
    self.numberOfRows = 4;

    self.tableView.backgroundColor = [UIColor whiteColor];
   
    
    self.tableView.tableFooterView = self.footerView;
    
    [self.tableView registerNib:[UINib nibWithNibName:ATTestAnalysisCellID bundle:nil] forCellReuseIdentifier:ATTestAnalysisCellID];
    [self.tableView registerNib:[UINib nibWithNibName:ATTestFrequencyCellID bundle:nil] forCellReuseIdentifier:ATTestFrequencyCellID];
    [self.tableView registerNib:[UINib nibWithNibName:ATTestDirrectionCellID bundle:nil] forCellReuseIdentifier:ATTestDirrectionCellID];
    [self.tableView registerNib:[UINib nibWithNibName:ATDifficultyDistributionCellID bundle:nil] forCellReuseIdentifier:ATDifficultyDistributionCellID];
    
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
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
    if(indexPath.row == 0){
        return 130;
    }
    if(indexPath.row == 1){
        return 225 + 23;
    }
    if(indexPath.row == 2){
        return 20 + 23 + 30 * 6 + 18 + 8;
    }
    return 140;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 0){
        ATTestAnalysisCell * cell = [tableView dequeueReusableCellWithIdentifier:ATTestAnalysisCellID];
        self.tableView.separatorColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        //    [cell setViewModel:self.viewModel indexPath:indexPath];
        return cell;
    }
    if(indexPath.row == 1){
        ATTestFrequencyCell * cell = [tableView dequeueReusableCellWithIdentifier:ATTestFrequencyCellID];
        self.tableView.separatorColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        //    [cell setViewModel:self.viewModel indexPath:indexPath];
        return cell;
    }
    if (indexPath.row == 2){
        ATTestDirrectionCell * cell = [tableView dequeueReusableCellWithIdentifier:ATTestDirrectionCellID];
        self.tableView.separatorColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        //    [cell setViewModel:self.viewModel indexPath:indexPath];
        return cell;
    }
    ATDifficultyDistributionCell * cell = [tableView dequeueReusableCellWithIdentifier:ATDifficultyDistributionCellID];
    self.tableView.separatorColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //    [cell setViewModel:self.viewModel indexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (ATTestAnalysisViewModel *)viewModel{
    if(!_viewModel){
        _viewModel = [[ATTestAnalysisViewModel alloc] init];
    }
    return _viewModel;
}


//设置footerview
- (UIView *)footerView{
    if(!_footerView){
        _footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 100)];
        UIButton *sureBtn= [UIButton buttonItemWithFrame:CGRectMake(63, 23, Screen_Width - 126, 40) title:@"开始学习" titleColor:[UIColor whiteColor] backGroundColor:DEFAULTCOLOR Font:[UIFont systemFontOfSize:15] cornerRadius:20.0f borderColor:nil borderWidth:0 target:self action:@selector(sureBtnClick)];
        [_footerView addSubview:sureBtn];
    }
    return _footerView;
}

- (void)sureBtnClick{
    
}

@end


