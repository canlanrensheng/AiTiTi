//
//  NSString+Times.m
//  FnuoApp
//
//  Created by zhongxueyu on 16/2/24.
//  Copyright © 2016年 方诺科技. All rights reserved.
//

#import "NSString+Times.h"
#import <CommonCrypto/CommonDigest.h>
@implementation NSString (Times)

+(NSString *)GetNowTimes{
    
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[date timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%.0f",a];
    NSLog(@"time is %@",timeString);
    return timeString;
}

+(NSString *)getTimeStrWithString:(NSString *)str{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSDate *tempDate = [dateFormatter dateFromString:str];
    NSString *timeStr = [NSString stringWithFormat:@"%ld", (long)[tempDate timeIntervalSince1970]];
    return timeStr;
}

+(NSString *)getTimeStr:(NSString *)getTime{
    
    NSLog(@"time is %ld",(long)[getTime integerValue]);
    NSTimeInterval time=[getTime doubleValue];
    NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:time];
    NSLog(@"date:%@",[detaildate description]);
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString *currentDateStr = [dateFormatter stringFromDate: detaildate];
    return currentDateStr;
}
+(NSString *) md5: (NSString *) inPutText
{
    const char *cStr = [inPutText UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    
    return [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] lowercaseString];
}

+(NSString *)GetNowTimesWithMD5{
    
    
    NSString* timeWithMd5 = [self md5:[NSString stringWithFormat:@"%@",[self GetNowTimes]]];
    
    return timeWithMd5;
    
}

+(NSDictionary *)GetParamDic{
    
    NSDictionary *parameteiDic=@{@"sigin":[NSString GetNowTimesWithMD5],@"time":[NSString GetNowTimes]};
    return parameteiDic;
    
}

+(NSString *)GetSignString:(NSArray *)oldArray{
    //排序后
    NSArray *newArray = [oldArray sortedArrayUsingSelector:@selector(compare:)];
//    NSLog(@"old Array = %@,new array = %@",oldArray,newArray);
    //拼接
    NSString *sorted = [newArray componentsJoinedByString:@""];
    //生成sign
    NSString* sign = [NSString md5:[NSString stringWithFormat:@"%@",sorted]];
//    XYLog(@"sign is%@",sign);
    
    return sign;
}

+ (NSString *)encodeToPercentEscapeString: (NSString *) input
{
    NSString * outputStr = [input stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return
    outputStr;
}

+ (NSString *)getStringFromJOSNData:(NSDictionary *)dict
{
    if(!dict){
        return nil;
    }
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

+ (NSString *)getSignStringWithDictionary:(NSDictionary *)dict
{
    NSMutableArray *array = [NSMutableArray new];
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSString *combinedString = [NSString stringWithFormat:@"%@%@",key,obj];
        [array addObject:combinedString];
    }];
    NSString *sign = [NSString GetSignString:array];
    return sign;
}
+ (BOOL)checkIsSuccess:(id)sender andElement:(NSString *)ele{
    if ([[NSString stringWithFormat:@"%@",sender] isEqualToString:ele]) {
        return YES;
    }else{
        return NO;
    }
}

+ (NSString *)emptyCheck:(NSString*)string replace:(NSString*)replace{
    if ([string isKindOfClass:[NSString class]]) {
        if (string == nil || string.length == 0) {
            return  replace == nil || replace.length == 0 ? @"":replace;
        }else{
            return string;
        }
    }else{
        return   replace == nil || replace.length == 0 ? @"":replace;
    }
    
}

+ (BOOL)isEmpty:(NSString *)string{
    if (string == nil) {
        return YES;
    }else{
        if ([string isKindOfClass:[NSString class]]  && string.length >= 1 ) {
            return NO;
        }else{
            if ([NSString stringWithFormat:@"%@",string].length>=1) {
                return NO;
            }else{
                return YES;
            }
        }
    }
}
@end
