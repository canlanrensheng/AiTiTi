//
//  ATBottomViewTool.m
//  AiTiTi
//
//  Created by LA on 2018/5/29.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATBottomViewTool.h"

@implementation ATBottomViewTool

+ (ATBottomViewTool *)setUpBottomViewTool {
    ATBottomViewTool *toolView = [ATBottomViewTool viewFromXib];
    return toolView;
}

@end
