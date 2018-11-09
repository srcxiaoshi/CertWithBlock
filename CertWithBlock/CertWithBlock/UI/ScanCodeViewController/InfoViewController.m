
//
//  InfoViewController.m
//  CertWithBlock
//
//  Created by 史瑞昌 on 2018/11/9.
//  Copyright © 2018 史瑞昌. All rights reserved.
//

#import "InfoViewController.h"
#import <SRCUIKit/SRCUIKit.h>
#import <SRCFoundation/SRCFoundation.h>
#import "TCertModel.h"



@interface InfoViewController ()

@property(nonatomic,strong)UILabel *certid;
@property(nonatomic,strong)UILabel *certname;
@property(nonatomic,strong)UILabel *certcompany;

@end

@implementation InfoViewController

- (void)viewDidLoad {

    [super viewDidLoad];

    //证件证明详情页
    self.certid=[[UILabel alloc] initWithFrame:
                    CGRectMake(20, NavHeight +30, VIEW_WIDTH-40, 50)];
    self.certid.text=@"id";
    [self.view addSubview:self.certid];


    self.certname=[[UILabel alloc] initWithFrame:
                    CGRectMake(20, NavHeight +80, VIEW_WIDTH-40, 50)];
    self.certname.text=@"name";
    [self.view addSubview:self.certname];


    self.certcompany=[[UILabel alloc] initWithFrame:
                    CGRectMake(20, NavHeight +130, VIEW_WIDTH-40, 50)];
    self.certcompany.text=@"company";
    [self.view addSubview:self.certcompany];

    [self loadNetWork];

}


-(void)loadNetWork
{
    [SRCNetworkWithAF requestGetMethodWithPath:self.url parameters:nil withProgress:^(float progress) {

    } success:^(BOOL isSuccess, NSString *response) {
        NSLog(@"%@",response);
        TCertModel *model=[[TCertModel alloc] safe_initWithString:response];
        self.certid.text=[NSString stringWithFormat:@"证件id:%@",model.data.id];
        self.certname.text=[NSString stringWithFormat:@"证件名:%@",model.data.name];
        self.certcompany.text=[NSString stringWithFormat:@"证件机构:%@",model.data.company];
    } failure:^(NSError *error) {
        UIAlertController *alertControler =[UIAlertController alertControllerWithTitle:@"提醒" message:@"查询失败，请重试" preferredStyle: UIAlertControllerStyleAlert];
        [self presentViewController:alertControler animated:YES completion:nil];

        UIAlertAction *cancerAlertion=[UIAlertAction actionWithTitle:@"确定" style:  UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            //[weakself dismissViewControllerAnimated:YES completion:nil];
        }];

        [alertControler addAction:cancerAlertion];
    }];

}

@end
