//
//  ATLoginViewController.m
//  AiTiTi
//
//  Created by 李云辉 on 2018/5/15.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATLoginViewController.h"
#import "ATGetbackPwdViewController.h"
#import "ATRegisterViewController.h"
#import "ATBindPhoneViewController.h"

@interface ATLoginViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *WeChatImg;
@property (weak, nonatomic) IBOutlet UIImageView *QQImg;
@property (weak, nonatomic) IBOutlet UITextField *userText;
@property (weak, nonatomic) IBOutlet UITextField *pwdText;

@end

@implementation ATLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"登录";
    
    [self.WeChatImg addJXTouch:^{
        NSLog(@"weChat");
    }];
    [self.QQImg addJXTouch:^{
        NSLog(@"QQ");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)getbackPwd:(id)sender {
    ATGetbackPwdViewController * VC = [ATGetbackPwdViewController new];
    [self.navigationController pushViewController:VC animated:YES];
}
- (IBAction)login:(id)sender {
    ATBindPhoneViewController * VC = [ATBindPhoneViewController new];
    [self.navigationController pushViewController:VC animated:YES];
}
- (IBAction)registerUser:(id)sender {
    ATRegisterViewController * VC = [ATRegisterViewController new];
    [self.navigationController pushViewController:VC animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
