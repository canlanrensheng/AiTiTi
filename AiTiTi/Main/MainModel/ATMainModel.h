//
//  ATMainModel.h
//  AiTiTi
//
//  Created by 云辉 on 2018/4/3.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@class medalModel,subjectVipModel;

@interface ATMainModel : NSObject

/** 个性签名 */
@property (nonatomic,copy) NSString * about;
/** 生日 */
@property (nonatomic,copy) NSString * birthday;
/** 地区 */
@property (nonatomic,copy) NSString * city;
/** 年级 */
@property (nonatomic,copy) NSString * grade;
/** 学校 */
@property (nonatomic,copy) NSString * school;
/** 梦想大学 */
@property (nonatomic,copy) NSString * college;
/** 是否点亮 */
@property (nonatomic,copy) NSString * college_ok;
/** 头像 */
@property (nonatomic,copy) NSString * head;
/** 用户id */
@property (nonatomic,copy) NSString * usder_id;
/** 用户登录id */
@property (nonatomic,copy) NSString * userguid;
/** 用户等级 */
@property (nonatomic,copy) NSString * level;
/** 勋章列表 */
@property (nonatomic,copy) NSArray<medalModel *> * medal;
/** 名字 */
@property (nonatomic,copy) NSString * name;
/** 学霸值 */
@property (nonatomic,copy) NSString * person_score;
/** 手机号 */
@property (nonatomic,copy) NSString * phone;
/** 积分数 */
@property (nonatomic,copy) NSString * point;
/** 性别 */
@property (nonatomic,copy) NSString * sex;
/** 用户名 */
@property (nonatomic,copy) NSString * username;
/** 提提号 */
@property (nonatomic,copy) NSString * code;
/** 推荐人提提号 */
@property (nonatomic,copy) NSString * recommend_code;
/** 是否是老师 */
@property (nonatomic,copy) NSString * isteacher;
/** 课程数(教师信息) */
@property (nonatomic,copy) NSString * teach_subject;
/** 点赞数(教师信息) */
@property (nonatomic,copy) NSString * praise;
/** 粉丝数(教师信息) */
@property (nonatomic,copy) NSString * fans;
/** 余额或收人 */
@property (nonatomic,copy) NSString * money;
/** 基础会员最后期限 */
@property (nonatomic,copy) NSString * basedeadline;
/** 是否开启基础会员 */
@property (nonatomic,copy) NSString * basedeadline_ok;
/** vip期限 */
@property (nonatomic,copy) NSArray<subjectVipModel *> * subjectvip;
/** VIP最后期限 */
@property (nonatomic,copy) NSString * deadline;

+ (void)saveMine:(ATMainModel *)model;
+ (ATMainModel *)mineInstance;

@end

@interface medalModel : NSObject

/** 勋章id */
@property (nonatomic,copy) NSString * medal_id;
/** 勋章图片 */
@property (nonatomic,copy) NSString * img;
/** 级别 */
@property (nonatomic,copy) NSString * level;
/** 勋章名称 */
@property (nonatomic,copy) NSString * name;

@end

@interface subjectVipModel : NSObject

/** 勋章id */
@property (nonatomic,copy) NSString * subject_id;
/** 勋章图片 */
@property (nonatomic,copy) NSString * deadline;
/** 级别 */
@property (nonatomic,copy) NSString * name;
/** 勋章名称 */
@property (nonatomic,copy) NSString * day;

@end
