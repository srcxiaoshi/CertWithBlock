//
//  NSMutableArray+Safe.h
//  NSFoundation
//
//  Created by 史瑞昌 on 2018/8/29.
//  Copyright © 2018年 史瑞昌. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Safe)
-(void)safe_addObject:(id)anObject;
-(void)safe_insertObject:(id)anObject atIndex:(NSUInteger)index;

-(void)safe_removeObject:(id)anObject;
-(void)safe_removeObjectAtIndex:(NSUInteger)index;

-(id)safe_objectAtIndex:(NSUInteger)index;
@end
