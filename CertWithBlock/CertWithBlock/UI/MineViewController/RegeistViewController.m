//
//  RegeistViewController.m
//  CertWithBlock
//
//  Created by 史瑞昌 on 2018/11/7.
//  Copyright © 2018 史瑞昌. All rights reserved.
//

#import "RegeistViewController.h"
#import <SRCUIKit/SRCUIKit.h>
#import <SRCFoundation/SRCFoundation.h>
#import "THProgressView.h"
#import "RegeistUser.h"



@interface RegeistViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property(nonatomic,strong) UIButton *login,*header;
@property(nonatomic,strong) UILabel *user,*password,*name,*phone;
@property(nonatomic,strong) UITextField *usertext ,*passwordtext,*nametext ,*phonetext;

@property(nonatomic,strong) THProgressView *progressView;
@property(nonatomic,assign) CGFloat prograss;
@property(nonatomic,weak) NSTimer *timer;

@end

@implementation RegeistViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *navBar=[[UIView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, NavHeight)];
    navBar.backgroundColor=[UIColor colorWithRed:1.0 green:0.1 blue:0.1 alpha:1];
    [self.view addSubview:navBar];
    
    self.login =[[UIButton alloc]initWithFrame:CGRectMake((VIEW_WIDTH-200)/2, 600, 200, 50)];
    [self.login setBackgroundColor:[UIColor colorWithRed:1.0 green:0.1 blue:0.1 alpha:1]];
    [self.login setTitle:@"提交" forState:UIControlStateNormal];
    
    self.header =[[UIButton alloc]initWithFrame:CGRectMake((VIEW_WIDTH-80)/2, navBar.frame.size.height+50, 80, 80)];
    [self.header setBackgroundImage:[UIImage imageNamed:@"login_header.png"] forState:UIControlStateNormal ];
    //设置圆形半径/*圆形半径*/
    self.header.layer.cornerRadius=40;
    //切割（伪装）圆形半径外的部分（将按钮的一层边角伪装）

    self.header.layer.masksToBounds=YES;

    //添加点击事件 去访问系统相册
    [self.header addTarget:self action:@selector(setUserImage)
          forControlEvents:(UIControlEventTouchUpInside )];

    //添加登陆监听事件
    [self.login addTarget:self action:@selector(loginAction) forControlEvents:(UIControlEventTouchUpInside )];


    //标签设置（标签名称、标签位置与大小、标签标题（文本）、）
    self.user = [[UILabel alloc]initWithFrame:CGRectMake(40, self.header.frame.origin.y+self.header.frame.size.height+20, 80, 30)];
    self.user.text=@"身份证号:";
    self.password = [[UILabel alloc]initWithFrame:CGRectMake(40, self.user.frame.origin.y+50, 80, 30)];
    self.password.text =@"密码:";

    self.name = [[UILabel alloc]initWithFrame:CGRectMake(40, self.password.frame.origin.y+50, 80, 30)];
    self.name.text =@"姓名:";

    self.phone = [[UILabel alloc]initWithFrame:CGRectMake(40, self.name.frame.origin.y+50, 80, 30)];
    self.phone.text =@"手机号:";

    //文本框设置（位置与大小、获取UITextField的文本，设置输入框键盘类型设置占位符 密文输入）
    self.usertext= [[UITextField alloc]initWithFrame:CGRectMake(120, self.header.frame.origin.y+self.header.frame.size.height+20, 200, 30)];
    //设置提示字
    self.usertext.placeholder=@"请输入身份证号";

    //设置键盘类型
    self.usertext.keyboardType = UIKeyboardTypeDefault;

    self.passwordtext=[[UITextField alloc]initWithFrame:CGRectMake(120, self.user.frame.origin.y+50, 200, 30)];
    self.passwordtext .placeholder=@"请输入密码";

    [self.passwordtext setSecureTextEntry:YES];
    //设置键盘
    self.passwordtext.keyboardType= UIKeyboardTypeNumberPad;


    self.passwordtext.enablesReturnKeyAutomatically=YES;

    self.nametext= [[UITextField alloc]initWithFrame:CGRectMake(120, self.passwordtext.frame.origin.y+self.passwordtext.frame.size.height+20, 200, 30)];
    //设置提示字
    self.nametext.placeholder=@"请输入用户名";
    //设置键盘类型
    self.nametext.keyboardType = UIKeyboardTypeDefault;

    self.phonetext= [[UITextField alloc]initWithFrame:CGRectMake(120, self.nametext.frame.origin.y+self.nametext.frame.size.height+20, 200, 30)];
    //设置提示字
    self.phonetext.placeholder=@"请输入手机号";
    //设置键盘类型
    self.phonetext.keyboardType = UIKeyboardTypeNumberPad;

    //添加到视图

    [self.view addSubview:self.login];
    [self.view addSubview:self.user];
    [self.view addSubview:self.password];
    [self.view addSubview:self.passwordtext];
    [self.view addSubview:self.usertext];
    [self.view addSubview:self.header];

    [self.view addSubview:self.name];
    [self.view addSubview:self.nametext];
    [self.view addSubview:self.phone];
    [self.view addSubview:self.phonetext];
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

    NSString *userstring,*passtring,*namestring,*phonestring;
    userstring = self.usertext.text;
    passtring = self.passwordtext.text;
    namestring=self.nametext.text;
    phonestring=self.phonetext.text;
    if (![userstring isEqualToString:@""]&&![passtring isEqualToString:@""]) {
        //转菊花
        [self pragressView];
        if(!self.timer)
        {
            self.timer=[NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(updateProgress) userInfo:nil repeats:YES];
        }
        [self.progressView setHidden:NO];
        [self.timer setFireDate:[NSDate date]];
        NSString *str=[NSString stringWithFormat:@"http://192.168.137.138:8080/demo/AppPassport/register?id=%@&pwd=%@&address=0x920d73cc325c68843f8d4bdb49d3e80a649104c2&name=%@&phone=%@",userstring,passtring,namestring,phonestring];
        //网络验证
        __weak typeof(self) weakself=self;
        [SRCNetworkWithAF requestGetMethodWithPath:str parameters:nil withProgress:nil success:^(BOOL isSuccess, NSString *response) {
            RegeistUser *model=[[RegeistUser alloc] safe_initWithString:response];
            if(model&&[model.code isEqualToString:@"200"])
            {
                UIAlertController *alertControler =[UIAlertController alertControllerWithTitle:@"提醒" message:@"注册成功" preferredStyle: UIAlertControllerStyleAlert];
                [self presentViewController:alertControler animated:YES completion:nil];

                UIAlertAction *cancerAlertion=[UIAlertAction actionWithTitle:@"确定" style:  UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                    [weakself dismissViewControllerAnimated:YES completion:nil];
                }];

                [alertControler addAction:cancerAlertion];
            }
            else
            {
                UIAlertController *alertControler =[UIAlertController alertControllerWithTitle:@"提醒" message:@"注册失败，用户被注册" preferredStyle: UIAlertControllerStyleAlert];
                [self presentViewController:alertControler animated:YES completion:nil];

                UIAlertAction *cancerAlertion=[UIAlertAction actionWithTitle:@"确定" style:  UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                    [weakself dismissViewControllerAnimated:YES completion:nil];
                }];

                [alertControler addAction:cancerAlertion];

            }





        } failure:^(NSError *error) {
            UIAlertController *alertControler =[UIAlertController alertControllerWithTitle:@"提醒" message:@"注册失败" preferredStyle: UIAlertControllerStyleAlert];
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

@end
