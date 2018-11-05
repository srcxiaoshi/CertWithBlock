//
//  SRCUIKit.h
//  SRCUIKit
//
//  Created by 史瑞昌 on 2018/9/11.
//  Copyright © 2018年 史瑞昌. All rights reserved.
//
//TODO://note UIKit依赖于SRCFoundation ,所以需要先编译SRCFoundation，然后引用framework到uikit,用户使用的时候就不用再引用SRCFoundation
#import <UIKit/UIKit.h>

//! Project version number for SRCUIKit.
FOUNDATION_EXPORT double SRCUIKitVersionNumber;

//! Project version string for SRCUIKit.
FOUNDATION_EXPORT const unsigned char SRCUIKitVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <SRCUIKit/PublicHeader.h>

//ERROR
#import <SRCUIKit/Error.h>

//UIDevice
#import <SRCUIKit/SRCDeviceInfo.h>

//UIImage
#import <SRCUIKit/UIImage+Color.h>
#import <SRCUIKit/UIImage+WebP.h>
#import <SRCUIKit/UIImage+Type.h>

//UIImageView.
#import <SRCUIKit/SRCImageView.h>

//UILabel
#import <SRCUIKit/SRCUILabel+Easy.h>
#import <SRCUIKit/SRCUILabel.h>


//Navigationbar with search and image=camera
#import <SRCUIKit/SRCNavgationBarWithSearchAndCamera.h>
#import <SRCUIKit/SRCTextFieldWithSearch.h>

//Controller
#import <SRCUIKit/SRCNavViewController.h>
#import <SRCUIKit/SRCScanCodeViewController.h>


//Color
#import <SRCUIKit/UIColor+Easy.h>


//Menu
#import <SRCUIKit/SRCMenuItem.h>
#import <SRCUIKit/SRCMenuView.h>

//collectionview
#import <SRCUIKit/SRCPageView.h>
#import <SRCUIKit/SRCPageViewCell.h>
#import <SRCUIKit/SRCPageLayout.h>

//tableview
#import <SRCUIKit/SRCTableView.h>
#import <SRCUIKit/SRCBaseTableViewCell.h>






