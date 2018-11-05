//
//  SRCPageLayout.h
//  SRCUIKit
//
//  Created by 史瑞昌 on 2018/9/25.
//  Copyright © 2018年 史瑞昌. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SRCPageLayout : UICollectionViewFlowLayout


/**
 * 初始化方法
 */
-(instancetype)initWithPageIndexBlock:(void(^)(NSInteger pageIndex)) block;


@end
