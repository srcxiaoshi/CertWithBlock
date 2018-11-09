//
//  LoginViewController.m
//  CertWithBlock
//
//  Created by 史瑞昌 on 2018/11/6.
//  Copyright © 2018 史瑞昌. All rights reserved.
//


#define DEFAULT_BLUE [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0]
#define ISLOGIN     @"IS_LOGIN"
#define APPADDRESS     @"APPADDRESS"
#define USERID     @"USERID"
#define USERNAME     @"USERNAME"
#define USERPWD     @"USERPWD"
#define USERIMAGE     @"USERIMAGE"




#import "LoginViewController.h"
#import <SRCUIKit/SRCUIKit.h>
#import <SRCFoundation/SRCFoundation.h>
#import "THProgressView.h"
#import "UserModel.h"
#import "RegeistViewController.h"


@interface LoginViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

//创建控件
@property(nonatomic,strong) UIButton*login,*header;
@property(nonatomic,strong)UILabel *user,*password;
@property(nonatomic,strong) UITextField *usertext ,*passwordtext;


@property(nonatomic,strong) THProgressView *progressView;
@property(nonatomic,assign) CGFloat prograss;
@property(nonatomic,weak) NSTimer *timer;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *navBar=[[UIView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, NavHeight)];
    navBar.backgroundColor=[UIColor colorWithRed:1.0 green:0.1 blue:0.1 alpha:1];
    [self.view addSubview:navBar];
    //添加一个取消按钮
    UIButton *btn=[[UIButton alloc] initWithFrame:CGRectMake(20, navBar.frame.size.height-30-10, 60, 30)];
    [navBar addSubview:btn];
    [btn setTitle:@"取消" forState: UIControlStateNormal];
    [btn addTarget:self action:@selector(popVC) forControlEvents:UIControlEventTouchUpInside];

    //添加一个注册按钮
    UIButton *rebtn=[[UIButton alloc] initWithFrame:CGRectMake(VIEW_WIDTH-60-20, navBar.frame.size.height-30-10, 60, 30)];
    [navBar addSubview:rebtn];
    [rebtn setTitle:@"注册" forState: UIControlStateNormal];
    [rebtn addTarget:self action:@selector(regeistVC) forControlEvents:UIControlEventTouchUpInside];


    //构造login登录页面
    //账号输入框采用默认键盘，密码输入框采用数字键盘兵能密文显示，两个文本框都有文本输入时打印出来，否则弹出如图提醒框
    //登录按钮设置（背景图片、监听事件、）

    self.login =[[UIButton alloc]initWithFrame:CGRectMake((VIEW_WIDTH-200)/2, 400, 200, 150)];
    [self.login setImage:[UIImage imageNamed:@"login_btn_blue_nor.png"] forState:UIControlStateNormal];
    self.header =[[UIButton alloc]initWithFrame:CGRectMake((VIEW_WIDTH-80)/2, navBar.frame.size.height+50, 80, 80)];
    [self.header setBackgroundImage:[UIImage imageNamed:@"login_header.png"] forState:UIControlStateNormal ];
    //设置圆形半径
    self.header.layer.cornerRadius/*圆形半径*/=40;
    //切割（伪装）圆形半径外的部分（将按钮的一层边角伪装）

    self.header.layer.masksToBounds=YES;

    //添加点击事件 去访问系统相册
    //[self.header addTarget:self action:@selector(setUserImage)
          //forControlEvents:(UIControlEventTouchUpInside )];

    //添加登陆监听事件

    [self.login addTarget:self action:@selector(loginAction) forControlEvents:(UIControlEventTouchUpInside )];


    //标签设置（标签名称、标签位置与大小、标签标题（文本）、）
    self.user = [[UILabel alloc]initWithFrame:CGRectMake(40, self.header.frame.origin.y+self.header.frame.size.height+20, 80, 30)];
    self.user.text=@"用户名:";
    self.password = [[UILabel alloc]initWithFrame:CGRectMake(40, self.user.frame.origin.y+50, 80, 30)];
    self.password.text =@"密码:";
    //文本框设置（位置与大小、获取UITextField的文本，设置输入框键盘类型设置占位符 密文输入）
    self.usertext= [[UITextField alloc]initWithFrame:CGRectMake(110, self.header.frame.origin.y+self.header.frame.size.height+20, 200, 30)];
    //设置提示字
    self.usertext.placeholder=@"请输入账号";

    //设置键盘类型
    self.usertext.keyboardType = UIKeyboardTypeDefault;

    self.passwordtext=[[UITextField alloc]initWithFrame:CGRectMake(110, self.user.frame.origin.y+50, 200, 30)];
    self.passwordtext .placeholder=@"请输入密码";

    [self.passwordtext setSecureTextEntry:YES];
    //设置键盘
    self.passwordtext.keyboardType= UIKeyboardTypeNumberPad;


    self.passwordtext.enablesReturnKeyAutomatically=YES;
    [self.usertext becomeFirstResponder ];

    //添加到视图

    [self.view addSubview:self.login];
    [self.view addSubview:self.user];
    [self.view addSubview:self.password];
    [self.view addSubview:self.passwordtext];
    [self.view addSubview:self.usertext];
    [self.view addSubview:self.header];




}

