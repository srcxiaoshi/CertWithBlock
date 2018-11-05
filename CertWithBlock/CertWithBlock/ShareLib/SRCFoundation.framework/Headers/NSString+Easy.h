//
//  NSString+Easy.h
//  SRCFoundation
//
//  Created by 史瑞昌 on 2018/8/31.
//  Copyright © 2018年 史瑞昌. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface NSString (Easy)

//比较
- (BOOL)easy_stringCompare:(NSString*)str;

//返回string占用空间
- (CGSize)easy_sizeWithFont:(UIFont *)font;

- (CGSize)easy_sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode;

- (CGSize)easy_sizeWithFont:(UIFont *)font forWidth:(CGFloat)width lineBreakMode:(NSLineBreakMode)lineBreakMode;

- (CGSize)easy_sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;

//获取app名字
+(NSString *)easy_appName;
//获取app版本
+(NSString *)easy_appVersion;
//获取app build版本
+(NSString *)easy_appBuild;


//获取 当前时间 格式为：2018/09/01 12:00:00
+(NSString *)easy_normalDate;


//与html相关
-(NSString *)easy_replaceHtmlSymbol;



@end
