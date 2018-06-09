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

#import <WXApi.h>
#import <UMSocialQQHandler.h>

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
        if ([WXApi isWXAppInstalled]) {
            [[UMSocialManager defaultManager] getUserInfoWithPlatform:UMSocialPlatformType_WechatSession currentViewController:nil completion:^(id result, NSError *error) {
                UMSocialUserInfoResponse *resp = result;
                if (resp) {
                    [self thirdLogin:resp.uid icon:resp.iconurl sex:resp.gender name:resp.name type:@"22"];
                }
            }];
        }else{
            [FNTipsView showTips:@"未安装微信，请更换登录方式"];
        }
    }];
    [self.QQImg addJXTouch:^{
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"mqq://"]]) {
            [[UMSocialManager defaultManager] getUserInfoWithPlatform:UMSocialPlatformType_QQ currentViewController:nil completion:^(id result, NSError *error) {
                UMSocialUserInfoResponse *resp = result;
                if (resp) {
                    [self thirdLogin:resp.uid icon:resp.iconurl sex:resp.gender name:resp.name type:@"24"];
                }
            }];
        }else{
            [FNTipsView showTips:@"未安装QQ，请更换登录方式"];
        }
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
    if (![self.userText.text length]) {
        [FNTipsView showTips:@"请输入手机号或者提提号"];
        return;
    }
    
    if (![self.pwdText.text length]) {
        [FNTipsView showTips:@"请输入密码"];
        return;
    }
    
    [self loginNet];
}
- (IBAction)registerUser:(id)sender {
    ATRegisterViewController * VC = [ATRegisterViewController new];
    [self.navigationController pushViewController:VC animated:YES];
}

#pragma mark - loginNet
-(void)loginNet{
    [SVProgressHUD show];
    NSMutableDictionary * parame = [NSMutableDictionary dictionaryWithDictionary:@{@"phone":self.userText.text,
                                                                                   @"password":self.pwdText.text
                                                                                   }];
    [[ATNetWorking sharedManager] ATPostResultWithParameter:parame url:user_login successBlock:^(id responseBody) {
        NSLog(@"%@",responseBody);
        ATMainModel * model = [ATMainModel mj_objectWithKeyValues:responseBody];
        [ATMainModel saveMine:model];
        [[NSUserDefaults standardUserDefaults] setObject:responseBody[@"id"] forKey:userID];
        [[NSUserDefaults standardUserDefaults] setObject:responseBody[@"userguid"] forKey:userguID];
        [UIApplication sharedApplication].keyWindow.rootViewController = [ATMainViewController new];
    } failureBlock:^(NSString *error) {
        NSLog(@"%@",error);
        if ([error isEqualToString:@"401"]) {
            [FNTipsView showTips:@"帐号或密码错误"];
        }else if ([error isEqualToString:@"403"]){
            [FNTipsView showTips:@"您的帐号已经被系统禁用，请联系管理员"];
        }else{
            [FNTipsView showTips:@"网络错误！"];
        }
    }];
}

#pragma mark - thirdLogin
-(void)thirdLogin:(NSString *)uid icon:(NSString *)icon sex:(NSString *)sex name:(NSString *)name type:(NSString *)type{
    [SVProgressHUD show];
    NSMutableDictionary * parame = [NSMutableDictionary dictionaryWithDictionary:@{@"about":@"",
                                                                                   @"birthday":@"",
                                                                                   @"icon":icon,
                                                                                   @"name":name,
                                                                                   @"sex":sex,
                                                                                   @"type":type,
                                                                                   @"uid":uid
                                                                                   }];
    [[ATNetWorking sharedManager] ATPostResultWithParameter:parame url:user_thirdlogin successBlock:^(id responseBody) {
        ATMainModel * model = [ATMainModel mj_objectWithKeyValues:responseBody];
        [ATMainModel saveMine:model];
        [[NSUserDefaults standardUserDefaults] setObject:responseBody[@"id"] forKey:userID];
        [[NSUserDefaults standardUserDefaults] setObject:responseBody[@"userguid"] forKey:userguID];
        [UIApplication sharedApplication].keyWindow.rootViewController = [ATMainViewController new];
    } failureBlock:^(NSString *error) {
        [FNTipsView showTips:@"登录失败，请重试！"];
    }];
}

@end
