


//
//  ATReportView.m
//  AiTiTi
//
//  Created by LA on 2018/6/3.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATReportView.h"
#import "ATReportCell.h"

#define ATReportBgHeight 875/2
#define MYCOLOR(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

@interface ATReportView ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>
@property (nonatomic,strong) UIView *bgView;
@property (nonatomic, strong) UIImageView *alertView;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ATReportView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width,self.frame.size.height)];
    self.bgView.backgroundColor = MYCOLOR(0, 0, 0, 0.4);
    [self addSubview:self.bgView];
    self.bgView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    tap.delegate = self;
    @weakify(self);
    [[tap rac_gestureSignal] subscribeNext:^(id x) {
        @strongify(self);
        [self la_dismiss];
    }];
    [self.bgView addGestureRecognizer:tap];
    
    // 弹窗视图
    UIImageView *alertView = [[UIImageView alloc] init];
    alertView.image = [UIImage imageNamed:@"report_bg"];
    alertView.contentMode = UIViewContentModeScaleToFill;
    alertView.userInteractionEnabled = YES;
    UITapGestureRecognizer *alertTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:nil];
    [alertView addGestureRecognizer:alertTap];
    [self.bgView addSubview:alertView];
    self.alertView = alertView;
    self.alertView.frame = CGRectMake(0, Screen_Height, Screen_Width, ATReportBgHeight);
    
//    [alertView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self.bgView.mas_bottom);
////        make.centerY.mas_equalTo(Screen_Height);
//        make.left.right.equalTo(self.bgView);
//        make.height.mas_equalTo(292);
//    }];
    
    // 标题
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"举报";
    titleLabel.font = [UIFont systemFontOfSize:15];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor blackColor];
    [alertView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(alertView.mas_top).offset(70);
        make.centerX.equalTo(alertView.mas_centerX);
    }];
    
    // 提交
    UIButton *commentBtn = [[UIButton alloc] init];
    [commentBtn setTitle:@"提交" forState:UIControlStateNormal];
    [commentBtn setBackgroundColor:RGB(54, 181, 252)];
    commentBtn.layer.cornerRadius = 35/2;
    commentBtn.layer.masksToBounds = YES;
    [[commentBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self);
        if (self.commitBlock) {
            self.commitBlock();
        }
        [self la_dismiss];
    }];
    [alertView addSubview:commentBtn];
    [commentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(35);
        make.right.mas_equalTo(-35);
        make.height.mas_equalTo(35);
        make.bottom.equalTo(alertView.mas_bottom).offset(-20);
    }];
    
    [alertView addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(alertView);
        make.top.equalTo(titleLabel.mas_bottom).offset(15);
        make.bottom.equalTo(commentBtn.mas_top).offset(-15);
    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ATReportCell *cell = [ATReportCell getTableView:tableView forIndexPath:indexPath];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)la_show {
    UIWindow *kWindow = [UIApplication sharedApplication].keyWindow;
    [kWindow addSubview:self];
    [UIView animateWithDuration:0.5 animations:^{
        CGRect rec = self.alertView.frame;
        rec.origin.y = Screen_Height - ATReportBgHeight;
        self.alertView.frame = rec;
    } completion:^(BOOL finished) {
        
    }];

}

- (void)la_dismiss {
    [UIView animateWithDuration:0.5 animations:^{
        CGRect rec = self.alertView.frame;
        rec.origin.y = Screen_Height;
        self.alertView.frame = rec;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = YES;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
