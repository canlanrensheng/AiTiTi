//
//  ATMineVIPSecondCell.m
//  AiTiTi
//
//  Created by 李云辉 on 2018/5/14.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATMineVIPSecondCell.h"
#import "ATMineVIPCell.h"

@interface ATMineVIPSecondCell()

@property(nonatomic,strong)UIButton * currentButton;
@property(nonatomic,strong)NSArray * selectArray;

@end

@implementation ATMineVIPSecondCell

-(NSArray *)selectArray{
    if (_selectArray == nil) {
        _selectArray = @[@"基础会员",@"全科VIP",@"单科VIP"];
    }
    return _selectArray;
}

-(void)setRechargeArray:(NSMutableArray *)rechargeArray{
    _rechargeArray = rechargeArray;
    self.rechargeLabel.text = rechargeArray[0];
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeSubViews];
    }
    return self;
}

-(void)makeSubViews{
    UILabel * label8 = [UILabel new];
    label8.text = @"套餐选择";
    label8.font = [UIFont systemFontOfSize:20];
    [self.contentView addSubview:label8];
    
    [label8 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [label8 autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20];
    
    UIView * tableViewSup = [UIView new];
    tableViewSup.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:tableViewSup];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.rowHeight = 90;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.bounces = NO;
    self.tableView.scrollEnabled = NO;
    self.tableView.scrollsToTop = NO;
    [self.contentView addSubview:self.tableView];
    
    [self.tableView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:label8 withOffset:10];
    [self.tableView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [self.tableView autoSetDimensionsToSize:CGSizeMake(ATScreenWidth, 90 * 3)];
    
    self.rechargeLabel = [UILabel new];
    self.rechargeLabel.font = kFONT17;
    self.rechargeLabel.textColor = [UIColor redColor];
    [self.contentView addSubview:self.rechargeLabel];
    
    [self.rechargeLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [self.rechargeLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.tableView withOffset:10];
    
    UILabel * label9 = [UILabel new];
    label9.text = @"支付：";
    label9.font = kFONT17;
    [self.contentView addSubview:label9];
    
    [label9 autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.rechargeLabel];
    [label9 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.tableView withOffset:10];
    
    UIButton * payButton = [UIButton buttonWithTitle:@"确认支付" titleColor:ATWhite font:kFONT15 target:self action:@selector(payAction)];
    payButton.backgroundColor = ATBlue;
    payButton.cornerRadius = 20;
    [self.contentView addSubview:payButton];
    
    [payButton autoSetDimension:ALDimensionHeight toSize:40];
    [payButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [payButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [payButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.rechargeLabel withOffset:20];
    [payButton autoPinEdgeToSuperviewEdge:ALEdgeBottom  withInset:10];
}

#pragma mark - tableViewDeleGate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ATMineVIPCell * cell = [tableView dequeueReusableCellWithIdentifier:@"vip"];
    if (cell == nil) {
        cell = [[ATMineVIPCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"vip"];
        __weak typeof(cell)weakCell = cell;
        cell.menberSelect = ^(NSString *moonStr) {
            if (moonStr) {
                NSArray * array = [moonStr componentsSeparatedByString:@"个"];
                self.rechargeLabel.text = [NSString stringWithFormat:@"¥%ld",[array[0] integerValue] * [self.rechargeArray[indexPath.row] integerValue]];
            }else{
                self.rechargeLabel.text = self.rechargeArray[indexPath.row];
            }
            [self moneyButtonAction:weakCell.moneyButton];
        };
        cell.moonSelect = ^(NSString *moonStr) {
            NSArray * array = [moonStr componentsSeparatedByString:@"个"];
            self.rechargeLabel.text = [NSString stringWithFormat:@"¥%ld",[array[0] integerValue] * [self.rechargeArray[indexPath.row] integerValue]];
            [self moneyButtonAction:weakCell.moneyButton];
        };
    }
    if (indexPath.row == 0) {
        cell.moneyButton.selected = YES;
        self.currentButton = cell.moneyButton;
    }
    cell.moneyButton.tag = 200 + indexPath.row;
    cell.momberLabel.text = self.selectArray[indexPath.row];
    cell.discountLabel.text = @"（无折扣）";
    cell.moneyLabel.text = [NSString stringWithFormat:@"¥%@",self.rechargeArray[indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - updateUI
-(void)updateRechagre:(NSString *)moonStr{
    
}

#pragma mark - Action
-(void)moneyButtonAction:(UIButton *)btn{
    NSLog(@"%ld",btn.tag);
    if (!btn.isSelected) {
        self.currentButton.selected = !self.currentButton.selected;
        btn.selected = !btn.selected;
        self.currentButton = btn;
    }
}
-(void)payAction{
    if (self.payBlock) {
        self.payBlock();
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
