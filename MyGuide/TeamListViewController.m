//
//  TeamListViewController.m
//  MyGuide
//
//  Created by mac on 15/9/10.
//  Copyright (c) 2015年 home. All rights reserved.
//

#import "TeamListViewController.h"

@interface TeamListViewController ()

@end

@implementation TeamListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.[self addNavigationBar];
    [self addNavigationBar];
  //[self addViewTeamNameText];
    
    
    UITapGestureRecognizer*tapGesture0 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(keyboardHideAction:)]; //点击这个视图，隐藏键盘
    
    tapGesture0.cancelsTouchesInView = NO;
    [self.view  addGestureRecognizer:tapGesture0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 添加导航栏
-(void)addNavigationBar{
    
    CGRect rx = [ UIScreen mainScreen ].bounds;
    //创建一个导航栏
    UINavigationBar *navigationBar=[[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, rx.size.width, 44)];
    //navigationBar.tintColor=[UIColor whiteColor];
    [self.view addSubview:navigationBar];
    //创建导航控件内容
    UINavigationItem *navigationItem=[[UINavigationItem alloc]initWithTitle:@"我的团队"];
    
    //左侧添加登录按钮
    UIBarButtonItem *loginButton=[[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(CloseClick:)];
    
    navigationItem.leftBarButtonItem=loginButton;
    
    //添加内容到导航栏
    [navigationBar pushNavigationItem:navigationItem animated:NO];
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
