//
//  UserRegisteredViewController.m
//  MyGuide
//
//  Created by mac on 15/9/10.
//  Copyright (c) 2015年 home. All rights reserved.
//

#import "UserRegisteredViewController.h"

@interface UserRegisteredViewController ()

@end

@implementation UserRegisteredViewController
@synthesize mobileNumberText=mobileNumberText;
@synthesize verificationCodeText=verificationCodeText;
@synthesize buttonSendCode=buttonSendCode;
int secondsCountDown=0;
NSTimer *countDownTimer ;

- (void)viewDidLoad {
    [super viewDidLoad];
     [self addNavigationBar];
    [self addViewMobileNumberText];
    [self addViewVerificationCodeText];
   // [self addCloseButton];
    
    
    UITapGestureRecognizer*tapGesture0 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(keyboardHideAction:)]; //点击这个视图，隐藏键盘
    
    tapGesture0.cancelsTouchesInView = NO;
    [self.view  addGestureRecognizer:tapGesture0];
    // Do any additional setup after loading the view from its nib.
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
    UINavigationItem *navigationItem=[[UINavigationItem alloc]initWithTitle:@"注册用户"];
    
    UIImage* img=[UIImage imageNamed:@"rightBtnWhite.png"];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame =CGRectMake(0, 0, 32, 32);
    
    [btn setBackgroundImage:img forState:UIControlStateNormal];
    
    [btn addTarget: self action: @selector(CloseClick:) forControlEvents: UIControlEventTouchUpInside];
    
    UIBarButtonItem* item=[[UIBarButtonItem alloc]initWithCustomView:btn];
    
    
    //左侧添加登录按钮
   //UIBarButtonItem *loginButton=[[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(CloseClick:)];
    
    navigationItem.leftBarButtonItem=item;
    
    //添加内容到导航栏
    [navigationBar pushNavigationItem:navigationItem animated:NO];
}

//#pragma mark -  添加导航兰
//
//- (void)addNavController {
//  
//    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(selectOpenHomeViewAction:)];
//    self.navigationItem.leftBarButtonItem = backButton;
//    
//}


-(void)addViewMobileNumberText{
    
    CGRect rx = [ UIScreen mainScreen ].bounds;
    UILabel *mobileNumberLabel= [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 80, 40)];//初始化
    mobileNumberLabel.font = [UIFont fontWithName:@"Arial" size:16];//设置字体名字和字体大小
    // SumItemInfoTextView.backgroundColor=[UIColor lightGrayColor];
    mobileNumberLabel.text=@"手机号码：";
    
    [self.view addSubview:mobileNumberLabel];
    
    mobileNumberText= [[UITextField alloc] initWithFrame:CGRectMake(110, 100, 160, 40)];//初始化
    mobileNumberText.font = [UIFont fontWithName:@"Arial" size:16];//设置字体名字和字体大小
      //mobileNumberText.backgroundColor=[UIColor lightGrayColor];
     //mobileNumberText.textColor=[UIColor grayColor];
    //nameText.text=@"请输入物品名称";
    mobileNumberText.placeholder = @"请输入电话号码";
    mobileNumberText.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
   // mobileNumberText.text=@"";
    mobileNumberText.borderStyle=UITextBorderStyleLine;
     mobileNumberText.keyboardType=UIKeyboardTypeNumberPad;
    
    mobileNumberText.layer.cornerRadius=2.0f;
    mobileNumberText.layer.masksToBounds=YES;
    mobileNumberText.layer.borderColor=[[UIColor grayColor]CGColor];
    mobileNumberText.layer.borderWidth= 1.0f;
    //mobileNumberText.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view  addSubview:mobileNumberText];
    //[mobileNumberText release];
   // [infoLabel2 release];
}


