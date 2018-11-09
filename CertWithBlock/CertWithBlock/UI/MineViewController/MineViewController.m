//
//  MineViewController.m
//  CertWithBlock
//
//  Created by 史瑞昌 on 2018/11/5.
//  Copyright © 2018 史瑞昌. All rights reserved.
//


#define APPADDRESS     @"APPADDRESS"
#define USERID     @"USERID"
#define USERPWD     @"USERPWD"
#define USERIMAGE     @"USERIMAGE"



#import "MineViewController.h"
#import <SRCFoundation/SRCFoundation.h>
#import "LoginViewController.h"
#import <SRCUIKit/SRCUIKit.h>
#import "UserModel.h"
#import "MJRefresh.h"
#import "QCodeViewController.h"
#import "AddRightViewController.h"



@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UIButton *header;

@property(nonatomic,strong) UITableView *tableView;

@property(nonatomic,copy) NSArray *data;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *navBar=[[UIView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, NavHeight)];
    navBar.backgroundColor=[UIColor colorWithRed:1.0 green:0.1 blue:0.1 alpha:1];
    [self.view addSubview:navBar];

    //添加一个注册按钮
    UIButton *rebtn=[[UIButton alloc] initWithFrame:CGRectMake(VIEW_WIDTH-80-20, navBar.frame.size.height-30-10, 80, 30)];
    [navBar addSubview:rebtn];
    [rebtn setTitle:@"添加证件" forState: UIControlStateNormal];
    [rebtn addTarget:self action:@selector(addRight) forControlEvents:UIControlEventTouchUpInside];

}

-(void)addRight
{
    AddRightViewController *vc=[AddRightViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)userIsLogin
{
    NSUserDefaults *userDefault=[NSUserDefaults standardUserDefaults];
    NSString *userid=[userDefault objectForKey:USERID];
    if(![NSString safe_isEmpty:userid])
    {
        NSString* appaddress=[userDefault objectForKey:APPADDRESS];
        NSString* userid=[userDefault objectForKey:USERID];
        NSString* userpwd=[userDefault objectForKey:USERPWD];

        if([NSString safe_isEmpty:appaddress]
           ||[NSString safe_isEmpty:userid]
           ||[NSString safe_isEmpty:userpwd])
        {
            //跳出登录页面去登录
            LoginViewController *login=[LoginViewController new];
            [self.navigationController presentViewController:login animated:YES completion:nil];
        }
        else
        {

            if(!self.header)
            {
                UILabel *label=[[UILabel alloc] initWithFrame:
                                CGRectMake(20, NavHeight +10, (VIEW_WIDTH-20)/2, 50)];
                label.text=@"已经上传的证件列表";
                [self.view addSubview:label];

                //这里是个人页
                self.header =[[UIButton alloc]initWithFrame:CGRectMake((VIEW_WIDTH-80)/2, NavHeight+50, 80, 80)];
                [self.header setBackgroundImage:[UIImage imageNamed:@"login_header.png"]
                                       forState:UIControlStateNormal];
                //设置圆形半径
                self.header.layer.cornerRadius/*圆形半径*/=40;
                //切割（伪装）圆形半径外的部分（将按钮的一层边角伪装）
                self.header.layer.masksToBounds=YES;
                //添加点击事件 去访问系统相册
                [self.view addSubview:self.header];
            }

            //添加列表
            if(!self.tableView)
            {
                self.tableView=[[UITableView alloc] initWithFrame:
                                CGRectMake(0, self.header.frame.origin.y+self.header.frame.size.height, VIEW_WIDTH, VIEW_HEIGHT-self.header.frame.origin.y-self.header.frame.size.height-64)];
                self.tableView.delegate=self;
                self.tableView.dataSource=self;
                //注册默认 cell样式
                [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:SRCTableViewCellDefaultID];
                __weak typeof(self) weakself=self;
                self.tableView.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
                    __strong typeof(weakself) strongself=weakself;
                    [strongself loadDataFromNetwork];
                }];
                self.tableView.mj_header.automaticallyChangeAlpha = YES;
                [self.view addSubview:self.tableView];
            }

        }
    }
    else
    {
        //弹出登录页，去登录
        LoginViewController *login=[LoginViewController new];
        [self.navigationController presentViewController:login animated:YES completion:nil];
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self userIsLogin];
}



-(void)loadDataFromNetwork
{
    __weak typeof(self) weakself=self;
    NSUserDefaults *userDefault=[NSUserDefaults standardUserDefaults];
    NSString *userid=[userDefault objectForKey:USERID];
    if(![NSString safe_isEmpty:userid])
    {
        NSString *str=[NSString stringWithFormat:@"http://192.168.137.138:8080/demo/AppPassport/getRight?id=%@&rightname=GeneralCertificate&address=0x920d73cc325c68843f8d4bdb49d3e80a649104c2",userid];
        [SRCNetworkWithAF requestGetMethodWithPath:str parameters:nil withProgress:nil success:^(BOOL isSuccess, NSString *response) {
            NSLog(@"%@",response);
            __strong typeof(weakself) strongself=weakself;
            UserModel *model=[[UserModel alloc] safe_initWithString:response];
            strongself.data=[model.data.certificates copy];
            [strongself.tableView reloadData];
            [strongself.tableView.mj_header endRefreshing];

        } failure:^(NSError *error) {

        }];
    }


}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:SRCTableViewCellDefaultID];
    NSString *cert=[self.data safe_objectAtIndex:indexPath.row];
    if(![NSString safe_isEmpty:cert])
    {
        UILabel *label=[[UILabel alloc] initWithFrame:
                        CGRectMake(20, 0, VIEW_WIDTH, cell.frame.size.height)];
        if([cert isEqualToString:@"GeneralCertificate"])
        {
            label.text=@"身份证";
        }
        else if ([cert isEqualToString:@"AppPassport"])
        {
            label.text=@"APP证件";
        }
        else if ([cert isEqualToString:@"Doctor"])
        {
            label.text=@"医生证件";
        }
        else if ([cert isEqualToString:@"Police"])
        {
            label.text=@"警官证件";
        }
        [cell addSubview:label];
    }
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(self.data)
    {
        return [self.data count];
    }
    else
        return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.data&&[self.data safe_objectAtIndex:indexPath.row]&&[NSString safe_isNotEmpty:[self.data safe_objectAtIndex:indexPath.row]])
    {
        QCodeViewController *vc=[QCodeViewController new];

        vc.cert=[self.data safe_objectAtIndex:indexPath.row];
        NSLog(@"%@",vc.cert);
        [self.navigationController pushViewController:vc animated:YES];
    }
}


@end
