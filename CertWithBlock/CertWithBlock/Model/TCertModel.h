//
//  TCertModel.h
//  CertWithBlock
//
//  Created by 史瑞昌 on 2018/11/9.
//  Copyright © 2018 史瑞昌. All rights reserved.
//

#import <SRCFoundation/SRCFoundation.h>
#import "GetCert.h"
NS_ASSUME_NONNULL_BEGIN

@interface TCertModel : BaseModel
@property(nonatomic,strong)GetCert *data;
@end

NS_ASSUME_NONNULL_END
