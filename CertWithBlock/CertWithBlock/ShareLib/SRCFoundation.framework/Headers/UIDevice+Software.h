//
//  UIDevice+Software.h
//  SRCFoundation
//
//  Created by 史瑞昌 on 2018/9/10.
//  Copyright © 2018年 史瑞昌. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (Software)

/**
 * 获取设备名字
 *
 */
+ (NSString*)deviceName;

/**
 * 获取系统版本号
 *
 */
+ (NSString*)deviceSystemVersion;

/**
 * 获取设备标识码
 *
 */
+ (NSString*)deviceUUID;

/**
 * 获取设备型号 iphone ipad simulator
 *
 */
+ (NSString*)deviceModel;

/**
 * 获取Platform: iphone ipad simulator
 *
 */
+(NSString *)devicePlatform;

@end
