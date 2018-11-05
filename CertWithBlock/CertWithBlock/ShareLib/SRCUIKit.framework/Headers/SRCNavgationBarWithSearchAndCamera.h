//
//  NavgationBarWithSearchAndCamera.h
//  SRCUIKit
//
//  Created by 史瑞昌 on 2018/9/15.
//  Copyright © 2018年 史瑞昌. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SRCNavgationBarWithSearchAndCamera : UIView

/**
 *  用来初始化和回调的方法
 *
 */
-(instancetype)initWithTextFieldBlock:(void(^)(UITextField *textField))searchTextFeildBlock imagePressBlock:(void(^)(void))imagePressBlock;

/**
 *  用于更新text
 *
 */
-(void)updateText:(NSString *)text;

@end
