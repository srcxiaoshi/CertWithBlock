//
//  NSString+URL.h
//  SRCFoundation
//  处理与url相关的
//  Created by 史瑞昌 on 2018/9/1.
//  Copyright © 2018年 史瑞昌. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (URL)

//从url字符串里面获取host
-(NSString *)URL_hostFromURLString;

//从url字符串里面获取参数
-(NSDictionary *)URL_paramsFromURLString;

//从url字符串里面获取文件名字和后缀
-(NSString *)URL_fileNameFromURLString;


@end
