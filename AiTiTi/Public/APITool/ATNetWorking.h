//
//  ATNetWorking.h
//  AiTiTi
//
//  Created by 云辉 on 2018/3/30.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SuccessBlock)(id responseBody);
typedef void(^FailureBlock)(NSString * error);

@interface ATNetWorking : NSObject

+(ATNetWorking *)sharedManager;

#pragma mark - GET
-(void)getResultWithParameter:(NSMutableDictionary *)parameter url:(NSString *)url successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock;

#pragma mark - POST
-(void)postResultWithParameter:(NSMutableDictionary *)parameter url:(NSString *)url successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock;

#pragma mark - AFN上传照片
-(void)upImageWithParameter:(NSMutableDictionary *)parameter imageArray:(NSArray *)images url:(NSString *)url successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock;

+ (void)cancelAllRequest;

@end
