//
//  ATMinCouponViewController.m
//  AiTiTi
//
//  Created by 李云辉 on 2018/5/17.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATMinCouponViewController.h"
#import "ATCouponCell.h"

@interface ATMinCouponViewController ()<UITableViewDelegate,UITableViewDataSource,CAAnimationDelegate>

@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)UIImageView * drawBg;
@property(nonatomic,strong)NSArray * bottomArray;

@end

@implementation ATMinCouponViewController

-(NSArray *)bottomArray{
    if (_bottomArray == nil) {
        _bottomArray = @[@"draw_music",@"draw_share",@"draw_tip",@"draw_comment"];
    }
    return _bottomArray;
}

#pragma mark - system
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RGB(244, 244, 244);
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI
-(void)makeSubViews{
    UIView * topView = [UIView new];
    [self.view addSubview:topView];
    
    [topView autoSetDimension:ALDimensionHeight toSize:40];
    [topView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(statusbarH, 0, 0, 0) excludingEdge:ALEdgeBottom];
    
    UIButton * backButton = [UIButton buttonWithTitle:@"" titleColor:[UIColor whiteColor] font:kFONT13 target:self action:@selector(backAction) backImageName:@"return"];
    [topView addSubview:backButton];
    
    [backButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [backButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    UIView * titleView = [UIView new];
    titleView.borderColor = [UIColor grayColor];
    titleView.borderWidth = 0.5;
    titleView.cornerRadius = 15;
    [topView addSubview:titleView];
    
    [titleView autoSetDimensionsToSize:CGSizeMake(200, 30)];
    [titleView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:5];
    [titleView autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    UIButton * titleButton1 = [UIButton buttonWithTitle:@"优惠券" titleColor:ATWhite font:kFONT13 target:self action:@selector(titleButtonAction:)];
    [titleButton1 setBackgroundImage:[UIImage createImageWithColor:RGB(88, 179, 249)] forState:UIControlStateSelected];
    [titleButton1 setBackgroundImage:[UIImage createImageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [titleButton1 setTitleColor:ATWhite forState:UIControlStateSelected];
    [titleButton1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    titleButton1.tag = 100 + 1;
    titleButton1.clipsToBounds = YES;
    [titleButton1 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside | UIControlEventAllTouchEvents];
    [titleView addSubview:titleButton1];
    
    [titleButton1 autoSetDimensionsToSize:CGSizeMake(100, 30)];
    [titleButton1 autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
    [titleButton1 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    
    UIButton * titleButton2 = [UIButton buttonWithTitle:@"抽奖" titleColor:ATWhite font:kFONT13 target:self action:@selector(titleButtonAction:)];
    [titleButton2 setBackgroundImage:[UIImage createImageWithColor:RGB(88, 179, 249)] forState:UIControlStateSelected];
    [titleButton2 setBackgroundImage:[UIImage createImageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [titleButton2 setTitleColor:ATWhite forState:UIControlStateSelected];
    [titleButton2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    titleButton2.tag = 100 + 2;
    titleButton2.clipsToBounds = YES;
    [titleButton2 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside | UIControlEventAllTouchEvents];
    [titleView addSubview:titleButton2];
    
    [titleButton2 autoSetDimensionsToSize:CGSizeMake(100, 30)];
    [titleButton2 autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
    [titleButton2 autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    
    titleButton1.selected = YES;
    
    UIButton * shareButton = [UIButton buttonWithTitle:@"使用说明" titleColor:ATGray font:kFONT12 target:self action:@selector(backAction)];
    shareButton.tag = 233;
    [topView addSubview:shareButton];
    
    [shareButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [shareButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    UIView * leftView = [UIView new];
    leftView.tag = 1000;
    [self.view addSubview:leftView];
    
    [leftView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
    [leftView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:topView];
    
    UIView * exchangeView = [UIView new];
    exchangeView.cornerRadius = 20;
    exchangeView.backgroundColor = ATWhite;
    [leftView addSubview:exchangeView];
    
    [exchangeView autoSetDimension:ALDimensionHeight toSize:40];
    [exchangeView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [exchangeView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [exchangeView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:topView withOffset:20];
    
    UIButton * exchangeButton = [UIButton buttonWithTitle:@"兑换" titleColor:ATWhite font:kFONT14 target:self action:@selector(exchangeAction)];
    exchangeButton.backgroundColor = RGB(240, 143, 54);
    exchangeButton.clipsToBounds = YES;
    [exchangeView addSubview:exchangeButton];
    
    [exchangeButton autoSetDimension:ALDimensionWidth toSize:80];
    [exchangeButton autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeLeft];
    
    UITextField * exchangeTextField = [UITextField new];
    exchangeTextField.font = kFONT12;
    exchangeTextField.placeholder = @"请输入兑奖码～";
    exchangeTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [exchangeView addSubview:exchangeTextField];
    
    [exchangeTextField autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 25, 0, 0) excludingEdge:ALEdgeRight];
    [exchangeTextField autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:exchangeButton withOffset:-10];
    
    UILabel * label1 = [UILabel new];
    label1.text = @"优惠券";
    label1.font = [UIFont systemFontOfSize:18];
    [leftView addSubview:label1];
    
    [label1 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [label1 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:exchangeView withOffset:30];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView removeEmptyCellRows];
    [leftView addSubview:self.tableView];
    
    [self.tableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
    [self.tableView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:label1 withOffset:20];
    
    UIView * rightView = [UIView new];
    rightView.tag = 1001;
    rightView.alpha = 0;
    [self.view addSubview:rightView];
    
    [rightView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
    [rightView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:topView];
    
    UIView * drawView = [UIView new];
    drawView.backgroundColor = ATWhite;
    drawView.cornerRadius = 10;
    [rightView addSubview:drawView];
    
    [drawView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(30, 20, 100, 20)];
    
    UIImageView * titleImg = [UIImageView new];
    titleImg.image = IMAGE(@"draw_title");
    [drawView addSubview:titleImg];
    
    [titleImg autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [titleImg autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:30];
    
    UILabel * tipLabel = [UILabel new];
    tipLabel.text = @"中奖概率100%，奖品超丰厚";
    tipLabel.textAlignment = NSTextAlignmentCenter;
    tipLabel.font = kFONT15;
    tipLabel.textColor = ATWhite;
    tipLabel.backgroundColor = ATGray;
    tipLabel.cornerRadius = 15;
    [drawView addSubview:tipLabel];
    
    [tipLabel autoSetDimensionsToSize:CGSizeMake(220, 30)];
    [tipLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [tipLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:titleImg withOffset:30];
    
    UIImage * bgImg = IMAGE(@"draw_bg");
    self.drawBg = [UIImageView new];
    self.drawBg.image = bgImg;
    self.drawBg.userInteractionEnabled = YES;
    [drawView addSubview:self.drawBg];
    
    [self.drawBg autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [self.drawBg autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [self.drawBg autoMatchDimension:ALDimensionHeight toDimension:ALDimensionWidth ofView:self.drawBg];
    [self.drawBg autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:tipLabel withOffset:50];
    
    UIImageView * pointerImg = [UIImageView new];
    pointerImg.image = IMAGE(@"draw_pointer");
    [pointerImg addJXTouch:^{
        [self startAnimation];
    }];
    [drawView addSubview:pointerImg];
    
    [pointerImg autoAlignAxis:ALAxisVertical toSameAxisOfView:self.drawBg];
    [pointerImg autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.drawBg withOffset:-10];
    
    UIView * bottomView = [UIView new];
    [rightView addSubview:bottomView];
    
    [bottomView autoSetDimension:ALDimensionHeight toSize:100];
    [bottomView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
    
    [self.bottomArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIView * bottomImg = [[UIView alloc] initWithFrame:CGRectMake(ATScreenWidth/self.bottomArray.count * idx, 0, ATScreenWidth/self.bottomArray.count, 100)];
        [bottomView addSubview:bottomImg];
        
        UIImageView * imgView = [UIImageView new];
        imgView.image = IMAGE(obj);
        [bottomImg addSubview:imgView];
        
        [imgView autoCenterInSuperview];
    }];
}

#pragma mark - tableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ATCouponCell * cell = [tableView dequeueReusableCellWithIdentifier:@"coupon"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ATCouponCell" owner:nil options:nil] firstObject];
    }
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

#pragma mark - animate
- (void)startAnimation{
    CGFloat perAngle = M_PI/180.0;
    
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:22.5 * perAngle + 360 * perAngle * 5];
    rotationAnimation.duration = 3.0f;
    rotationAnimation.cumulative = YES;
    rotationAnimation.delegate = self;
    //由快变慢
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    rotationAnimation.fillMode=kCAFillModeForwards;
    rotationAnimation.removedOnCompletion = NO;
    [self.drawBg.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

#pragma mark - Action
-(void)exchangeAction{
    
}
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)btnClick:(UIButton *)btn{
    btn.highlighted = NO;
}
-(void)titleButtonAction:(UIButton *)btn{
    if (btn.selected) {
        return;
    }
    UIView *view = [UIView new];
    UIView *otherview = [UIView new];
    if (btn.tag == 101) {
        UIButton * button = (UIButton *)[self.view viewWithTag:102];
        button.selected = NO;
        
        view = (UIView *)[self.view viewWithTag:1000];
        otherview = (UIView *)[self.view viewWithTag:1001];
        
        self.view.backgroundColor = RGB(244, 244, 244);
        UIButton * share = (UIButton *)[self.view viewWithTag:233];
        share.hidden = NO;
    }else if (btn.tag == 102){
        UIButton * button = (UIButton *)[self.view viewWithTag:101];
        button.selected = NO;
        
        view = (UIView *)[self.view viewWithTag:1001];
        otherview = (UIView *)[self.view viewWithTag:1000];
        
        self.view.backgroundColor = RGB(169, 218, 251);
        UIButton * share = (UIButton *)[self.view viewWithTag:233];
        share.hidden = YES;
    }
    [UIView animateWithDuration:0.5 animations:^{
        view.alpha = 1.0;
        otherview.alpha = 0.0;
    }];
    btn.selected = YES;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

@end
