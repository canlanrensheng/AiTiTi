//
//  ATRegisterViewController.m
//  AiTiTi
//
//  Created by 李云辉 on 2018/5/15.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATRegisterViewController.h"

@interface ATRegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneText;
@property (weak, nonatomic) IBOutlet UITextField *codeText;
@property (weak, nonatomic) IBOutlet UITextField *pwdText;
@property (weak, nonatomic) IBOutlet UITextField *pwdSureText;
@property (weak, nonatomic) IBOutlet UIButton *codeButton;
@property (weak, nonatomic) IBOutlet UIButton *agrment;

@property(nonatomic,strong)NSTimer * timer;

@end

@implementation ATRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"注册";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action
- (IBAction)selectBtn:(UIButton *)sender {
    sender.selected = !sender.selected;
}
- (IBAction)registerBtn:(id)sender {
    if ([NSString isEmpty:self.phoneText.text]) {
        [FNTipsView showTips:@"请输入手机号"];
        return;
    }else if (self.phoneText.text.length != 11) {
        [FNTipsView showTips:@"请输入正确的手机号"];
        return;
    }
    
    if (self.codeText.text.length != 6) {
        [FNTipsView showTips:@"请输入6位验证码"];
        return;
    }
    
    if (self.pwdText.text.length < 6) {
        [FNTipsView showTips:@"密码不能小于6位"];
        return;
    }
    
    if (![self.pwdText.text isEqualToString:self.pwdSureText.text]) {
        [FNTipsView showTips:@"两次密码输入不同"];
        return;
    }
    
    if (!self.agrment.selected) {
        [FNTipsView showTips:@"请同意协议"];
        return;
    }
    
    [self registerNet];
    
}
- (IBAction)getCode:(UIButton *)sender {
    if ([NSString isEmpty:self.phoneText.text]) {
        [FNTipsView showTips:@"请输入手机号"];
        return;
    }else if (self.phoneText.text.length != 11) {
        [FNTipsView showTips:@"请输入正确的手机号"];
        return;
    }
    sender.enabled = NO;
    [self getCodeNet];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeDown) userInfo:nil repeats:YES];
}

#pragma mark - getCode
-(void)getCodeNet{
    ATNetWorking * net = [ATNetWorking sharedManager];
    [net getResultWithParameter:nil url:[NSString stringWithFormat:@"%@/%@",user_code,self.phoneText.text] successBlock:^(id responseBody) {
        NSLog(@"%@",responseBody);
    } failureBlock:^(NSString *error) {
        NSLog(@"%@",error);
    }];
}
-(void)timeDown{
    static NSInteger timeNum = 10;
    if (timeNum == 0) {
        timeNum = 10;
        self.codeButton.enabled = YES;
        [self.codeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
        [self.timer invalidate];
    }else{
        [self.codeButton setTitle:[NSString stringWithFormat:@"剩余%ld秒",timeNum] forState:UIControlStateNormal];
    }
    timeNum --;
}

#pragma mark - register
-(void)registerNet{
    NSMutableDictionary * parame = [NSMutableDictionary dictionaryWithDictionary:@{@"phone":self.phoneText.text,
                                                                                   @"verify":self.codeText.text,
                                                                                   @"password":self.pwdText.text
                                                                                   }];
    ATNetWorking * net = [ATNetWorking sharedManager];
    [net postResultWithParameter:parame url:user_regist successBlock:^(id responseBody) {
        NSLog(@"%@",responseBody);
    } failureBlock:^(NSString *error) {
        NSLog(@"%@",error);
    }];
}

@end
