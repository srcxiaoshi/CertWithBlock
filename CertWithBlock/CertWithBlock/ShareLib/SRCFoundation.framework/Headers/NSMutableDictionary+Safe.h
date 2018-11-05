//
//  NSMutableDictionary+Safe.h
//  SRCFoundation
//
//  Created by 史瑞昌 on 2018/8/31.
//  Copyright © 2018年 史瑞昌. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (Safe)

-(void)safe_setObject:(id)anObject forKey:(id<NSCopying>)aKey;

-(void)safe_removeObjectForKey:(id<NSCopying>)aKey;

@end
