//
//  TestViewController.m
//  WZXJianShuPopDemo
//
//  Created by wordoor－z on 16/1/14.
//  Copyright © 2016年 wzx. All rights reserved.
//

#import "TestViewController.h"
#import "RootViewController.h"
@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
        UIView * popView = [[UIView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height /2.0)];
        
        popView.backgroundColor = [UIColor grayColor];
        
        //加个阴影
        popView.layer.shadowColor = [UIColor blackColor].CGColor;
        popView.layer.shadowOffset = CGSizeMake(0.5, 0.5);
        popView.layer.shadowOpacity = 0.8;
        popView.layer.shadowRadius = 5;
    
        //导航栏一定要加载ROOTVC上面
        RootViewController * root = [[RootViewController alloc]init];
        root.title = @"123";
        UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:root];
    
        //关闭btn
        UIButton * closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        closeBtn.frame = CGRectMake(15, 0, 50, 40);
        [closeBtn setTitle:@"关闭" forState:UIControlStateNormal];
        [closeBtn setTitleColor:[UIColor colorWithRed:217/255.0 green:110/255.0 blue:90/255.0 alpha:1] forState:UIControlStateNormal];
        [closeBtn addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
        [popView addSubview:closeBtn];
    
        //开启btn
        UIButton * openBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        openBtn.frame = CGRectMake((self.view.frame.size.width - 100)/2.0, 300, 100, 40);
        [openBtn setTitle:@"开启" forState:UIControlStateNormal];
        [openBtn setTitleColor:[UIColor colorWithRed:217/255.0 green:110/255.0 blue:90/255.0 alpha:1] forState:UIControlStateNormal];
        [openBtn addTarget:self action:@selector(show) forControlEvents:UIControlEventTouchUpInside];
        //组件也要加在rootVC上面
        [root.view addSubview:openBtn];
   
    
    [self createPopVCWithRootVC:nav andPopView:popView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
