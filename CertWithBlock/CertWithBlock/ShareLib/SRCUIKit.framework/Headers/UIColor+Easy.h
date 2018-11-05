//
//  UIColor+Easy.h
//  SRCUIKit
//
//  Created by 史瑞昌 on 2018/9/18.
//  Copyright © 2018年 史瑞昌. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIColor (Easy)

/**
 *  根据字符串获取uicolor
 *
 */
+(UIColor *)colorWithHex:(NSString *)hex;

/**
 *  根据字符串获取uicolor 带透明的
 *
 */
+(UIColor *)colorWithHex:(NSString *)hex alpha:(CGFloat) alpha;



/**
 *  获取红色通道的值
 *
 */
-(CGFloat)getRed;

/**
 *  获取蓝色通道的值
 *
 */
-(CGFloat)getBlue;

/**
 *  获取绿色通道的值
 *
 */
-(CGFloat)getGreen;

/**
 *  获取透明通道的值
 *
 */
-(CGFloat)getAlpha;

@end


