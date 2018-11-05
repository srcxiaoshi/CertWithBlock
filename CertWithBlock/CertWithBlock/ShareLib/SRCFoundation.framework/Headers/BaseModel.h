//
//  BaseModel.h
//  NSFoundation
//
//  Created by 史瑞昌 on 2018/9/10.
//  Copyright © 2018年 史瑞昌. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface BaseModel : JSONModel

@property(nonatomic,copy)NSString <Optional>* message;


-(instancetype)safe_initWithString:(NSString *)string;

@end
