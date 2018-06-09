//
//  NSString+Times.h
//  FnuoApp
//
//  Created by zhongxueyu on 16/2/24.
//  Copyright © 2016年 方诺科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Times)
/** 获取时间戳 */
+(NSString *)GetNowTimes;

/** 转换时间戳 */
+(NSString *)getTimeStrWithString:(NSString *)str;

/** 生成MD5 */
+(NSString *) md5: (NSString *) inPutText ;

/** 只有time和sign两个参数的生成的sign */
+(NSString *)GetNowTimesWithMD5;

/** 只有time和sign两个参数的时候直接调用 */
+(NSDictionary *)GetParamDic;

/** 将数组排序后生成MD5 */
+(NSString *)GetSignString:(NSArray *)oldArray;

/** 将时间戳转化为标准时间 */
+(NSString *)getTimeStr:(NSString *)time;

/** 将字符串转码 **/
+ (NSString *)encodeToPercentEscapeString:(NSString *) input;
/**
 *  生成stringJSON
 *
 *  @param dict 参数
 *
 *  @return JSONString
 */
+ (NSString *)getStringFromJOSNData:(NSDictionary *)dict;
/**
 *  生成sign
 *
 *  @param dict 参数
 *
 *  @return 返回sign
 */
+ (NSString *)getSignStringWithDictionary:(NSDictionary *)dict;

+ (BOOL)checkIsSuccess:(id)sender andElement:(NSString *)ele;

+ (NSString *)emptyCheck:(NSString*)string replace:(NSString*)replace;

+ (BOOL)isEmpty:(NSString*)string;
@end
