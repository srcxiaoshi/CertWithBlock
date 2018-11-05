//
//  SRCImageModel.h
//  SRCFoundation
//
//  Created by 史瑞昌 on 2018/9/30.
//  Copyright © 2018年 史瑞昌. All rights reserved.
//

#import <SRCFoundation/SRCFoundation.h>

@protocol ImageUrl;
@interface SRCImageModel:BaseModel
@property(nonatomic,copy)NSArray<ImageUrl> *url_list;
@property(nonatomic,assign)CGFloat height;
@property(nonatomic,assign)CGFloat width;
@property(nonatomic,strong)NSString * uri;
@property(nonatomic,strong)NSString * url;
@end

@interface ImageUrl:BaseModel
@property(nonatomic,strong)NSString *url;
@end
