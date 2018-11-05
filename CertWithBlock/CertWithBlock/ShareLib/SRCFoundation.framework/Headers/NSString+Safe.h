//
//  NSString+Safe.h
//  SRCFoundation
//
//  Created by 史瑞昌 on 2018/8/31.
//  Copyright © 2018年 史瑞昌. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Safe)

-(NSString *)safe_trim;

+(BOOL)safe_isEmpty:(NSString *)str;

+(BOOL)safe_isNotEmpty:(NSString *)str;

-(NSString *)safe_substringFromIndex:(NSUInteger)from;

-(NSString *)safe_substringToIndex:(NSUInteger)to;

-(NSString *)safe_substringWithRange:(NSRange)range;

-(NSString *)safe_stringByAppendingString:(NSString *)aString;

-(NSRange)safe_rangeOfString:(NSString *)searchString options:(NSStringCompareOptions)mask;



@end
