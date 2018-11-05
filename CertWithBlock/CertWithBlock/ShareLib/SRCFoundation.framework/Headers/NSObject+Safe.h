//
//  NSObject+Safe.h
//  SRCFoundation
//
//  Created by 史瑞昌 on 2018/9/6.
//  Copyright © 2018年 史瑞昌. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Safe)


//kvo删除为监听，这里做了判空、try处理，try不成功的话，会抛出异常
-(void)safe_removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath;



@end
