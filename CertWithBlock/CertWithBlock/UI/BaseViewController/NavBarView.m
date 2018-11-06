//
//  NavBarView.m
//  CertWithBlock
//
//  Created by 史瑞昌 on 2018/11/6.
//  Copyright © 2018 史瑞昌. All rights reserved.
//

#import "NavBarView.h"
#import <SRCUIKit/SRCUIKit.h>

#define SRC_NAV_BAR_BACKGROUND_COLOR    [UIColor colorWithRed:1.0 green:0.1 blue:0.1 alpha:1]



@implementation NavBarView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        self.backgroundColor=SRC_NAV_BAR_BACKGROUND_COLOR;
        return self;
    }
    else
    {
        ERROR();
        return nil;
    }
}

@end
