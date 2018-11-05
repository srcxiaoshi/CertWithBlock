//
//  UIImage+WebP.h
//  SRCUIKit
//
//  Created by 史瑞昌 on 2018/9/28.
//  Copyright © 2018年 史瑞昌. All rights reserved.
//

#import <UIKit/UIKit.h>

// 下面是copy from sd Fix for issue #416 Undefined symbols for architecture armv7 since WebP introduction when deploying to device
void WebPInitPremultiplyNEON(void);

void WebPInitUpsamplersNEON(void);

void VP8DspInitNEON(void);

@interface UIImage (WebP)

/**
 * 从NSData解码Image
 */
+ (UIImage *)SRCImageFromImageData:(NSData *)data;

@end
