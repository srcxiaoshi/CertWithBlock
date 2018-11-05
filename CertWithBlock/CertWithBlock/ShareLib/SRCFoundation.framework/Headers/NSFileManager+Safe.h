//
//  NSFileManager+Safe.h
//  SRCFoundation
//
//  Created by 史瑞昌 on 2018/9/6.
//  Copyright © 2018年 史瑞昌. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (Safe)
/**
 * 返回一个C字符串表示一个给定的路径正确编码的Unicode字符串使用的文件系统
 *
 */
-(const char *)safe_fileSystemRepresentationWithPath:(NSString *)path;

@end
