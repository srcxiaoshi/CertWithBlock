//
//  SRCNavViewController.h
//  这里做一下封装优化
//  充分利用push 动画的时间 ，使页面在进入的时候，同时进行类似push 动画，这样可以充分减少页面的加载速度
//  (不包括网络请求时间，网络的请求的时间我们这边不好控制）
//  Created by 史瑞昌 on 2018/9/14.
//  Copyright © 2018年 史瑞昌. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SRCNavViewController : UINavigationController

@end
