//
//  AddTeamMemberViewController.m
//  MyGuide
//
//  Created by mac on 15/9/10.
//  Copyright (c) 2015年 home. All rights reserved.
//

#import "AddTeamMemberViewController.h"

@interface AddTeamMemberViewController ()

@end

@implementation AddTeamMemberViewController
@synthesize userNameText=userNameText;
@synthesize mobileNumberText=mobileNumberText;
@synthesize scrollViewBase=scrollViewBase;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self addNavigationBar];
     [self addViewUserNameText];
    
    
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
    navigationBar.backgroundColor=[UIColor colorWithRed:(50.0/255.0) green:(177.0 / 255.0) blue:(108.0 / 255.0) alpha:1];

    [self.view addSubview:navigationBar];
    //创建导航控件内容
    UINavigationItem *navigationItem=[[UINavigationItem alloc]initWithTitle:@"添加成员"];
    
    
    
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


-(void)addViewUserNameText{
    
    CGRect rx = [ UIScreen mainScreen ].bounds;
    scrollViewBase=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 44, rx.size.width, rx.size.height)];//初始化scrollview的界面 （坐标x，坐标y，宽度，高度）屏幕左上角为原点
    [scrollViewBase setContentSize:CGSizeMake(rx.size.width, rx.size.height)];//设置scrollview画布的大小，此设置为三页的宽度，380的高度。用来实现三页照片的转换。
    scrollViewBase.pagingEnabled=YES;//立刻翻页到下一页 没中间的拖动过程
    scrollViewBase.bounces=NO;//去掉翻页中的白屏
    ////  scrollViewBase.backgroundColor=[UIColor colorWithWhite:0.9 alpha:0.8];
    // [scrollViewImage setDelegate:self];
    
    scrollViewBase.showsHorizontalScrollIndicator=NO;//不现实水平滚动条
    self.scrollViewBase.delegate = self;
    [self.view addSubview:scrollViewBase];
    
    scrollViewBase.backgroundColor=[UIColor colorWithRed:(246.0/255.0) green:(246.0 / 255.0) blue:(246.0 / 255.0) alpha:1];

    
    UILabel *userNameLabel= [[UILabel alloc] initWithFrame:CGRectMake(20, 60, 80, 40)];//初始化
    userNameLabel.font = [UIFont fontWithName:@"Arial" size:16];//设置字体名字和字体大小
    userNameLabel.textAlignment = UITextAlignmentCenter;

    userNameLabel.backgroundColor=[UIColor colorWithRed:(161.0/255.0) green:(238.0 / 255.0) blue:(206.0 / 255.0) alpha:1];
   // userNameLabel.backgroundColor=[UIColor colorWithRed:(222.0/255.0) green:(216.0 / 255.0) blue:(209.0 / 255.0) alpha:1];
    userNameLabel.text=@"姓名";
    
    [self.scrollViewBase addSubview:userNameLabel];
    
    userNameText= [[UITextField alloc] initWithFrame:CGRectMake(101, 60, rx.size.width-120, 40)];//初始化
    userNameText.font = [UIFont fontWithName:@"Arial" size:16];//设置字体名字和字体大小
     userNameText.backgroundColor=[UIColor whiteColor];
    //userNameText.textColor=[UIColor grayColor];
    //nameText.text=@"请输入物品名称";
    userNameText.placeholder = @"请输入名字";
    userNameText.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    // userNameText.text=@"";
    ///userNameText.borderStyle=UITextBorderStyleLine;
    ///userNameText.keyboardType=UIKeyboardTypeNumberPad;
    
//    userNameText.layer.cornerRadius=1.0f;
//    userNameText.layer.masksToBounds=YES;
//    userNameText.layer.borderColor=[[UIColor grayColor]CGColor];
//    userNameText.layer.borderWidth= 1.0f;
    //userNameText.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.scrollViewBase  addSubview:userNameText];
    
    
    UILabel *mobileNumberLabel= [[UILabel alloc] initWithFrame:CGRectMake(20, 101, 80, 40)];//初始化
    mobileNumberLabel.font = [UIFont fontWithName:@"Arial" size:16];//设置字体名字和字体大小
    mobileNumberLabel.textAlignment = UITextAlignmentCenter;
    // SumItemInfoTextView.backgroundColor=[UIColor lightGrayColor];
    mobileNumberLabel.backgroundColor=[UIColor colorWithRed:(161.0/255.0) green:(238.0 / 255.0) blue:(206.0 / 255.0) alpha:1];
    mobileNumberLabel.text=@"手机号码";
    
    [self.scrollViewBase addSubview:mobileNumberLabel];
    
    mobileNumberText= [[UITextField alloc] initWithFrame:CGRectMake(101, 101, rx.size.width-120, 40)];//初始化
    mobileNumberText.font = [UIFont fontWithName:@"Arial" size:16];//设置字体名字和字体大小
     mobileNumberText.backgroundColor=[UIColor whiteColor];
    //mobileNumberText.textColor=[UIColor grayColor];
    //nameText.text=@"请输入物品名称";
    mobileNumberText.placeholder = @"请输入号码";
    mobileNumberText.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    mobileNumberText.keyboardType=UIKeyboardTypeNumberPad;
    // mobileNumberText.text=@"";
  //  mobileNumberText.borderStyle=UITextBorderStyleLine;
    ///teamNameText.keyboardType=UIKeyboardTypeNumberPad;
    //mobileNumberText.backgroundColor=[[UIColor whiteColor]CGColor];
//    mobileNumberText.layer.cornerRadius=2.0f;
//    mobileNumberText.layer.masksToBounds=YES;
//    mobileNumberText.layer.borderColor=[[UIColor grayColor]CGColor];
//    mobileNumberText.layer.borderWidth= 1.0f;
    //mobileNumberText.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.scrollViewBase  addSubview:mobileNumberText];
    
    
    
    //发送验证码按钮
    CGRect frame = CGRectMake(rx.size.width/2-100, 220, 200, 40);
    UIButton *buttonOK = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonOK.frame = frame;
    [buttonOK setTitle:@"添    加  +" forState: UIControlStateNormal];
    buttonOK.titleLabel.font = [UIFont systemFontOfSize: 16.0];
    //buttonOK.backgroundColor = [UIColor colorWithRed:(46.0/255.0) green:(130.0 / 255.0) blue:(255.0 / 255.0) alpha:1];
    buttonOK.backgroundColor = [UIColor colorWithRed:(228.0/255.0) green:(136.0 / 255.0) blue:(62.0 / 255.0) alpha:1];
    // buttonSendCode.titleLabel.backgroundColor= [UIColor colorWithRed:(46.0/255.0) green:(130.0 / 255.0) blue:(255.0 / 255.0) alpha:1];
    buttonOK.tag = 2000;
    [buttonOK addTarget:self action:@selector(CloseClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollViewBase addSubview:buttonOK];
    //[mobileNumberText release];
    // [infoLabel2 release];
}


-(void)keyboardHideAction:(UITapGestureRecognizer*)tap{  //焦点离开输入名称的时候，隐藏键盘
    [mobileNumberText resignFirstResponder];
    [userNameText resignFirstResponder];
    
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
