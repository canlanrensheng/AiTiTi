//
//  ATMacrosOther.h
//  AiTiTi
//
//  Created by 童城 on 2018/4/24.
//  Copyright © 2018年 云辉. All rights reserved.
//

#ifndef ATMacrosOther_h
#define ATMacrosOther_h


#ifdef DEBUG

#define ATLog(s, ...) NSLog(@"%s(%d): %@", __FUNCTION__, __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])

#else

#define ATLog(s, ...)

#endif

#endif /* ATMacrosOther_h */
