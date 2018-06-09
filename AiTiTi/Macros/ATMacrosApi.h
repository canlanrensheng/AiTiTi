//
//  ATMacrosApi.h
//  AiTiTi
//
//  Created by 云辉 on 2018/3/30.
//  Copyright © 2018年 云辉. All rights reserved.
//

#ifndef ATMacrosApi_h
#define ATMacrosApi_h

//测试环境
#define IP @"http://test.aititi.com"
//正式环境
//#define IP @"http://app2.aititi.com"

//登录
#define user_login @"/app/v1.0/login"

//用户资料
#define user_info @"/app/v1.0/user_info"

//注册
#define user_regist @"/app/v1.0/reg"

//发送验证码
#define user_code @"/app/v1.0/send_phone_verify"

//第三方登录
#define user_thirdlogin @"/app/v1.0/third_login"

//保存手机号
#define user_setphone @"/app/v1.0/set_user_phone"

//变更手机号
#define user_changephone @"/app/v1.0/set_user_phone/changephone"

//首页经典好题
#define homeClassicTopics IP@"/app/v1.0/index/list/1"

#endif /* ATMacrosApi_h */
