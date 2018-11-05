//
//  NSMutableString+Safe.h
//  SRCFoundation
//
//  Created by 史瑞昌 on 2018/8/31.
//  Copyright © 2018年 史瑞昌. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableString (Safe)

-(void)safe_appendString:(NSString *)aString;

-(void)safe_insertString:(NSString *)aString atIndex:(NSUInteger)loc;

-(void)safe_deleteCharactersInRange:(NSRange)range;



@end
