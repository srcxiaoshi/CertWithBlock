//
//  SRCTableView.h
//  SRCUIKit
//
//  Created by 史瑞昌 on 2018/9/26.
//  Copyright © 2018年 史瑞昌. All rights reserved.
//

#import <UIKit/UIKit.h>


#define SRC_TABLEVIEW_REFRESH_HEIGHT    64

#define SRC_TABLEVIEW_REFRESH_FOOTER_HEIGHT    49

#define SRC_TABLEVIEW_REFRESH_IMAGE_HEIGHT_WIDTH    30
/**
 *  定义几个状态
 */
typedef NS_ENUM(NSInteger, SRCTabelViewRefreshStatus) {
    SRCTabelViewRefreshStatusHeaderRefreshing     = 0,
    SRCTabelViewRefreshStatusHeaderEnd = 1,
    SRCTabelViewRefreshStatusFooterRefreshing     = 2,
    SRCTabelViewRefreshStatusFooterEnd = 3,
};


//cell 样式定义标识 用于扩展
static NSString * const SRCTableViewCellDefaultID=@"SRCTableViewCellDefaultID";






@class SRCTableView;

@protocol SRCTableViewDelegate<NSObject>
@required

/**
 * section 数目
 */
- (NSInteger)numberOfSectionsInSRCTableView:(UITableView *)tableView;

/**
 * cell数目
 */
- (NSInteger)SRCTableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

/**
 * cell样式
 */
- (UITableViewCell *)SRCTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

/**
 * cell点击事件
 */
- (void)SRCTableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

/**
 * cell高度
 */
-(CGFloat)SRCTableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;


@end

@interface SRCTableView : UIView

@property(nonatomic,weak)id<SRCTableViewDelegate> delegate;


@property(nonatomic,strong)UIView *customHeaderView;
@property(nonatomic,strong)UIView *customFooterView;

/**
 *  重新加载数据，刷新
 *
 */
-(void)reloadData;

/**
 *  添加 header 事件
 *
 */
-(void)addHeaderWithTarget:(id)target action:(SEL)selector;

/**
 *  开始执行 header 事件
 *
 */
-(void)beginHeaderRefresh;

/**
 *  结束执行 header 事件
 *
 */
-(void)endHeaderRefresh;

/**
 *  添加 footer 事件
 *
 */
-(void)addFooterWithTarget:(id)target action:(SEL)selector;

/**
 *  开始执行 footer 事件
 *
 */
-(void)beginFooterRefresh;

/**
 *  结束执行 footer 事件
 *
 */
-(void)endFooterRefresh;

@end
