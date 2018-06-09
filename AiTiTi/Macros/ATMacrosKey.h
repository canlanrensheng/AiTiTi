//
//  ATMacrosKey.h
//  AiTiTi
//
//  Created by 云辉 on 2018/3/30.
//  Copyright © 2018年 云辉. All rights reserved.
//

#ifndef ATMacrosKey_h
#define ATMacrosKey_h

#define QQAppid @"101116773"
#define QQAppSecret @"ca7a4545948338baab401f3de6bbf744"

#define WeChatAppid @"wx02a3823ab237817f"
#define WeChatAppSecret @"6f2c96898b51228dd547b9584b276e09"

#define UmengAppKey @"5677a6f967e58ea64b004229"

//用户ID
#define userID @"userid"
#define GetUserID  [[NSUserDefaults standardUserDefaults] valueForKey:userID]?[[NSUserDefaults standardUserDefaults] valueForKey:userID]:@""

#define userguID @"userguid"
#define GetUserGuID  [[NSUserDefaults standardUserDefaults] valueForKey:userguid]?[[NSUserDefaults standardUserDefaults] valueForKey:userguid]:@""

#endif /* ATMacrosKey_h */
