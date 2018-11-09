//
//  AddCertViewController.m
//  CertWithBlock
//
//  Created by 史瑞昌 on 2018/11/8.
//  Copyright © 2018 史瑞昌. All rights reserved.
//


#define USERID     @"USERID"
#define USERPWD     @"USERPWD"


#import "AddCertViewController.h"
#import <SRCUIKit/SRCUIKit.h>
#import <SRCFoundation/SRCFoundation.h>
#import "UserModel.h"
#import "AddCertModel.h"
#import "CertModel.h"


@interface AddCertViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property(nonatomic,copy)NSArray *data;

@property(nonatomic,strong)UITextField *certid;
@property(nonatomic,strong)UITextField *certcompany;
@property(nonatomic,strong)UITextField *certtname;

@property(nonatomic,strong) UIButton *img;
@property(nonatomic,strong)UIImage *btnimg;
@end

@implementation AddCertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *navBar=[[UIView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, NavHeight)];
    navBar.backgroundColor=[UIColor colorWithRed:1.0 green:0.1 blue:0.1 alpha:1];
    [self.view addSubview:navBar];


    //照片
    self.img =[[UIButton alloc]initWithFrame:CGRectMake((VIEW_WIDTH-80)/2, navBar.frame.size.height+50, 80, 80)];
    self.btnimg=[UIImage imageNamed:@"login_header.png"];
    [self.img setBackgroundImage:self.btnimg forState:UIControlStateNormal ];
    //添加点击事件 去访问系统相册
    [self.img addTarget:self action:@selector(setUserImage)
          forControlEvents:(UIControlEventTouchUpInside )];
    [self.view addSubview:self.img];

    //标签设置（标签名称、标签位置与大小、标签标题（文本）、）
    UILabel * certid = [[UILabel alloc]initWithFrame:CGRectMake(40, self.img.frame.origin.y+self.img.frame.size.height+20, 80, 30)];
    certid.text=@"证号:";
    UILabel *company = [[UILabel alloc]initWithFrame:CGRectMake(40, certid.frame.origin.y+50, 80, 30)];
    company.text =@"证件名:";
    UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(40, company.frame.origin.y+50, 80, 30)];
    name.text =@"颁发单位:";
    [self.view addSubview:certid];
    [self.view addSubview:company];
    [self.view addSubview:name];


    self.certid= [[UITextField alloc]initWithFrame:CGRectMake(120, self.img.frame.origin.y+self.img.frame.size.height+20, 200, 30)];
    self.certid.placeholder=@"请输入证号";
    self.certid.keyboardType = UIKeyboardTypeDefault;

    self.certtname= [[UITextField alloc]initWithFrame:CGRectMake(120, self.certid.frame.origin.y+self.certid.frame.size.height+20, 200, 30)];
    self.certtname.placeholder=@"请输入证名";
    self.certtname.keyboardType = UIKeyboardTypeDefault;

    self.certcompany= [[UITextField alloc]initWithFrame:CGRectMake(120, self.certtname.frame.origin.y+self.certtname.frame.size.height+20, 200, 30)];
    self.certcompany.placeholder=@"请输入颁发单位";
    self.certcompany.keyboardType = UIKeyboardTypeDefault;

    [self.view addSubview:self.certid];
    [self.view addSubview:self.certtname];
    [self.view addSubview:self.certcompany];

    //  提交按钮
    UIButton * login =[[UIButton alloc]initWithFrame:CGRectMake((VIEW_WIDTH-200)/2, 400, 200, 50)];
    [login setBackgroundColor:[UIColor colorWithRed:1.0 green:0.1 blue:0.1 alpha:1]];
    [login setTitle:@"提交(只支持警官)" forState:UIControlStateNormal];
    [self.view addSubview:login];
    [login addTarget:self action:@selector(tijiao) forControlEvents:UIControlEventTouchUpInside];
    

}
-(void)tijiao
{
    //处理空
    if (![self.certid.text isEqualToString:@""]&&![self.certtname.text isEqualToString:@""]
        &&![self.certcompany.text isEqualToString:@""]) {
        [self loadNetWorkData];
    }
    else
    {
        UIAlertController *alertControler =[UIAlertController alertControllerWithTitle:@"警告" message:@"证件信息不可为空，请重新输入" preferredStyle: UIAlertControllerStyleAlert];
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
-(void)setUserImage
{
    //使用图片代理-查看协议-并实现“didFinishPickingImage”事件

    UIImagePickerController *imagePicker= [[UIImagePickerController alloc] init];

    imagePicker.delegate = self;
    //弹出系统相册
    [self presentViewController:imagePicker animated:YES completion:nil/*弹出系统相册后的操作*/];
    //completion:^{运行的代码块}
}

-(void)loadNetWorkData
{
    __weak typeof(self) weakself=self;
    NSUserDefaults *userDefault=[NSUserDefaults standardUserDefaults];
    NSString *userid=[userDefault objectForKey:USERID];
    
    NSString *str=[NSString stringWithFormat:@"http://192.168.137.138:8080/demo/AppPassport/getRight?id=%@&rightname=GeneralCertificate&address=0x920d73cc325c68843f8d4bdb49d3e80a649104c2",userid];
    [SRCNetworkWithAF requestGetMethodWithPath:str parameters:nil withProgress:nil success:^(BOOL isSuccess, NSString *response) {
        NSLog(@"%@",response);
        __strong typeof(weakself) strongself=weakself;
        UserModel *model=[[UserModel alloc] safe_initWithString:response];
        strongself.data=[model.data.certificates copy];
        BOOL is=false;
        for(int i=0;i<[strongself.data count];i++)
        {
            if([[strongself.data safe_objectAtIndex:i] isEqualToString:strongself.rightname])
            {
                //不在addRight
                is=true;
                [strongself addCertFromNetWork];
                break;
            }
        }
        if(!is)
        {
            //add然后 addcert
            NSString *str=[NSString stringWithFormat:@"http://192.168.137.138:8080/demo/AppPassport/addRight?id=%@&address=0x920d73cc325c68843f8d4bdb49d3e80a649104c2&rightname=%@",userid,strongself.rightname];
            [SRCNetworkWithAF requestGetMethodWithPath:str parameters:nil withProgress:nil success:^(BOOL isSuccess, NSString *response) {
                __strong typeof(weakself) strongself=weakself;
                UserModel *model=[[UserModel alloc] safe_initWithString:response];
                if(![NSString safe_isEmpty:model.code]&&[model.code isEqualToString:@"200"])
                {
                    [strongself addCertFromNetWork];
                }

            } failure:^(NSError *error) {
                UIAlertController *alertControler =[UIAlertController alertControllerWithTitle:@"提醒" message:@"添加失败" preferredStyle: UIAlertControllerStyleAlert];
                [self presentViewController:alertControler animated:YES completion:nil];

                UIAlertAction *cancerAlertion=[UIAlertAction actionWithTitle:@"确定" style:  UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                    [weakself.navigationController popViewControllerAnimated:YES];
                }];

                [alertControler addAction:cancerAlertion];
            }];
        }


    } failure:^(NSError *error) {
        UIAlertController *alertControler =[UIAlertController alertControllerWithTitle:@"提醒" message:@"添加失败" preferredStyle: UIAlertControllerStyleAlert];
        [self presentViewController:alertControler animated:YES completion:nil];

        UIAlertAction *cancerAlertion=[UIAlertAction actionWithTitle:@"确定" style:  UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            [weakself.navigationController popViewControllerAnimated:YES];
        }];

        [alertControler addAction:cancerAlertion];
    }];
}

