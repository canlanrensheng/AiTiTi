//
//  ATMainModel.m
//  AiTiTi
//
//  Created by 云辉 on 2018/4/3.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATMainModel.h"

@implementation ATMainModel
+(NSDictionary *)mj_objectClassInArray{
    return @{@"medal":[medalModel class],@"subjectvip":[subjectVipModel class]};
}
+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"user_id":@"id"};
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    
    unsigned int count = 0;
    
    Ivar *vars = class_copyIvarList([self class], &count);
    
    for (int i = 0; i < count; i++){
        const char *varName = ivar_getName(vars[i]);
        
        NSString *varNameStr = [[NSString alloc ] initWithCString:varName encoding:NSUTF8StringEncoding];
        
        id value = [self valueForKey:varNameStr];
        
        [aCoder encodeObject:value forKey:varNameStr];
    }
}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]){
        unsigned int count = 0;
        
        Ivar *vars = class_copyIvarList([self class], &count);
        
        for (int i = 0; i < count; i++){
            const char *varName = ivar_getName(vars[i]);
            NSString *varNameStr = [[NSString alloc] initWithCString:varName encoding:NSUTF8StringEncoding];
            
            id value = [aDecoder decodeObjectForKey:varNameStr];
            [self setValue:value forKey:varNameStr];
        }
    }
    return self;
}
+ (void)saveMine:(ATMainModel *)model{
    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:model] forKey:@"ATMainModel"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+ (ATMainModel *)mineInstance{
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"ATMainModel"];
    ATMainModel *model = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return model;
}

@end

@implementation medalModel

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"medal_id":@"id"};
}

@end

@implementation subjectVipModel

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"subject_id":@"id"};
}

@end
