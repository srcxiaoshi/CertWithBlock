//
//  CameraViewController.m
//  CertWithBlock
//
//  Created by 史瑞昌 on 2018/11/6.
//  Copyright © 2018 史瑞昌. All rights reserved.
//

#import "CameraViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <SRCUIKit/SRCUIKit.h>
#import "InfoViewController.h"


@interface CameraViewController ()<AVCaptureMetadataOutputObjectsDelegate>
{
    AVCaptureSession * session;
    AVCaptureMetadataOutput * output;
}

@property(nonatomic,strong)UIView *cameraView;
@property(nonatomic,strong)UIView * squaraFrameView;

@end

@implementation CameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //部署UI
    //[self loadQCView];

}

-(void)loadQCView
{
    AVMediaType mediaType = AVMediaTypeVideo;
    AVCaptureDevice * device = [AVCaptureDevice defaultDeviceWithMediaType:mediaType];
    if (!device) {
        ERROR();
        return;
    }

    AVCaptureDeviceInput * deviceInput = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
    output = [[AVCaptureMetadataOutput alloc] init];
    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    session = [[AVCaptureSession alloc] init];
    if([session canAddInput:deviceInput]) {
        [session addInput:deviceInput];
    }
    if([session canAddOutput:output]) {
        [session addOutput:output];
    }
    output.metadataObjectTypes = @[AVMetadataObjectTypeQRCode]; // 必须放在上面设置完session之后

    CGRect cameraFrame = CGRectMake((VIEW_WIDTH-300)/2, (VIEW_HEIGHT-NavHeight-300-self.tabBarController.tabBar.frame.size.height)/2, 300, 300);
    _cameraView = [[UIView alloc] initWithFrame:cameraFrame];
    _cameraView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_cameraView];

    // 添加扫描画面
    AVCaptureVideoPreviewLayer * layer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:session];
    layer.videoGravity = AVLayerVideoGravityResizeAspectFill; // 该值会影响展示
    layer.frame = _cameraView.bounds;
    [_cameraView.layer addSublayer:layer];
    //     output.rectOfInterest = [layer metadataOutputRectOfInterestForRect:scanRect];
    [session startRunning];
    CGRect scanRect = CGRectMake(cameraFrame.size.width / 2 - 100, cameraFrame.size.height / 2 - 100, 200, 200);
    output.rectOfInterest = [layer metadataOutputRectOfInterestForRect:scanRect];  // 采用此方法必须放到startRunning之后

    //扫描方框
    _squaraFrameView = [[UIView alloc] initWithFrame:[layer rectForMetadataOutputRectOfInterest:output.rectOfInterest]];
    _squaraFrameView.backgroundColor = [UIColor clearColor];
    _squaraFrameView.layer.borderWidth = 1.0;
    _squaraFrameView.layer.borderColor = [UIColor orangeColor].CGColor;
    [_cameraView addSubview:_squaraFrameView];



}

#pragma mark delegate
- (void)captureOutput:(AVCaptureOutput *)output didOutputMetadataObjects:(NSArray<__kindof AVMetadataObject *> *)metadataObjects fromConnection:(AVCaptureConnection *)connection {
    if(metadataObjects.count > 0) {
        if(session)
        {
            [session stopRunning];

            AVMetadataMachineReadableCodeObject * readCode = metadataObjects.firstObject;
            InfoViewController *vc=[InfoViewController new];
            vc.url=readCode.stringValue;
            NSLog(@"%@",readCode.stringValue);
            [self.navigationController pushViewController:vc animated:YES];
            session=nil;
        }
    }
}

//申请权限
-(void)makeRight
{
    __weak typeof(self) weakself=self;
    //申请权限
    AVMediaType mediaType = AVMediaTypeVideo;
    // 先检查权限，如果没有权限，就去申请获取
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
    switch (status) {
        case AVAuthorizationStatusNotDetermined:{
            [AVCaptureDevice requestAccessForMediaType:mediaType completionHandler:^(BOOL granted) {
                dispatch_async(dispatch_get_global_queue(0, 0), ^{
                    if (granted) {
                        __strong typeof(weakself) strongself=weakself;
                        [strongself loadQCView];
                    } else {
                        NSLog(@"相机权限获取失败");
                    }
                });
            }];
        }
            break;
        case AVAuthorizationStatusAuthorized:{
            [weakself loadQCView];
        }
            break;

        default:
            NSLog(@"相机权限获取失败");
            break;
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self makeRight];
}


@end
