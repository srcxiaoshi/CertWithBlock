//
//  SRCImageView.h
//  SRCUIKit
//
//  Created by 史瑞昌 on 2018/9/27.
//  Copyright © 2018年 史瑞昌. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SRCImageView : UIImageView



/**
 * 加载Image
 *  1、webImage的url
 **/
- (void)src_setImageWithURL:(NSURL *)url;

/**
 * 加载Image
 *  1、webImage的url 2、占位image
 **/
- (void)src_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder;

/**
 * 加载Image
 *  1、webImage的url 2、占位image 3、加载进度
 **/
- (void)src_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder  progress:(void(^)(CGFloat progress))progressBlock;


/**
 * 加载Image
 *  1、webImage的url 2、占位image 3、加载进度 4、下载完成后
 **/
- (void)src_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder  progress:(void(^)(CGFloat progress))progressBlock completed:(void(^)(void))completedBlock;



@end
