//
//  SRCBaseTableViewCell.h
//  SRCUIKit
//
//  Created by 史瑞昌 on 2018/9/29.
//  Copyright © 2018年 史瑞昌. All rights reserved.
//

#define BASE_CELL_EDGE   10

#define BASE_CELL_DELETE_BUTTON_WIDTH   15
#define BASE_CELL_DELETE_BUTTON_HEIGH   10.5

#define BASE_CELL_TITLE_FONT_SIZE   18
#define BASE_CELL_SOURCE_FONT_SIZE   11

#define BASE_CELL_TITLE_AND_SOURCE_EDGE   10

#define BASE_CELL_IMAGE_WIDTH   85.5
#define BASE_CELL_IMAGE_HEIGHT   48

#import <UIKit/UIKit.h>
/**
 *  样式说明，第一行 一个标题， 第二行 来源 评论 时间 叉号按钮
 *
 */
static NSString *const SRCBaseTableViewCellID=@"SRCBaseTableViewCellID";


@interface SRCBaseTableViewCell : UITableViewCell


@property(nonatomic,strong)UILabel *title;//标题

@property(nonatomic,strong)UILabel *info;//来源  评论数目  更新时间

@property(nonatomic,strong)UIImageView *deleteButton;//叉号按钮


@end
