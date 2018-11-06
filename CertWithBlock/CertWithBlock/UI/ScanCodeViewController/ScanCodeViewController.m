//
//  ScanCodeViewController.m
//  CertWithBlock
//
//  Created by 史瑞昌 on 2018/11/5.
//  Copyright © 2018 史瑞昌. All rights reserved.
//

#import "ScanCodeViewController.h"
#import <SRCUIKit/SRCUIKit.h>
#import "CameraViewController.h"


@interface ScanCodeViewController ()

@end

@implementation ScanCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //扫一扫
    //添加一个按钮
    UILabel *btn=[[UILabel alloc] initWithFrame:CGRectMake((VIEW_WIDTH-100)/2, (VIEW_HEIGHT-NavHeight-100-self.tabBarController.tabBar.frame.size.height)/2, 100, 100)];
    UITapGestureRecognizer *gest=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pressBtn)];
    btn.userInteractionEnabled=YES;
    btn.text=@"扫一扫";
    btn.textAlignment=NSTextAlignmentCenter;
    [btn addGestureRecognizer:gest];
    [self.view addSubview:btn];
    
}

-(void)pressBtn
{
    CameraViewController *vc=[CameraViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
