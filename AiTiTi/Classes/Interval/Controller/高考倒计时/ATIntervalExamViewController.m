//
//  ATIntervalExamViewController.m
//  AiTiTi
//
//  Created by 李云辉 on 2018/4/25.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATIntervalExamViewController.h"

@interface ATIntervalExamViewController ()

@property(nonatomic,strong)UILabel * yearLabel;
@property(nonatomic,strong)UILabel * dayLabel;
@property(nonatomic,strong)UILabel * hourLabel;
@property(nonatomic,strong)UILabel * minuteLabel;
@property(nonatomic,strong)UILabel * secondLabel;
@property(nonatomic,strong)UILabel * timeLosLabel;
@property(nonatomic,strong)NSTimer * cutterDown;

@property(nonatomic,copy)NSString * year;
@property(nonatomic,copy)NSString * recStr;
@property(nonatomic,assign)NSInteger recNum;

@end

@implementation ATIntervalExamViewController

#pragma mark - system
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
    [self.cutterDown invalidate];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI
-(void)makeSubViews{
    [self makeLabelValues];
    UIImageView * bgImg = [UIImageView new];
    bgImg.image = IMAGE(@"interval_exam_bg");
    [self.view addSubview:bgImg];
    
    [bgImg autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
    
    UIView * topView = [UIView new];
//    topView.backgroundColor = [UIColor redColor];
    [self.view addSubview:topView];
    
    [topView autoSetDimension:ALDimensionHeight toSize:40];
    [topView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(statusbarH, 0, 0, 0) excludingEdge:ALEdgeBottom];
    
    UIButton * backButton = [UIButton buttonWithTitle:@"" titleColor:[UIColor whiteColor] font:kFONT13 target:self action:@selector(backAction) backImageName:@"return"];
    [topView addSubview:backButton];
    
    [backButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [backButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    UIButton * musicButton = [UIButton buttonWithTitle:@"" titleColor:[UIColor whiteColor] font:kFONT13 target:self action:@selector(backAction) backImageName:@"interval_music"];
    [topView addSubview:musicButton];
    
    [musicButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [musicButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    self.yearLabel = [UILabel new];
    self.yearLabel.text = [NSString stringWithFormat:@"距离%@年",self.year];
    self.yearLabel.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:self.yearLabel];
    
    [self.yearLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:topView withOffset:0];
    [self.yearLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    UIImageView * titleImg = [UIImageView new];
    titleImg.image = IMAGE(@"interval_exam_title");
    [self.view addSubview:titleImg];
    
    [titleImg autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.yearLabel withOffset:20];
    [titleImg autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    UILabel * label1 = [UILabel new];
    label1.text = @"仅剩";
    label1.font = kFONT17;
    label1.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label1];
    
    [label1 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:titleImg withOffset:20];
    [label1 autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    UIView * timeView = [UIView new];
    [self.view addSubview:timeView];
    
    [timeView autoSetDimensionsToSize:CGSizeMake(280, 50)];
    [timeView autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [timeView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:label1 withOffset:20];
    
    self.dayLabel = [UILabel new];
    self.dayLabel.text = @"***";
    [self.dayLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:40]];
    self.dayLabel.textColor = RGB(147, 95, 50);
    [timeView addSubview:self.dayLabel];
    
    [self.dayLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [self.dayLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
    
    UILabel * label2 = [UILabel new];
    label2.text = @"天";
    label2.font = [UIFont fontWithName:@"Helvetica-Bold" size:15];
    [timeView addSubview:label2];
    
    [label2 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.dayLabel withOffset:5];
    [label2 autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.dayLabel];
    
    self.hourLabel = [UILabel new];
    self.hourLabel.text = @"**";
    [self.hourLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:40]];
    self.hourLabel.textColor = RGB(147, 95, 50);
    [timeView addSubview:self.hourLabel];
    
    [self.hourLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:label2 withOffset:5];
    [self.hourLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.dayLabel];
    
    UILabel * label3 = [UILabel new];
    label3.text = @"小时";
    label3.font = [UIFont fontWithName:@"Helvetica-Bold" size:15];
    [timeView addSubview:label3];
    
    [label3 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.hourLabel withOffset:5];
    [label3 autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.dayLabel];
    
    self.minuteLabel = [UILabel new];
    self.minuteLabel.text = @"**";
    [self.minuteLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:40]];
    self.minuteLabel.textColor = RGB(147, 95, 50);
    [timeView addSubview:self.minuteLabel];
    
    [self.minuteLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:label3 withOffset:5];
    [self.minuteLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.dayLabel];
    
    UILabel * label4 = [UILabel new];
    label4.text = @"分";
    label4.font = [UIFont fontWithName:@"Helvetica-Bold" size:15];
    [timeView addSubview:label4];
    
    [label4 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.minuteLabel withOffset:5];
    [label4 autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.dayLabel];
    
    self.secondLabel = [UILabel new];
    self.secondLabel.text = @"**";
    [self.secondLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:40]];
    self.secondLabel.textColor = RGB(147, 95, 50);
    [timeView addSubview:self.secondLabel];
    
    [self.secondLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:label4 withOffset:5];
    [self.secondLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.dayLabel];
    
    UILabel * label5 = [UILabel new];
    label5.text = @"秒";
    label5.font = [UIFont fontWithName:@"Helvetica-Bold" size:15];
    [timeView addSubview:label5];
    
    [label5 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.secondLabel withOffset:5];
    [label5 autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.dayLabel];
    
    self.timeLosLabel = [UILabel new];
    self.timeLosLabel.text = @"距离****年\n***天**小时**分**秒";
    self.timeLosLabel.numberOfLines = 2;
    self.timeLosLabel.textAlignment = NSTextAlignmentCenter;
    self.timeLosLabel.font = kFONT16;
    self.timeLosLabel.textColor = RGB(152, 153, 154);
    [self.view addSubview:self.timeLosLabel];
    
    [self.timeLosLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:timeView withOffset:150];
    [self.timeLosLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    self.cutterDown = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeLabelUpdate) userInfo:nil repeats:YES];
    
    UILabel * label6 = [UILabel new];
    label6.text = @"高考路上，爱提提伴你一路同行！";
    label6.font = kFONT13;
    [self.view addSubview:label6];
    
    [label6 autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [label6 autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:10];
}

#pragma mark - Action
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)timeLabelUpdate{
    self.dayLabel.text = [NSString stringWithFormat:@"%ld",self.recNum/(24*60*60)];
    self.hourLabel.text = [NSString stringWithFormat:@"%02ld",self.self.recNum/(60*60)%24];
    self.minuteLabel.text = [NSString stringWithFormat:@"%02ld",self.recNum/60%60];
    self.secondLabel.text = [NSString stringWithFormat:@"%02ld",self.recNum%60];
    
    if (([self.year integerValue] + 1)%4) {
        self.timeLosLabel.text = [NSString stringWithFormat:@"距离%ld年\n%ld天%02ld小时%02ld分%02ld秒",[self.year integerValue] + 1,self.recNum/(24*60*60) + 365,self.recNum/(60*60)%24,self.recNum/60%60,self.recNum%60];
    }else{
        self.timeLosLabel.text = [NSString stringWithFormat:@"距离%ld年\n%ld天%02ld小时%02ld分%02ld秒",[self.year integerValue] + 1,self.recNum/(24*60*60) + 366,self.recNum/(60*60)%24,self.recNum/60%60,self.recNum%60];
    }
    
    
    self.recNum --;
    
    if (self.recNum == 0) {
        [self makeLabelValues];
        self.yearLabel.text = [NSString stringWithFormat:@"距离%@年",self.year];
    }
}
#pragma mark - setValues
-(void)makeLabelValues{
    NSDate * date = [NSDate date];
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:@"yyyy"];
    NSInteger currentYear=[[formatter stringFromDate:date] integerValue];
    [formatter setDateFormat:@"MM"];
    NSInteger currentMonth=[[formatter stringFromDate:date]integerValue];
    [formatter setDateFormat:@"dd"];
    NSInteger currentDay=[[formatter stringFromDate:date] integerValue];
    
    NSString * timeNow = [NSString GetNowTimes];
    NSString * timeLos = [NSString getTimeStrWithString:[NSString stringWithFormat:@"%ld-06-06 00:00:00",currentYear]];
    
    if (currentMonth >= 6 && currentDay >= 6) {
        currentYear ++;
        timeLos = [NSString getTimeStrWithString:[NSString stringWithFormat:@"%ld-06-06 00:00:00",currentYear]];
    }
    NSInteger timeNum = [timeLos integerValue] - [timeNow integerValue];
    self.recNum = timeNum;
    self.year = [NSString stringWithFormat:@"%ld",currentYear];
}

@end
