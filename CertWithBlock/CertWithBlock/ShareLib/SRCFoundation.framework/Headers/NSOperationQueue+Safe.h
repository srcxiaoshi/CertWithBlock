//
//  NSOperationQueue+Safe.h
//  SRCFoundation
//
//  Created by 史瑞昌 on 2018/9/6.
//  Copyright © 2018年 史瑞昌. All rights reserved.
//

#import <Foundation/Foundation.h>

//operation去重
@interface NSOperationQueue (Safe)

-(void)safe_addOperation:(NSOperation *)op;

@end
