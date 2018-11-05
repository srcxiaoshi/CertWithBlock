//
//  UIDevice+Hardware.h
//  SRCFoundation
//
//  Created by 史瑞昌 on 2018/9/10.
//  Copyright © 2018年 史瑞昌. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^SRCUIDeviceHardwareResolutionRatio)(float big,float little);


@interface UIDevice (Hardware)
/**
 * cpu频率
 *
 */
+(NSUInteger)cpuFrequency;

/**
 * bus频率
 *
 */
+(NSUInteger)busFrequency;

/**
 * cpu核数
 *
 */
+(NSUInteger)cpuCount;

/**
 * 内存 总数
 *
 */
+(NSUInteger)totalMemory;

/**
 * 内存 可使用
 *
 */
+(NSUInteger)userMemory;

/**
 * 硬盘空间 总数
 *
 */
+(NSNumber *)totalDiskSpace;

/**
 * 硬盘空间 剩余
 *
 */
+(NSNumber *)freeDiskSpace;

/**
 * mac 地址
 *
 */
+(NSString *)macaddress;

/**
 * 是不是Retina屏幕 scale>1
 *
 */
+(BOOL)hasRetinaDisplay;

/**
 * 分辨率 width*height
 *
 */
+(void)resolutionRatio:(SRCUIDeviceHardwareResolutionRatio) info;

@end
