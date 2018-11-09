//
//  AddRightViewController.m
//  CertWithBlock
//
//  Created by 史瑞昌 on 2018/11/8.
//  Copyright © 2018 史瑞昌. All rights reserved.
//

#define USERID     @"USERID"

#import "AddRightViewController.h"
#import <SRCUIKit/SRCUIKit.h>
#import <SRCFoundation/SRCFoundation.h>
#import "AddCertViewController.h"


#import "Certs.h"
#import "MJRefresh.h"
#import "UserModel.h"



@interface AddRightViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView *tableView;

@property(nonatomic,copy) NSArray *data;

@end

@implementation AddRightViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *navBar=[[UIView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, NavHeight)];
    navBar.backgroundColor=[UIColor colorWithRed:1.0 green:0.1 blue:0.1 alpha:1];
    [self.view addSubview:navBar];

    UILabel *label=[[UILabel alloc] initWithFrame:
                    CGRectMake(20, NavHeight +10, (VIEW_WIDTH-20)/2, 50)];
    label.text=@"可以上传证件列表";
    [self.view addSubview:label];

    //添加列表
    if(!self.tableView)
    {
        self.tableView=[[UITableView alloc] initWithFrame:
                        CGRectMake(0, label.frame.origin.y+label.frame.size.height, VIEW_WIDTH, VIEW_HEIGHT-label.frame.origin.y-label.frame.size.height-64)];
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


-(void)loadDataFromNetwork
{
    __weak typeof(self) weakself=self;
    [SRCNetworkWithAF requestGetMethodWithPath:@"http://192.168.137.138:8080/demo/AppPassport/getCertsList" parameters:nil withProgress:nil success:^(BOOL isSuccess, NSString *response) {
        __strong typeof(weakself) strongself=weakself;
        Certs *model=[[Certs alloc] safe_initWithString:response];
        strongself.data=[model.data copy];
        [strongself.tableView reloadData];
        [strongself.tableView.mj_header endRefreshing];

    } failure:^(NSError *error) {

    }];


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
        NSUserDefaults *userDefault=[NSUserDefaults standardUserDefaults];
        NSString *userid=[userDefault objectForKey:USERID];
        AddCertViewController *vc=[AddCertViewController new];
        vc.rightname=[self.data safe_objectAtIndex:indexPath.row];
        vc.userid=userid;
        [self.navigationController pushViewController:vc animated:YES];

    }
}






@end
