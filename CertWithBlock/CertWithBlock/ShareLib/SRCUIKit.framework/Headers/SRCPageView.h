//
//  SRCPageView.h
//  SRCUIKit
//  使用UICollectionView 来封装一个带动画的 水平切换的View,每个cell中包含一个tableView
//  Created by 史瑞昌 on 2018/9/21.
//  Copyright © 2018年 史瑞昌. All rights reserved.
//

#import <UIKit/UIKit.h>





@class SRCPageView;
@class SRCPageViewCell;
@protocol SRCPageViewDelegate<NSObject>

@required
/**
 * cell个数
 */
-(NSInteger)SRCPageViewNumberOfItems:(nonnull UICollectionView *)collectionView;

/**
 * cell样式与内容
 */
-(SRCPageViewCell *)SRCPageView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;



@optional
/**
 * 滑动停止后调用，返回pageIndex
 */
-(void)SRCPageView:(nonnull UICollectionView *)collectionView pageIndex:(NSInteger)pageIndex;

/**
 * 点击事件
 */
-(void)SRCPageView:(nonnull UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end



//样式标识
static NSString * const SRCPageViewCellDefaultID=@"SRCCollectionViewCellDeFault";



@interface SRCPageView : UIView

/**
 * delegate
 */
@property(nonatomic,weak)id <SRCPageViewDelegate> delegate;


/**
 * 刷新整个view的方法 所有的cell都会被重置,block是刷新完回调
 */
-(void)refreshViewWithCallBack:(void (^)(void)) block;


/**
 * 设置pageindex对应的page显示到中间去 animated 是否需要动画
 */
-(void)scollToItemWithPageIndex:(NSInteger)pageIndex animated:(BOOL) animated;

@end
