//
//  AppInfo.h
//  SRCFoundation
//
//  Created by 史瑞昌 on 2018/9/11.
//  Copyright © 2018年 史瑞昌. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppInfo : NSObject
/**
 * APP 名字
 *
 */
+(NSString *)app_name;

/**
 * APP 版本
 *
 */
+(NSString *)app_version;

/**
 * APP build
 *
 */
+(NSString *)app_build;

@end
