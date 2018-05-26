//
//  ATSignViewController.m
//  AiTiTi
//
//  Created by 张金山 on 2018/5/26.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATSignViewController.h"

#import "ATSignViewModel.h"
#import "ATSignStatisticsCell.h"
#import "ATSignCalendarCell.h"
#import "ATSignScheduleViewCell.h"
#import "ATSignRuleViewCell.h"

@interface ATSignViewController ()

@property (nonatomic,strong) ATSignViewModel *viewModel;

@end

@implementation ATSignViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)tx_configSubViews{
    self.navigationItem.title = @"签到";
    self.numberOfSections = 1;
    self.tableViewRowHeight = 55;
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ATSignStatisticsCell" bundle:nil] forCellReuseIdentifier:@"ATSignStatisticsCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"ATSignCalendarCell" bundle:nil] forCellReuseIdentifier:@"ATSignCalendarCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"ATSignScheduleViewCell" bundle:nil] forCellReuseIdentifier:@"ATSignScheduleViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"ATSignRuleViewCell" bundle:nil] forCellReuseIdentifier:@"ATSignRuleViewCell"];
    
    
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

- (void)tx_loadData{
    if(self.viewModel.dataArray.count > 0){
        [self.tableView.mj_footer resetNoMoreData];
    }
    
    [self.viewModel.loadDataCommand execute:nil];
    self.tableView.mj_footer.hidden = YES;
}


- (void)tx_bindViewModel{
    @weakify(self);
    [self.viewModel.loadDataCommand.executionSignals.switchToLatest subscribeNext:^(id x) {
        @strongify(self);
        
        [self.tableView reloadData];
    }];

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 0){
        return 112;
    }
    if(indexPath.row == 1){
        return 388;
    }
    if(indexPath.row == 2){
        CGFloat imgHeight = (Screen_Width - 30 - (4 - 1) * 10) / 4;
        return 84 + imgHeight + 8 + 17;
    }
    return 247;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 0){
        ATSignStatisticsCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ATSignStatisticsCell"];
        self.tableView.separatorColor = RGBCOLOR(225, 225, 225);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        //    [cell setViewModel:self.viewModel indexPath:indexPath];
        return cell;
    }
    if(indexPath.row == 1){
        ATSignCalendarCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ATSignCalendarCell"];
        self.tableView.separatorColor = RGBCOLOR(225, 225, 225);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        //    [cell setViewModel:self.viewModel indexPath:indexPath];
        return cell;
    }
    if(indexPath.row == 2){
        ATSignScheduleViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ATSignScheduleViewCell"];
        self.tableView.separatorColor = RGBCOLOR(225, 225, 225);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        //    [cell setViewModel:self.viewModel indexPath:indexPath];
        return cell;
    }
    ATSignRuleViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ATSignRuleViewCell"];
    self.tableView.separatorColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //    [cell setViewModel:self.viewModel indexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (ATSignViewModel *)viewModel{
    if(!_viewModel){
        _viewModel = [[ATSignViewModel alloc] init];
    }
    return _viewModel;
}

@end

