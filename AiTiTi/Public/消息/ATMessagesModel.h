//
//  ATMessagesModel.h
//  AiTiTi
//
//  Created by 李云辉 on 2018/4/24.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ATMessagesModel : NSObject

/** 消息文字 */
@property(nonatomic,copy)NSString * content;
/** 消息时间 */
@property(nonatomic,copy)NSString * date;
/** 消息id */
@property(nonatomic,copy)NSString * news_id;
/** 跳转类型
* 400    默认
* 401    链接
* 402    真题
* 403    专题
* 404    系统课
* 405    计划
* 406    充值
* 407    VIP
* 408    常规抽奖
* 409    活动抽奖
* 410    优惠页
* 411    试卷页
* 412    知识点
*/
@property(nonatomic,copy)NSString * itemtype;
/** 跳转id */
@property(nonatomic,copy)NSString * itemid;

@end
