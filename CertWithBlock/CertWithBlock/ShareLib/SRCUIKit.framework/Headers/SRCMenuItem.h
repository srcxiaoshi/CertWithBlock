//
//  SRCMenuItem.h
//  SRCUIKit
//
//  Created by 史瑞昌 on 2018/9/17.
//  Copyright © 2018年 史瑞昌. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SRCMenuItem : UILabel

/**
 *  Normal状态的字体大小，默认大小为15
 *
 */
@property (nonatomic, assign)CGFloat normalSize;

/**
 *  Selected状态的字体大小，默认大小为18
 *
 */
@property (nonatomic, assign)CGFloat selectedSize;

/**
 *  Normal状态的字体颜色，默认为黑色
 *
 */
@property (nonatomic, strong)UIColor *normalColor;

/**
 *  Selected状态的字体颜色，默认为红色
 *
 */
@property (nonatomic, strong)UIColor *selectedColor;

/**
 *  isSelected 状态 默认NO 只读
 *
 */
@property (nonatomic,assign,readonly)BOOL isSelected;

/**
 *  设置动画比例，selectTime:1-rate,or else; 在0-1之间 非0-1之间，会被设置成0/1
 *
 */
@property (nonatomic, assign) CGFloat rate;

/**
 *  默认 15，越小越快, 必须大于0 小于0以后，会重置为15，这个是动画执行的步数
 *
 */
@property (nonatomic, assign) CGFloat speedFactor;


/**
 *  初始化事件，使用block
 *
 */
-(instancetype)initWithFrame:(CGRect)frame selectBlock:(void(^)(SRCMenuItem *item)) block;

/**
 *  更新状态，设置是否被选中，选中过程是否执行动画
 *
 */
-(void)setSelected:(BOOL)selected withAnimation:(BOOL)animation;

@end
