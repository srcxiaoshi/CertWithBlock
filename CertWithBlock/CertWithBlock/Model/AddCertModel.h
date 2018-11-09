//
//  AddCertModel.h
//  CertWithBlock
//
//  Created by 史瑞昌 on 2018/11/8.
//  Copyright © 2018 史瑞昌. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SRCFoundation/SRCFoundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface AddCertModel : BaseModel

@property(nonatomic,strong)NSString *address;
@property(nonatomic,strong)NSString *id;
@property(nonatomic,strong)NSString *pwd;
@property(nonatomic,strong)NSString *rightname;

@property(nonatomic,strong)NSString *certid;
@property(nonatomic,strong)NSString *certtname;

@property(nonatomic,strong)NSString *img;
@property(nonatomic,strong)NSString *certcompany;

@end

NS_ASSUME_NONNULL_END
