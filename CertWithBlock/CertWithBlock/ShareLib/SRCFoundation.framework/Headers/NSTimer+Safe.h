//
//  NSTimer+Safe.h
//  SRCFoundation
//
//  Created by 史瑞昌 on 2018/9/5.
//  Copyright © 2018年 史瑞昌. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (Safe)

//这里target为nil的时候，会crash
+(NSTimer *)safe_scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo repeats:(BOOL)yesOrNo;



@end
