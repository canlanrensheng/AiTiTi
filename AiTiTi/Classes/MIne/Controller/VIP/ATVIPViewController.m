//
//  ATVIPViewController.m
//  AiTiTi
//
//  Created by 李云辉 on 2018/5/13.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATVIPViewController.h"
#import "ATRechargeListViewController.h"
#import "ATMineVIPHeaderCell.h"
#import "ATMineVIPSecondCell.h"
#import "ATMineVIPThirdCell.h"
#import "ATMineVIPFourthCell.h"

#import "ATOrderViewController.h"

@interface ATVIPViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray * rechargeArray;
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,assign)NSInteger moonNum;

@end

@implementation ATVIPViewController

#pragma mark - system
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"VIP";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI
-(void)makeSubViews{
    self.rechargeArray = [NSMutableArray arrayWithArray:@[@"99",@"99",@"199"]];
    
    UIButton* rechargeButton = [UIButton buttonWithTitle:@"充值记录" titleColor:ATGray font:kFONT14 target:self action:@selector(VIPListAction)];
    [rechargeButton sizeToFit];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rechargeButton];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.bounces = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
    [self.tableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        static NSString *rid=@"vipHeader";
        ATMineVIPHeaderCell *cell=[tableView dequeueReusableCellWithIdentifier:rid];
        if(cell==nil){
            cell=[[ATMineVIPHeaderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.row == 1){
        static NSString *rid = @"vipSecond";
        ATMineVIPSecondCell *cell=[tableView dequeueReusableCellWithIdentifier:rid];
        if(cell==nil){
            cell=[[ATMineVIPSecondCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
            cell.payBlock = ^{
                ATOrderViewController * VC = [ATOrderViewController new];
                [self.navigationController pushViewController:VC animated:YES];
            };
        }
        cell.rechargeArray = self.rechargeArray;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.row == 2){
        static NSString *rid = @"vipThird";
        ATMineVIPThirdCell *cell=[tableView dequeueReusableCellWithIdentifier:rid];
        if(cell==nil){
            cell=[[ATMineVIPThirdCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        static NSString *rid=@"vipFourth";
        ATMineVIPFourthCell *cell=[tableView dequeueReusableCellWithIdentifier:rid];
        if(cell==nil){
            cell=[[ATMineVIPFourthCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
        }
        return cell;
    }
}


#pragma mark - Action
-(void)VIPListAction{
    ATRechargeListViewController * VC = [ATRechargeListViewController new];
    VC.title = @"购买记录";
    [self.navigationController pushViewController:VC animated:YES];
}

@end
