//
//  ATNetWorking.m
//  AiTiTi
//
//  Created by 云辉 on 2018/3/30.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATNetWorking.h"

@implementation ATNetWorking

+(ATNetWorking *)sharedManager{
    static ATNetWorking *sharedNetworkSingleton = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate,^{
        sharedNetworkSingleton = [[self alloc] init];
    });
    return sharedNetworkSingleton;
}
-(AFHTTPSessionManager *)baseHtppRequest{
    AFHTTPSessionManager *serializer = [AFHTTPSessionManager manager];
    return serializer;
}

-(void)getResultWithParameter:(NSMutableDictionary *)parameter url:(NSString *)url successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock{
    
    AFHTTPSessionManager *manager = [self baseHtppRequest];
    NSString *urlStr = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    urlStr = [[NSMutableString stringWithString:IP] stringByAppendingFormat:@"%@",url];
    
    [manager GET:urlStr parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"GetJson:%@",responseObject);
        successBlock(responseObject);
        [SVProgressHUD dismiss];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSString *errorStr = [error.userInfo objectForKey:@"NSLocalizedDescription"];
#if DEBUG
        [FNTipsView showTips:errorStr];
#else
        failureBlock(errorStr);
#endif
        [SVProgressHUD dismiss];
    }];
}

-(void)postResultWithParameter:(NSMutableDictionary *)parameter url:(NSString *)url successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock{
    
    AFHTTPSessionManager *manager = [self baseHtppRequest];
    manager.responseSerializer = [AFJSONResponseSerializer new];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    NSString *urlStr = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    urlStr = [[NSMutableString stringWithString:IP] stringByAppendingFormat:@"%@",url];
    [manager POST:urlStr parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"PostJson:%@",responseObject);
        successBlock(responseObject);
        [SVProgressHUD dismiss];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSString *errorStr = [error.userInfo objectForKey:@"NSLocalizedDescription"];
#if DEBUG
        [FNTipsView showTips:errorStr];
#else
        failureBlock(errorStr);
#endif
        [SVProgressHUD dismiss];
    }];
    
}

-(void)upImageWithParameter:(NSMutableDictionary *)parameter imageArray:(NSArray *)images url:(NSString *)url successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock{
    AFHTTPSessionManager *manager = [self baseHtppRequest];
    NSString *urlStr=[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [manager POST:urlStr parameters:parameter constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (int i=1; i<=images.count; i++) {
            
            NSData *imageData=UIImageJPEGRepresentation(images[i-1], 0.1);
            
            [formData appendPartWithFileData:imageData name:[NSString stringWithFormat:@"image%d",i] fileName:@"image" mimeType:@"image/jpg"];
        }
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSString *errorStr = [error.userInfo objectForKey:@"NSLocalizedDescription"];
        failureBlock(errorStr);
    }];
}

+ (void)cancelAllRequest {
    [SVProgressHUD dismiss];
    [[AFHTTPSessionManager manager].operationQueue cancelAllOperations];
}

@end
