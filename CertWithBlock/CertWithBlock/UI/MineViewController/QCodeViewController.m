//
//  QCodeViewController.m
//  CertWithBlock
//
//  Created by 史瑞昌 on 2018/11/6.
//  Copyright © 2018 史瑞昌. All rights reserved.
//
#define ISLOGIN     @"IS_LOGIN"
#define APPADDRESS     @"APPADDRESS"
#define USERID     @"USERID"
#define USERNAME     @"USERNAME"
#define USERPWD     @"USERPWD"
#define USERIMAGE     @"USERIMAGE"



#import "QCodeViewController.h"
#import <CoreImage/CoreImage.h>
#import <SRCUIKit/SRCUIKit.h>

@interface QCodeViewController ()

@end

@implementation QCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UILabel *label=[[UILabel alloc] initWithFrame:
                    CGRectMake(20, NavHeight +10, (VIEW_WIDTH-20)/2, 50)];
    label.text=@"证件的二维码";
    [self.view addSubview:label];
    
    NSUserDefaults *userDefault=[NSUserDefaults standardUserDefaults];
    NSString *userid=[userDefault objectForKey:USERID];
    NSString *userpwd=[userDefault objectForKey:USERPWD];

    //构造字符串
    NSString *str=[NSString stringWithFormat:@"http://192.168.137.138:8080/demo/AppPassport/getCert?id=%@&address=0x920d73cc325c68843f8d4bdb49d3e80a649104c2&rightname=%@&pwd=%@",userid,self.cert,userpwd];
    UIImage *image=[self creatCIQRCodeImageWithNSString:str];
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake((VIEW_WIDTH-200)/2, (VIEW_HEIGHT-NavHeight-64-200)/2, 200, 200)];
    imageView.image=image;
    [self.view addSubview:imageView];

}

/**
 *  生成二维码
 */
- (UIImage *)creatCIQRCodeImageWithNSString:(NSString *)string
{
    // 1.创建过滤器，这里的@"CIQRCodeGenerator"是固定的
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];

    // 2.恢复默认设置
    [filter setDefaults];

    // 3. 给过滤器添加数据
    NSString *dataString = string;
    NSData *data = [dataString dataUsingEncoding:NSUTF8StringEncoding];
    // 注意，这里的value必须是NSData类型
    [filter setValue:data forKeyPath:@"inputMessage"];

    // 4. 生成二维码
    CIImage *outputImage = [filter outputImage];

    return [self creatNonInterpolatedUIImageFormCIImage:outputImage withSize:200];
}


/**
 *  根据CIImage生成指定大小的UIImage
 *
 *  @param image CIImage
 *  @param size  图片宽度
 *
 *  @return 生成高清的UIImage
 */
- (UIImage *)creatNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat)size
{
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));

    // 1. 创建bitmap
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);

    // 2.保存bitmap图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
}

@end
