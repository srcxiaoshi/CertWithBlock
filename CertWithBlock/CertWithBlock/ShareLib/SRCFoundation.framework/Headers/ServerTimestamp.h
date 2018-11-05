//
//  GetNetwork.h
//  SRCFoundation
//
//  Created by 史瑞昌 on 2018/9/10.
//  Copyright © 2018年 史瑞昌. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"

typedef void (^ServerTimestampBlock)(BOOL isSuccess,BaseModel *baseModel);

@interface ServerTimestamp : NSObject


/**
 * 获取时间戳
 *
 */
+(void)getServerTimestamp:(ServerTimestampBlock) block;

@end