-(void)pragressView
{
    if(!_progressView)
    {
        self.progressView = [[THProgressView alloc] initWithFrame:CGRectMake((VIEW_WIDTH-50)/2, (VIEW_HEIGHT-NavHeight-64-30)/2, 50, 15)];
        self.progressView.borderTintColor = [UIColor redColor];
        self.progressView.progressTintColor = [UIColor redColor];
        [self.view addSubview:self.progressView];
    }
}


- (void)updateProgress
{
    self.prograss += 0.20f;
    if (self.prograss > 1.0f) {
        [self.timer invalidate];
        self.prograss = 0;
        [self.progressView setHidden:YES];
    }
    if(self.progressView)
    {
        [self.progressView setProgress:self.prograss animated:YES];
    }
}

//登陆按钮事件

-(void)loginAction{

    NSString *userstring,*passtring;
    userstring = self.usertext.text;
    passtring = self.passwordtext.text;
    if (![userstring isEqualToString:@""]&&![passtring isEqualToString:@""]) {
        //转菊花
        [self pragressView];
        if(!self.timer)
        {
            self.timer=[NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(updateProgress) userInfo:nil repeats:YES];
        }
        [self.progressView setHidden:NO];
        [self.timer setFireDate:[NSDate date]];
        NSString *str=[NSString stringWithFormat:@"http://192.168.137.138:8080/demo/AppPassport/login?address=0x920d73cc325c68843f8d4bdb49d3e80a649104c2&id=%@&pwd=%@",userstring,passtring];
        //网络验证
        __weak typeof(self) weakself=self;
        [SRCNetworkWithAF requestGetMethodWithPath:str parameters:nil withProgress:nil success:^(BOOL isSuccess, NSString *response) {
            NSLog(@"%@",response);
            //存到userdata
            NSUserDefaults *userDefault=[NSUserDefaults standardUserDefaults];
            UserModel *model=[[UserModel alloc] safe_initWithString:response];
            if(![NSString safe_isEmpty:model.data.id])
            {
                [userDefault setObject:@"0x920d73cc325c68843f8d4bdb49d3e80a649104c2" forKey:APPADDRESS];
                [userDefault setObject:model.data.id forKey:USERID];
                [userDefault setObject:model.data.pwd forKey:USERPWD];
                [weakself.timer invalidate];
                weakself.prograss = 0;
                [weakself.progressView setHidden:YES];
                [self dismissViewControllerAnimated:YES completion:nil];
            }
            else
            {
                UIAlertController *alertControler =[UIAlertController alertControllerWithTitle:@"提醒" message:@"登录失败" preferredStyle: UIAlertControllerStyleAlert];
                [self presentViewController:alertControler animated:YES completion:nil];

                UIAlertAction *cancerAlertion=[UIAlertAction actionWithTitle:@"取消" style:  UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {

                }];

                [alertControler addAction:cancerAlertion];
            }

        } failure:^(NSError *error) {
            UIAlertController *alertControler =[UIAlertController alertControllerWithTitle:@"提醒" message:@"登录失败" preferredStyle: UIAlertControllerStyleAlert];
            [self presentViewController:alertControler animated:YES completion:nil];

            UIAlertAction *cancerAlertion=[UIAlertAction actionWithTitle:@"取消" style:  UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {

            }];

            [alertControler addAction:cancerAlertion];
        }];


    }
    else
    {
        UIAlertController *alertControler =[UIAlertController alertControllerWithTitle:@"警告" message:@"账号或密码输入错误，请重新输入" preferredStyle: UIAlertControllerStyleAlert];
        [self presentViewController:alertControler animated:YES completion:nil];


        UIAlertAction *okAlertion=[UIAlertAction actionWithTitle:@"确认" style: UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

        }];

        UIAlertAction *cancerAlertion=[UIAlertAction actionWithTitle:@"返回" style:  UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {

        }];

        //给弹框添加行为
        [alertControler addAction:okAlertion];
        [alertControler addAction:cancerAlertion];
    }

}

//访问系统相册方法
-(void )setUserImage{
    //使用图片代理-查看协议-并实现“didFinishPickingImage”事件

    UIImagePickerController *imagePicker= [[UIImagePickerController alloc] init];

    imagePicker.delegate = self;
    //弹出系统相册
    [self presentViewController:imagePicker animated:YES completion:nil/*弹出系统相册后的操作*/];
    //completion:^{运行的代码块}

}

//这个方法是协议UIImagePickerControllerDelegate里面的，选择结束的时候会自动调用
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey, id> *)info
{
    UIImage *image=[info objectForKey:@"UIImagePickerControllerOriginalImage"];
    if(image)
    {
        [self.header setBackgroundImage:image forState:UIControlStateNormal];
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}


-(void)popVC
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)regeistVC
{
    RegeistViewController *vc=[RegeistViewController new];
    [self presentViewController:vc animated:YES completion:nil];
}

-(void)dealloc
{
    self.timer=nil;
}
@end
