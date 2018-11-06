//
//  BaseViewController.m
//  CertWithBlock
//
//  Created by 史瑞昌 on 2018/11/5.
//  Copyright © 2018 史瑞昌. All rights reserved.
//

#import "BaseViewController.h"
#import <SRCUIKit/SRCUIKit.h>
#import "NavBarView.h"

@interface BaseViewController ()

@property(nonatomic,strong)SRCNavgationBarWithSearchAndCamera *navBar;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self setNavBarSytle];
}

-(void)setNavBarSytle
{
    UIView *navBar=[[NavBarView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, NavHeight)];
    [self.navigationController.view addSubview:navBar];
}

@end
