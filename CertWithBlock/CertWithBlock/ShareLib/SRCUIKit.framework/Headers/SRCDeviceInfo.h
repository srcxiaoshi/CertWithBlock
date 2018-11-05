//
//  SRCDeviceInfo.h
//  SRCFoundation
//
//  Created by 史瑞昌 on 2018/9/15.
//  Copyright © 2018年 史瑞昌. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    iPhoneDeviceTypeIPhone4,
    iPhoneDeviceTypeIPhone4S=iPhoneDeviceTypeIPhone4,
    iPhoneDeviceTypeIPhone5,
    iPhoneDeviceTypeIPhone5S=iPhoneDeviceTypeIPhone5,
    iPhoneDeviceTypeIPhone5C=iPhoneDeviceTypeIPhone5,
    iPhoneDeviceTypeIPhoneSE=iPhoneDeviceTypeIPhone5,
    iPhoneDeviceTypeIPhone6,
    iPhoneDeviceTypeIPhone6S=iPhoneDeviceTypeIPhone6,
    iPhoneDeviceTypeIPhone7=iPhoneDeviceTypeIPhone6,
    iPhoneDeviceTypeIPhone8=iPhoneDeviceTypeIPhone6,
    iPhoneDeviceTypeIPhone6P,
    iPhoneDeviceTypeIPhone6SP=iPhoneDeviceTypeIPhone6P,
    iPhoneDeviceTypeIPhone7P=iPhoneDeviceTypeIPhone6P,
    iPhoneDeviceTypeIPhone8P=iPhoneDeviceTypeIPhone6P,
    iPhoneDeviceTypeIPhoneX,
}iPhoneDeviceType;

extern iPhoneDeviceType global_deviceType;

//机型
#define IS_IPHONE_5OR_ABOVE   (global_deviceType>=iPhoneDeviceTypeIPhone5S)
#define IS_IPHONE_6P  (global_deviceType==iPhoneDeviceTypeIPhone6P)
#define IS_IPHONE_6OR_ABOVE   (global_deviceType>=iPhoneDeviceTypeIPhone6)
#define IS_IPHONE_6           (global_deviceType==iPhoneDeviceTypeIPhone6)
#define IS_IPHONE4_OR_4S          (global_deviceType==iPhoneDeviceTypeIPhone4)
#define IS_IPHONE_X          (global_deviceType==iPhoneDeviceTypeIPhoneX)

//适配
#define VALUE_FOR_UNIVERSE_DEVICE(a,b,c)   ((IS_IPHONE_6P)?(a):((IS_IPHONE_6)?(b):(c)))
#define VALUE_FOR_IPHONE_6(a,b)            ((IS_IPHONE_6)?(a):(b))
#define VALUE_FOR_IPHONE_6P(a,b)           ((IS_IPHONE_6P)?(a):(b))
#define VALUE_FOR_IPHONE4_OR_4S(a,b)           ((IS_IPHONE4_OR_4S)?(a):(b))
#define VALUE_FOR_IPHONE_X(a,b)            ((IS_IPHONE_X)?(a):(b))

#define VIEW_WIDTH   MIN([UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height)
#define VIEW_HEIGHT  MAX([UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height)

//iOS11之前导航栏默认高度为64pt(这里高度指statusBar + NavigationBar)
//iOS11之后如果设置了prefersLargeTitles = YES则为96pt，默认情况下还是64pt，但在iPhoneX上由于刘海的出现statusBar由以前的20pt变成了44pt，所以iPhoneX上高度变为88pt，如果项目里隐藏了导航栏加了自定义按钮之类的，这里需要注意适配一下。

#define NavHeight               VALUE_FOR_IPHONE_X((96),(64))


//一些UI
#define SRCMENUVIEW_WIDTH   52
#define SRCMENUVIEW_HEIGHT   36

#define SRCMENUVIEW_BTN_WIDTH   52
#define SRCMENUVIEW_BTN_HEIGHT   35

#define SRCITEM_WIDTH   60
#define SRCITEM_HEIGHT   35

@interface SRCDeviceInfo : NSObject

/**
 * 这个需要在appdelegate中调用，好早获取 global_deviceType
 *
 */
+(void)GloBalDeviceType;

@end
