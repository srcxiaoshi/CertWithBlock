//
//  UserModel.h
//  CertWithBlock
//
//  Created by 史瑞昌 on 2018/11/7.
//  Copyright © 2018 史瑞昌. All rights reserved.
//

#import <SRCFoundation/SRCFoundation.h>
#import "User.h"


NS_ASSUME_NONNULL_BEGIN

@interface UserModel : BaseModel

@property(nonatomic,strong)NSString *code;
@property(nonatomic,strong)User *data;

@end

NS_ASSUME_NONNULL_END
