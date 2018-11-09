//
//  User.h
//  CertWithBlock
//
//  Created by 史瑞昌 on 2018/11/7.
//  Copyright © 2018 史瑞昌. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SRCFoundation/SRCFoundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface User : BaseModel
@property(nonatomic,strong)NSString *id;
@property(nonatomic,strong)NSString *pwd;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *phone;
@property(nonatomic,strong)NSString *length;

@property(nonatomic,copy)NSArray *certificates;//arr
@property(nonatomic,copy)NSDictionary *rights;//dict


@end

NS_ASSUME_NONNULL_END
