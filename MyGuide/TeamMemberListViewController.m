//
//  TeamMemberListViewController.m
//  MyGuide
//
//  Created by mac on 15/9/10.
//  Copyright (c) 2015年 home. All rights reserved.
//

#import "TeamMemberListViewController.h"
#import "TableViewCell.h"

@interface TeamMemberListViewController ()

@end

@implementation TeamMemberListViewController

@synthesize tableView = tableView;

@synthesize tableViewCell =_tableViewCell;
@synthesize jsonStrArray=jsonStrArray;
@synthesize inTeamID=inTeamID;

int jsonRow;

int editFlag=0;

int _isLoading=0;
int upFlag;
int downFlag;
int allPageCnt;
int rowCnt;
int nowPage;
static NSString *strIdentifier = @"strIdentifier";


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self addNavigationBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) viewWillAppear:(BOOL)animated
{
    
    //屏幕尺寸
    
    CGRect rx = [ UIScreen mainScreen ].bounds;
    
    _isLoading=0;
    upFlag=0;
    downFlag=0;
    allPageCnt=0;
    nowPage=0;//第一页默认值应该是0
    
    
    NSLog(@"\n\n-----开始加载，初始化第一页-----nowPage:%d",nowPage);
    //开始添加表格
    
    
    //self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,40,rx.size.width,rx.size.height-0)style:UITableViewStylePlain]; //把表格缩小，上面预留一块区域，来介绍产品
    //设置协议，意思就是UITableView类的方法交给了tabView这个对象，让完去完成表格的一些设置操作
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    
    //设定行高
    
    NSLog(@"\n\n-111111111111111111111");
//    
    self.tableView.rowHeight=60;
//    //获得包含tableViewcell的nib文件
    UINib *nib = [UINib nibWithNibName:@"TableViewCell" bundle:nil];
//    //用这个nib文件注册成tableView中表示为strIdentifier的cell
    [self.tableView registerNib:nib forCellReuseIdentifier:strIdentifier];
//    
//    NSLog(@"\n\n-22222222222222222222");
//    
//    
    [self.view addSubview:self.tableView];
//    NSLog(@"\n\n-333333333333333");
//    
    
    //[viewBase addSubview:self.tableView];
    
    // [self.view addSubview:viewBase];
    
    
//    UITapGestureRecognizer*tapGesture00 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(keyboardHideAction:)]; //点击这个视图，隐藏键盘
//    tapGesture00.cancelsTouchesInView = NO;
//    [self.tableView  addGestureRecognizer:tapGesture00];
    
     ///*
   //// [self getDatabaseFilePath];// 先获取数据库文件
    

    //在读取初始化表格数据之前，先初始化表格数据的数组
    jsonStrArray = [[NSMutableArray alloc] init];//一条记录
    // jsonStrArray.removeAllObjects;
    
    [self.jsonStrArray removeAllObjects];//清除数组内容
    
    jsonRow=0;
    
    ////[self selectCnt];
    //[self selectData2:nil :nil];
   // NSLog(@"\n\n-----inObjectType---------:%@",inObjectType);
    ////[self selectData2:nil :inTeamID];
    [self.tableView reloadData];
    nowPage++;
    //[self queryPageRecord];
    
      //*/
    
}

//返回多少个section
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//返回行数，也就是返回数组中所存储数据，也就是section的元素
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return jsonRow;
    //return self.jsonStrArray.count;
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
    UINavigationItem *navigationItem=[[UINavigationItem alloc]initWithTitle:@"团队成员"];
    
    
    
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
