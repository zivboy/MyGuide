//
//  CreateTeamViewController.m
//  MyGuide
//
//  Created by mac on 15/9/10.
//  Copyright (c) 2015年 home. All rights reserved.
//

#import "CreateTeamViewController.h"

@interface CreateTeamViewController ()

@end

@implementation CreateTeamViewController
@synthesize teamNameText=teamNameText;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self addNavigationBar];
    [self addViewTeamNameText];
    
    
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
    UINavigationItem *navigationItem=[[UINavigationItem alloc]initWithTitle:@"组建团队"];
    
    //左侧添加登录按钮
    UIBarButtonItem *loginButton=[[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(CloseClick:)];
    
    navigationItem.leftBarButtonItem=loginButton;
    
    //添加内容到导航栏
    [navigationBar pushNavigationItem:navigationItem animated:NO];
}


-(void)addViewTeamNameText{
    
    CGRect rx = [ UIScreen mainScreen ].bounds;
    UILabel *TeamLabel= [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 80, 40)];//初始化
    TeamLabel.font = [UIFont fontWithName:@"Arial" size:16];//设置字体名字和字体大小
    // SumItemInfoTextView.backgroundColor=[UIColor lightGrayColor];
    TeamLabel.text=@"团队名称";
    
    [self.view addSubview:TeamLabel];
    
    teamNameText= [[UITextField alloc] initWithFrame:CGRectMake(20, 150, rx.size.width-40, 40)];//初始化
    teamNameText.font = [UIFont fontWithName:@"Arial" size:16];//设置字体名字和字体大小
    //teamNameText.backgroundColor=[UIColor lightGrayColor];
    //teamNameText.textColor=[UIColor grayColor];
    //nameText.text=@"请输入物品名称";
    teamNameText.placeholder = @"请输入团队名称";
    teamNameText.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    // teamNameText.text=@"";
    teamNameText.borderStyle=UITextBorderStyleLine;
    ///tteamNameText.keyboardType=UIKeyboardTypeNumberPad;
    
    teamNameText.layer.cornerRadius=2.0f;
    teamNameText.layer.masksToBounds=YES;
    teamNameText.layer.borderColor=[[UIColor grayColor]CGColor];
    teamNameText.layer.borderWidth= 1.0f;
    //teamNameText.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view  addSubview:teamNameText];
    
    
    
    //发送验证码按钮
    CGRect frame = CGRectMake(rx.size.width/2-100, 220, 200, 40);
    UIButton *buttonOK = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonOK.frame = frame;
    [buttonOK setTitle:@"确    定  ✅" forState: UIControlStateNormal];
    buttonOK.titleLabel.font = [UIFont systemFontOfSize: 16.0];
    buttonOK.backgroundColor = [UIColor colorWithRed:(46.0/255.0) green:(130.0 / 255.0) blue:(255.0 / 255.0) alpha:1];
    // buttonSendCode.titleLabel.backgroundColor= [UIColor colorWithRed:(46.0/255.0) green:(130.0 / 255.0) blue:(255.0 / 255.0) alpha:1];
    buttonOK.tag = 2000;
    [buttonOK addTarget:self action:@selector(CloseClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonOK];
    //[mobileNumberText release];
    // [infoLabel2 release];
}


-(void)keyboardHideAction:(UITapGestureRecognizer*)tap{  //焦点离开输入名称的时候，隐藏键盘
    [teamNameText resignFirstResponder];
   // [verificationCodeText resignFirstResponder];
    
}
-(IBAction)CloseClick:(id)sender{
    //下面这行代码作用就是将弹出的模态视图移除，第一个yes表示移除的时候有动画效果，第二参数是设置一个回调，当模态视图移除消失后，会回到这里，可以在这里随便写句话打个断点，试一下就知道确实会回调到这个方法
    
    [self dismissViewControllerAnimated:YES completion:^{
        
        NSLog(@"back");//这里打个断点，点击按钮模态视图移除后会回到这里
        //ios 5.0以上可以用该方法
        
    }];
    
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