-(void)addCertFromNetWork
{
    __weak typeof(self) weakself=self;
    NSUserDefaults *userDefault=[NSUserDefaults standardUserDefaults];
    NSString *userid=[userDefault objectForKey:USERID];
    NSString *pwd=[userDefault objectForKey:USERPWD];
    NSString *img=@"img";
    if(![self.img.currentBackgroundImage isEqual:self.btnimg])
    {
        //base64
        NSData *data = UIImageJPEGRepresentation(self.img.currentBackgroundImage, 1.0f);
        img = [data base64EncodedStringWithOptions:
                                     NSDataBase64Encoding64CharacterLineLength];
    }

    AddCertModel *model=[AddCertModel new];
    model.id=userid;
    model.pwd=pwd;
    model.img=img;
    model.rightname=self.rightname;
    model.address=@"0x920d73cc325c68843f8d4bdb49d3e80a649104c2";
    model.certcompany=self.certcompany.text;
    model.certid=self.certid.text;
    model.certtname=self.certtname.text;


    [SRCNetworkWithAF requestPostMethodWithPath:@"http://192.168.137.138:8080/demo/AppPassport/addCert" parameters:[model toDictionary] withProgress:^(float progress) {

    } success:^(BOOL isSuccess, NSString *response) {
        NSLog(@"%@",response);
        CertModel *model=[[CertModel alloc] safe_initWithString:response];
        if(model&&[model.code isEqualToString:@"200"])
        {
            UIAlertController *alertControler =[UIAlertController alertControllerWithTitle:@"提醒" message:@"添加成功" preferredStyle: UIAlertControllerStyleAlert];
            [self presentViewController:alertControler animated:YES completion:nil];

            UIAlertAction *cancerAlertion=[UIAlertAction actionWithTitle:@"确定" style:  UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                [weakself.navigationController popViewControllerAnimated:YES];
            }];

            [alertControler addAction:cancerAlertion];
        }
        else
        {
            UIAlertController *alertControler =[UIAlertController alertControllerWithTitle:@"提醒" message:@"已经有对应的证件，请不要重复添加！" preferredStyle: UIAlertControllerStyleAlert];
            [self presentViewController:alertControler animated:YES completion:nil];

            UIAlertAction *cancerAlertion=[UIAlertAction actionWithTitle:@"确定" style:  UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                [weakself.navigationController popViewControllerAnimated:YES];
            }];

            [alertControler addAction:cancerAlertion];
        }

    } failure:^(NSError *error) {
        UIAlertController *alertControler =[UIAlertController alertControllerWithTitle:@"提醒" message:@"添加失败" preferredStyle: UIAlertControllerStyleAlert];
        [self presentViewController:alertControler animated:YES completion:nil];

        UIAlertAction *cancerAlertion=[UIAlertAction actionWithTitle:@"确定" style:  UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            [weakself.navigationController popViewControllerAnimated:YES];
        }];

        [alertControler addAction:cancerAlertion];
    }];
}



//这个方法是协议UIImagePickerControllerDelegate里面的，选择结束的时候会自动调用
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey, id> *)info
{
    UIImage *image=[info objectForKey:@"UIImagePickerControllerOriginalImage"];
    if(image)
    {
        [self.img setBackgroundImage:image forState:UIControlStateNormal];
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}
@end
