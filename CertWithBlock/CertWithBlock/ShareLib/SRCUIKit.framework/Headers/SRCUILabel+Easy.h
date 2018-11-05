//
//  SRCUILabel+Easy.h
//  SRCUIKit
//
//  返回 SRCUILabel
//  Created by 史瑞昌 on 2018/9/29.
//  Copyright © 2018年 史瑞昌. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SRCUILabel.h"


@interface SRCUILabel (Easy)

+(SRCUILabel *)easy_UILabel:(CGRect)frame fontSize:(CGFloat)fontSize textColor:(UIColor *)color;

+(SRCUILabel *)easy_UILabel:(CGFloat)fontSize textColor:(UIColor *)color;

@end
