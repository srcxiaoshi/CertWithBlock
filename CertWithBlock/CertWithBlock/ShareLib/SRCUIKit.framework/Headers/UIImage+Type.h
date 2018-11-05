//
//  UIImage+Type.h
//  SRCUIKit
//
//  Created by 史瑞昌 on 2018/9/28.
//  Copyright © 2018年 史瑞昌. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SRCImageType) {
    SRCImageTypeJPEG          = -1,
    SRCImageTypePNG     = 0,
    SRCImageTypeGIF = 1,
    SRCImageTypeTIFF = 2,
    SRCImageTypeWEBP = 3,
    SRCImageTypeUnkown = 4,
};

@interface UIImage (Type)

+(SRCImageType)SRCImageTypeFromImageData:(NSData *)data;

@end
