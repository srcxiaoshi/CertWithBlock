//
//  GetCert.h
//  CertWithBlock
//
//  Created by 史瑞昌 on 2018/11/8.
//  Copyright © 2018 史瑞昌. All rights reserved.
//

#import <SRCFoundation/SRCFoundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GetCert : BaseModel

@property(nonatomic,strong)NSString *id;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *company;
@property(nonatomic,strong)NSString *img;

@end

NS_ASSUME_NONNULL_END
