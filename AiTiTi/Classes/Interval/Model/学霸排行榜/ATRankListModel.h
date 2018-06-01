//
//  ATRankListModel.h
//  AiTiTi
//
//  Created by 李云辉 on 2018/5/6.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ATRankMessageModel;
@interface ATRankListModel : NSObject

/** 用户名 */
@property (nonatomic,copy) NSString * username;
/** 头像 */
@property (nonatomic,copy) NSString * head;
/** 等级 */
@property (nonatomic,copy) NSString * level;
/** 学霸值 */
@property (nonatomic,copy) NSString * person_score;
/** 是否上榜  1 是 0 否 */
@property (nonatomic,copy) NSString * isrank;
/** 梦想大学 */
@property (nonatomic,copy) NSString * college;
/** 排行榜列表 */
@property (nonatomic,copy) NSArray<ATRankMessageModel *> * medal;

@end

@interface ATRankMessageModel : NSObject

/** 用户名 */
@property (nonatomic,copy) NSString * name;
/** 头像 */
@property (nonatomic,copy) NSString * head;
/** 等级 */
@property (nonatomic,copy) NSString * level;
/** 学霸值 */
@property (nonatomic,copy) NSString * person_score;
/** 是否点亮大学  1 是 0 否 */
@property (nonatomic,copy) NSString * college_ok;
/** 梦想大学 */
@property (nonatomic,copy) NSString * college;
/** 用户id */
@property (nonatomic,copy) NSString * user_id;
/** 是否关注 */
@property (nonatomic,copy) NSString * isfriends;
/** 等级图片 */
@property (nonatomic,copy) NSString * level_img;

@end
