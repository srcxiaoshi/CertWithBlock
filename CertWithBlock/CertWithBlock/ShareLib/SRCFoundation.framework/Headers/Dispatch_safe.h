//
//  Dispatch_safe.h
//  SRCFoundation
//
//  Created by 史瑞昌 on 2018/9/28.
//  Copyright © 2018年 史瑞昌. All rights reserved.
//

#ifndef Dispatch_safe_h
#define Dispatch_safe_h

//学习于sdwebimage 解决问题:若在mainthread 中使用dispatch_async 有可能会crash
#ifndef dispatch_main_async_safe
#define dispatch_main_async_safe(block)\
if (strcmp(dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL), dispatch_queue_get_label(dispatch_get_main_queue())) == 0) {\
block();\
} else {\
dispatch_async(dispatch_get_main_queue(), block);\
}
#endif

//学习于sdwebimage 解决问题:若在mainthread 中使用dispatch_sync 有可能会crash
#ifndef dispatch_main_sync_safe
#define dispatch_main_sync_safe(block)\
if (strcmp(dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL), dispatch_queue_get_label(dispatch_get_main_queue())) == 0) {\
block();\
} else {\
dispatch_sync(dispatch_get_main_queue(), block);\
}
#endif

//原来的定义
/**
 //主线程同步队列
 #define dispatch_main_sync_safe(block)\
 if ([NSThread isMainThread]) {\
 block();\
 } else {\
 dispatch_sync(dispatch_get_main_queue(), block);\
 }
 //主线程异步队列
 #define dispatch_main_async_safe(block)\
 if ([NSThread isMainThread]) {\
 block();\
 } else {\
 dispatch_async(dispatch_get_main_queue(), block);\
 }
 //用法
 dispatch_main_async_safe(^{
 //需要执行的代码片段;
 });
*/

#endif /* Dispatch_safe_h */
