//
//  SRCMenuView.h
//  SRCUIKit
//
//  Created by 史瑞昌 on 2018/9/18.
//  Copyright © 2018年 史瑞昌. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SRCMenuItem.h"

@class SRCMenuView;

/**
 *  datasource
 *
 */
@protocol SRCMenuViewDataSource<NSObject>
@required
/**
 *  item的number
 *
 */
- (NSInteger)numbersOfTitlesInMenuView:(SRCMenuView *)menu;

/**
 *  item的title
 *
 */
- (NSString *)menuView:(SRCMenuView *)menu titleAtIndex:(NSInteger)index;
@end



/**
 *  delegate
 *
 */
@protocol SRCMenuViewDelegate<NSObject>
@optional
/**
 *  点击事件
 *
 */
-(void)menuView:(SRCMenuItem *)item index:(NSInteger) index;
@end



@interface SRCMenuView : UIView

@property(nonatomic,weak)id<SRCMenuViewDataSource> datasource;

@property(nonatomic,weak)id<SRCMenuViewDelegate> delegate;

/**
 *  初始化方法
 *
 */
-(instancetype)initWithFrame:(CGRect)frame leftBtn:(BOOL) leftBtn rightBtn:(BOOL) rightBtn;

/**
 *  更新数据，并刷新
 *
 */
-(void)reloadDataAndUpdate;

/**
 *  设置成选中
 *
 */
-(void)setSelectedWithPageIndex:(NSInteger)pageIndex;

@end

