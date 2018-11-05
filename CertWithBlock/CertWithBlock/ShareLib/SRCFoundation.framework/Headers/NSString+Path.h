//
//  NSString+Path.h
//  SRCFoundation
//  主要是处理了path到nsstring，获取相应的path
//  Created by 史瑞昌 on 2018/9/1.
//  Copyright © 2018年 史瑞昌. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Path)

+ (NSString *)HomePath;

+ (NSString *)TempPath;

+ (NSString *)DocPath;

+ (NSString *)LibPath;

+ (NSString *)AppPath;

+ (BOOL)RemovePath:(NSString *)path;





@end
