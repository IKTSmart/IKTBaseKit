//
//  ViewController.m
//  IKTBaseKitDemo
//
//  Created by bcikt on 2019/1/9.
//  Copyright © 2019 ETScorpoin. All rights reserved.
//

#import "ViewController.h"
#import "IKTBaseKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"序列号:%@",IKTDeviceUUID());
    
    NSLog(@"手机别名：%@",IKTPhoneName());
    
    NSLog(@"设备名称：%@",IKTDeviceName());
    
    NSLog(@"系统版本：%f",iOSVersion());
    
    NSLog(@"手机型号:%@",IKTDeveceType());
    
    NSLog(@"地方型号%@",IKTLocalizeModel());
    
    NSLog(@"width:%f",ScreenWidth());
    
    NSLog(@"statebar:%f",IKTStateBarHeight());
    
    [self.view addVerticalLine];
    
    [self.view addHorizontalLine];
}


@end
