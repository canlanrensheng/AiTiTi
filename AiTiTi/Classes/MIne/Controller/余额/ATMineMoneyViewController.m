//
//  ATMineMoneyViewController.m
//  AiTiTi
//
//  Created by 李云辉 on 2018/5/10.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATMineMoneyViewController.h"
#import "ATRechargeListViewController.h"

@interface ATMineMoneyViewController ()

@property(nonatomic,strong)UILabel * moneyLabel;
@property(nonatomic,strong)UIButton * currentButton;
@property(nonatomic,strong)UILabel * rechargeLabel;
@property(nonatomic,strong)NSArray * moneyArray;

@end

@implementation ATMineMoneyViewController

-(NSArray *)moneyArray{
    if (_moneyArray == nil) {
        _moneyArray = @[@"充值500元",@"充值300元",@"充值200元",@"充值100元"];
    }
    return _moneyArray;
}

#pragma mark - system
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"余额充值";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI
-(void)makeSubViews{
    UIButton* rechargeButton = [UIButton buttonWithTitle:@"充值记录" titleColor:ATGray font:kFONT14 target:self action:@selector(rechargeAction)];
    [rechargeButton sizeToFit];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rechargeButton];
    
    UIScrollView * scrollView = [UIScrollView new];
    scrollView.bounces = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:scrollView];
    
    [scrollView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 50, 0)];
    
    UIImageView * banner = [UIImageView new];
    banner.image = IMAGE(@"money_banner");
    banner.cornerRadius = 10;
    [scrollView addSubview:banner];
    
    [banner autoSetDimension:ALDimensionWidth toSize:ATScreenWidth - 40];
    [banner autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(10, 20, 10, 20) excludingEdge:ALEdgeBottom];
    
    self.moneyLabel = [UILabel new];
    self.moneyLabel.text = @"45";
    self.moneyLabel.font = [UIFont systemFontOfSize:35];
    self.moneyLabel.textColor = ATWhite;
    [banner addSubview:self.moneyLabel];
    
    [self.moneyLabel autoCenterInSuperview];
    
    UILabel * label1 = [UILabel new];
    label1.text = @"元";
    label1.textColor = ATWhite;
    label1.font = kFONT15;
    [banner addSubview:label1];
    
    [label1 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.moneyLabel withOffset:5];
    [label1 autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.moneyLabel withOffset:-5];
    
    UILabel * label2 = [UILabel new];
    label2.text = @"我的余额";
    label2.textColor = ATWhite;
    label2.font = kFONT14;
    [banner addSubview:label2];
    
    [label2 autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:self.moneyLabel withOffset:-5];
    [label2 autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    UILabel * label3 = [UILabel new];
    label3.text = @"请选择充值金额";
    label3.font = [UIFont systemFontOfSize:18];
    [scrollView addSubview:label3];
    
    [label3 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [label3 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:banner withOffset:20];
    
    UIView * rechargeView = [UIView new];
    [scrollView addSubview:rechargeView];
    
    [rechargeView autoSetDimensionsToSize:CGSizeMake(ATScreenWidth, 50 * self.moneyArray.count)];
    [rechargeView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:label3 withOffset:10];
    [rechargeView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    
    [self.moneyArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIView * moneyView = [[UIView alloc] initWithFrame:CGRectMake(0, 50 * idx, ATScreenWidth, 50)];
        [rechargeView addSubview:moneyView];
        
        UILabel * moneyLabel = [UILabel new];
        moneyLabel.text = obj;
        moneyLabel.font = kFONT13;
        [moneyView addSubview:moneyLabel];
        
        [moneyLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
        [moneyLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        UIButton * moneyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [moneyButton setBackgroundImage:IMAGE(@"select_off") forState:UIControlStateNormal];
        [moneyButton setBackgroundImage:IMAGE(@"select_on") forState:UIControlStateSelected];
        moneyButton.tag = 200 + idx;
        [moneyButton addTarget:self action:@selector(moneyButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [moneyView addSubview:moneyButton];
        
        if (idx == 0) {
            moneyButton.selected = YES;
            self.currentButton = moneyButton;
        }
        
        [moneyButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
        [moneyButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        UIView * line = [UIView new];
        line.backgroundColor = ATGray;
        [moneyView addSubview:line];
        
        [line autoSetDimension:ALDimensionHeight toSize:0.5];
        [line autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(10, 20, 0, 20) excludingEdge:ALEdgeTop];
    }];
    
    self.rechargeLabel = [UILabel new];
    self.rechargeLabel.text = @"500元";
    self.rechargeLabel.font = kFONT17;
    self.rechargeLabel.textColor = [UIColor redColor];
    [scrollView addSubview:self.rechargeLabel];
    
    [self.rechargeLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [self.rechargeLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:rechargeView withOffset:10];
    
    UILabel * label4 = [UILabel new];
    label4.text = @"支付：";
    label4.font = kFONT17;
    [scrollView addSubview:label4];
    
    [label4 autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.rechargeLabel];
    [label4 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:rechargeView withOffset:10];
    
    UIButton * payButton = [UIButton buttonWithTitle:@"确认充值" titleColor:ATWhite font:kFONT15 target:self action:@selector(payAction)];
    payButton.backgroundColor = ATBlue;
    payButton.cornerRadius = 20;
    [scrollView addSubview:payButton];
    
    [payButton autoSetDimension:ALDimensionHeight toSize:40];
    [payButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [payButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [payButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.rechargeLabel withOffset:20];
    
    UILabel * label5 = [UILabel new];
    label5.text = @"余额充值说明：";
    label5.font = [UIFont fontWithName:@"Helvetica-Bold" size:15];
    [scrollView addSubview:label5];
    
    [label5 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [label5 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:payButton withOffset:20];
    
    UILabel * label6 = [UILabel new];
    label6.text = @"余额可用于抵扣购买，不能体现。";
    label6.numberOfLines = 0;
    label6.font = kFONT13;
    [scrollView addSubview:label6];
    
    [label6 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [label6 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:label5 withOffset:10];
    
    UIView * questionView = [UIView new];
    [self.view addSubview:questionView];
    
    [questionView autoSetDimension:ALDimensionHeight toSize:50];
    [questionView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(10, 0, 0, 0) excludingEdge:ALEdgeTop];
    
    UIView * line = [UIView new];
    line.backgroundColor = ATGray;
    [questionView addSubview:line];
    
    [line autoSetDimension:ALDimensionHeight toSize:0.5];
    [line autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 20, 10, 20) excludingEdge:ALEdgeBottom];
    
    UIImageView * questionImg = [UIImageView new];
    questionImg.image = IMAGE(@"question");
    [questionView addSubview:questionImg];
    
    [questionImg autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [questionImg autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    UILabel * label7 = [UILabel new];
    label7.text = @"常见问题";
    label7.font = kFONT14;
    [questionView addSubview:label7];
    
    [label7 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:questionImg withOffset:5];
    [label7 autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    UIImageView * forwordImg = [UIImageView new];
    forwordImg.image = IMAGE(@"forword");
    [questionView addSubview:forwordImg];
    
    [forwordImg autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [forwordImg autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
}

#pragma mark - Action
-(void)moneyButtonAction:(UIButton *)btn{
    NSLog(@"%ld",btn.tag);
    if (!btn.isSelected) {
        self.currentButton.selected = !self.currentButton.selected;
        btn.selected = !btn.selected;
        self.currentButton = btn;
        
        self.rechargeLabel.text = [self.moneyArray[btn.tag - 200] substringFromIndex:2];
    }
}
-(void)payAction{
    NSLog(@"pay");
}
-(void)rechargeAction{
    ATRechargeListViewController * VC = [ATRechargeListViewController new];
    VC.title = @"充值记录";
    [self.navigationController pushViewController:VC animated:YES];
}

@end
