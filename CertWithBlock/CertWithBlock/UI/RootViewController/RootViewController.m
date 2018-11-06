//
//  RootViewController.m
//  CertWithBlock
//
//  Created by 史瑞昌 on 2018/11/5.
//  Copyright © 2018 史瑞昌. All rights reserved.
//

#import "RootViewController.h"

#import <SRCFoundation/SRCFoundation.h>

#import <SRCUIKit/SRCUIKit.h>

#import "ScanCodeViewController.h"
#import "MineViewController.h"


//这里好像还有一个红包页？？


#define TABBERBAR_GRAY_COLOR    [UIColor colorWithRed:0.31 green:0.31 blue:0.31 alpha:1.0f]
#define MIAN_RED_COLOR     [UIColor colorWithRed:1.0 green:0.1 blue:0.1 alpha:1]
#define TAB_BAR_TINT_COLOR      [UIColor colorWithRed:0.95f green:0.95f blue:0.95f alpha:1.00f]




#define TAB_VIEW_CONTROLLER_CHANGE      @"tab_view_controller_change"
#define APP_SETTING_CONFIG     @"tt_app_setting_config"
#define IS_LOGIN      @"is_login"


@interface RootViewController ()




@end

@implementation RootViewController

#pragma overload init
-(instancetype)init
{
    self=[super init];
    if(self)
    {
        //初始化TabBar
        [[UITabBar appearance] setTranslucent:NO];
        [UITabBar appearance].barTintColor = TAB_BAR_TINT_COLOR;

        //normal
        UITabBarItem * item = [UITabBarItem appearance];
        item.titlePositionAdjustment = UIOffsetMake(0, -5);
        NSMutableDictionary * normalAtts = [NSMutableDictionary new];
        [normalAtts safe_setObject:[UIFont systemFontOfSize:10] forKey:NSFontAttributeName];
        [normalAtts safe_setObject:TABBERBAR_GRAY_COLOR forKey:NSForegroundColorAttributeName];
        [item setTitleTextAttributes:normalAtts forState:UIControlStateNormal];

        // selected
        NSMutableDictionary *selectAtts = [NSMutableDictionary new];
        [selectAtts safe_setObject:[UIFont systemFontOfSize:10] forKey:NSFontAttributeName];
        [selectAtts safe_setObject:MIAN_RED_COLOR forKey:NSForegroundColorAttributeName];
        [item setTitleTextAttributes:selectAtts forState:UIControlStateSelected];

        //添加一些通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tabBarChange:) name:TAB_VIEW_CONTROLLER_CHANGE object:nil];
    }
    return self;
}


//UI
- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    [self loadDefaultController];


}

//default UIController light
-(void)loadDefaultController
{
    //NSUserDefaults *userDefault=[NSUserDefaults standardUserDefaults];
    //BOOL isLogin=[userDefault objectForKey:IS_LOGIN];

    [self addViewController:[ScanCodeViewController class] title:@"首页" imageName:@"home_tabbar_32x32_" selectImageName:@"home_tabbar_press_32x32_"];
    NSString *mineTitle=@"我的";
    NSString *mineImageName=@"mine_tabbar_32x32_";
    NSString *selectImageName=@"mine_tabbar_press_32x32_";
    [self addViewController:[MineViewController class] title:mineTitle imageName:mineImageName selectImageName:selectImageName];
}


//使用Class 来减少代码数量
-(void)addViewController:(Class)class title:(NSString *)title imageName:(NSString *)imageName selectImageName:(NSString *)selectImageName
{
    if(class&&![NSString safe_isEmpty:title]&&![NSString safe_isEmpty:imageName]&&![NSString safe_isEmpty:selectImageName])
    {
        UIViewController *vc=[[class alloc] init];
        SRCNavViewController *navVC=[[SRCNavViewController alloc] initWithRootViewController:vc];
        //navVC.title=title;
        UIImage *image=[UIImage imageNamed:imageName];
        image=[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *selectImage=[UIImage imageNamed:selectImageName];
        selectImage=[selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        navVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:image selectedImage:selectImage];
        [self addChildViewController:navVC];
    }
    else
    {
        ERROR();
    }
}


//处理notification
-(void)tabBarChange:(NSNotification *)obj
{

}


//
-(void)dealloc
{
    //移除通知、代理
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    self.tabBarController.delegate=nil;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

