//
//  UIImage+Color.h
//  SRCUIKit
//
//  Created by 史瑞昌 on 2018/9/14.
//  Copyright © 2018年 史瑞昌. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)
/**
 *  根据颜色获取image
 *
 */
+(UIImage *)imageWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

@end
