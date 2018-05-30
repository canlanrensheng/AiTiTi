//
//  BaseCollectionViewCellProtocol.h
//  BM
//
//  Created by txooo on 17/3/1.
//  Copyright © 2017年 张金山. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BaseCollectionViewCellProtocol <NSObject>

@optional

- (void)tx_bindViewModel;

- (void)tx_loadData;

- (void)tx_configSubViews;

@end