-(void)addViewVerificationCodeText{
    
    CGRect rx = [ UIScreen mainScreen ].bounds;
    UILabel *mobileNumberLabel= [[UILabel alloc] initWithFrame:CGRectMake(20, 160, 80, 40)];//初始化
    mobileNumberLabel.font = [UIFont fontWithName:@"Arial" size:16];//设置字体名字和字体大小
    // SumItemInfoTextView.backgroundColor=[UIColor lightGrayColor];
    mobileNumberLabel.text=@"验证码：";
    
    [self.view addSubview:mobileNumberLabel];
    
    verificationCodeText= [[UITextField alloc] initWithFrame:CGRectMake(110, 160, 80, 40)];//初始化
    verificationCodeText.font = [UIFont fontWithName:@"Arial" size:16];//设置字体名字和字体大小
    //verificationCodeText.backgroundColor=[UIColor lightGrayColor];
    //verificationCodeText.textColor=[UIColor grayColor];
    //verificationCodeText=@"请输入物品名称";
    verificationCodeText.placeholder = @"验证码";
    verificationCodeText.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    // verificationCodeText=@"";
    verificationCodeText.borderStyle=UITextBorderStyleLine;
    verificationCodeText.keyboardType=UIKeyboardTypeNumberPad;
    
    verificationCodeText.layer.cornerRadius=2.0f;
    verificationCodeText.layer.masksToBounds=YES;
    verificationCodeText.layer.borderColor=[[UIColor grayColor]CGColor];
    verificationCodeText.layer.borderWidth= 1.0f;
    //verificationCodeText = UITextFieldViewModeWhileEditing;
    [self.view  addSubview:verificationCodeText];
    
    
         //发送验证码按钮
    CGRect frame = CGRectMake(200, 160, 80, 40);
     buttonSendCode = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonSendCode.frame = frame;
    [buttonSendCode setTitle:@"发送验证码" forState: UIControlStateNormal];
    buttonSendCode.titleLabel.font = [UIFont systemFontOfSize: 12.0];
    buttonSendCode.titleLabel.textColor=[UIColor blackColor];
    buttonSendCode.backgroundColor = [UIColor colorWithRed:(161.0/255.0) green:(238.0 / 255.0) blue:(206.0 / 255.0) alpha:1];
   // buttonSendCode.titleLabel.backgroundColor= [UIColor colorWithRed:(46.0/255.0) green:(130.0 / 255.0) blue:(255.0 / 255.0) alpha:1];
    buttonSendCode.tag = 2000;
    [buttonSendCode addTarget:self action:@selector(SendCodeClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonSendCode];
    
    //[mobileNumberText release];
    // [infoLabel2 release];
}


-(IBAction)SendCodeClick:(id)sender{
    buttonSendCode.enabled=NO;
    buttonSendCode.backgroundColor = [UIColor colorWithRed:(221.0/255.0) green:(221.0 / 255.0) blue:(221.0 / 255.0) alpha:1];
    buttonSendCode.titleLabel.font = [UIFont systemFontOfSize: 18.0];

    
    //生成随机数开始

    NSString *strRandom = @"";
    
    for(int i=0; i<6; i++)
    {
        strRandom = [ strRandom stringByAppendingFormat:@"%i",(arc4random() % 9)];
    }
    
    NSLog(@"随机数: %@", strRandom);
    //生成随机数结束
    verificationCodeText.text=strRandom;
    
    //设置倒计时总时长
     secondsCountDown = 20;//60秒倒计时
    //开始倒计时
    countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeFireMethod) userInfo:nil repeats:YES]; //启动倒计时后会每秒钟调用一次方法 timeFireMethod
    
    //设置倒计时显示的时间
    [buttonSendCode setTitle:[NSString stringWithFormat:@"%d",secondsCountDown] forState: UIControlStateNormal];
    
    UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"发送成功" message:@"验证码已经发送到您手机！" delegate:self  cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alter show];

}

-(void)timeFireMethod{
    //倒计时-1
    secondsCountDown--;
    //修改倒计时标签现实内容
    [buttonSendCode setTitle:[NSString stringWithFormat:@"%d",secondsCountDown] forState: UIControlStateNormal];
    //当倒计时到0时，做需要的操作，比如验证码过期不能提交
    if(secondsCountDown==0){
        [countDownTimer invalidate];
        //[labelText removeFromSuperview];
        [buttonSendCode setTitle:@"重新发送" forState: UIControlStateNormal];
        buttonSendCode.backgroundColor = [UIColor colorWithRed:(161.0/255.0) green:(238.0 / 255.0) blue:(206.0 / 255.0) alpha:1];
        buttonSendCode.titleLabel.textColor=[UIColor blackColor];

        buttonSendCode.titleLabel.font = [UIFont systemFontOfSize: 12.0];
        buttonSendCode.enabled=YES;


    }
}
    

-(void)addCloseButton{
    
    CGRect rx = [ UIScreen mainScreen ].bounds;
        //简化界面，保存按钮不显示20150504
        CGRect frame = CGRectMake(20, 410, 280, 50);
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = frame;
        [button setTitle:@"关闭" forState: UIControlStateNormal];
        button.backgroundColor = [UIColor clearColor];
        button.tag = 2000;
        [button addTarget:self action:@selector(CloseClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    
    
    
    
    
    [mobileNumberText release];
    // [infoLabel2 release];
}


-(IBAction)CloseClick:(id)sender{
    //下面这行代码作用就是将弹出的模态视图移除，第一个yes表示移除的时候有动画效果，第二参数是设置一个回调，当模态视图移除消失后，会回到这里，可以在这里随便写句话打个断点，试一下就知道确实会回调到这个方法
    
    [self dismissViewControllerAnimated:YES completion:^{
        
        NSLog(@"back");//这里打个断点，点击按钮模态视图移除后会回到这里
        //ios 5.0以上可以用该方法
        
    }];
   
}

-(void)keyboardHideAction:(UITapGestureRecognizer*)tap{  //焦点离开输入名称的时候，隐藏键盘
    [mobileNumberText resignFirstResponder];
    [verificationCodeText resignFirstResponder];
    
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
