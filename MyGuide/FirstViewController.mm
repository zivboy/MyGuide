//
//  FirstViewController.m
//  MyGuide
//
//  Created by imac on 15-8-29.
//  Copyright (c) 2015年 home. All rights reserved.
//

#import "FirstViewController.h"
#import "RDVTabBarController.h"
#import "RDVTabBarItem.h"
#import "GeocodeDemoViewController.h"
#import "OggSpeexViewController.h"
#import "UserRegisteredViewController.h"
#import "CreateTeamViewController.h"
#import "AddTeamMemberViewController.h"
#import "TeamMemberListViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"行程", @"行程");
        
        self.tabBarItem.image = [UIImage imageNamed:@"9-2"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [[self rdv_tabBarItem] setBadgeValue:@"99+"];
    if (self.rdv_tabBarController.tabBar.translucent) {
        UIEdgeInsets insets = UIEdgeInsetsMake(0,
                                               0,
                                               CGRectGetHeight(self.rdv_tabBarController.tabBar.frame),
                                               0);
        
       
    }
    
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(selectOpenHomeViewAction:)];
    self.navigationItem.leftBarButtonItem = backButton;
    
    
    [self addButton1];
}

- (NSUInteger)supportedInterfaceOrientations {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        return UIInterfaceOrientationMaskAll;
    } else {
        return UIInterfaceOrientationMaskPortrait;
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        return YES;
    }
    return toInterfaceOrientation == UIInterfaceOrientationPortrait;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addButton1
{
    UIButton* button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button1.frame = CGRectMake(10, 120, 120, 60);
    [button1 addTarget:self action:@selector(openGeocode:) forControlEvents:UIControlEventTouchUpInside];
    [button1 setTitle:@"根据地址获取坐标，并且标注" forState:UIControlStateNormal];
    
    [self.view addSubview:button1];
    
    
    
    UIButton* button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.frame = CGRectMake(10, 120+70, 120, 60);
    [button2 addTarget:self action:@selector(openOggSpeex:) forControlEvents:UIControlEventTouchUpInside];
    [button2 setTitle:@"语音录制" forState:UIControlStateNormal];
    
    [self.view addSubview:button2];
    
    
    UIButton* button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button3.frame = CGRectMake(10, 120+70+70, 120, 60);
    [button3 addTarget:self action:@selector(openUserRegistered:) forControlEvents:UIControlEventTouchUpInside];
    [button3 setTitle:@"用户注册" forState:UIControlStateNormal];
    
    [self.view addSubview:button3];
    
    UIButton* button4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button4.frame = CGRectMake(10+120+10, 120, 120, 60);
    [button4 addTarget:self action:@selector(openCreateTeam:) forControlEvents:UIControlEventTouchUpInside];
    [button4 setTitle:@"组建团队" forState:UIControlStateNormal];
    
    [self.view addSubview:button4];
    UIButton* button5 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button5.frame = CGRectMake(10+120+10, 120+70, 120, 60);
    [button5 addTarget:self action:@selector(openAddTeamMember:) forControlEvents:UIControlEventTouchUpInside];
    [button5 setTitle:@"添加成员" forState:UIControlStateNormal];
    
    [self.view addSubview:button5];
    
    
    UIButton* button6= [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button6.frame = CGRectMake(10+120+10, 120+70+70, 120, 60);
    [button6 addTarget:self action:@selector(openTeamMemberList:) forControlEvents:UIControlEventTouchUpInside];
    [button6 setTitle:@"团队成员" forState:UIControlStateNormal];
    
    [self.view addSubview:button6];
}

-(void)openGeocode:(id)sender{
    //创建一个viewcontroller
    GeocodeDemoViewController *geocodeDemoViewController =[[[GeocodeDemoViewController alloc] init] autorelease];
//    oneItemImageView.id=id;
//    oneItemImageView.name=name;
//    oneItemImageView.pic_name1=pic_name1;
//    oneItemImageView.pic_name2=pic_name2;
//    oneItemImageView.pic_name3=pic_name3;
//    oneItemImageView.pic_name4=pic_name4;
//    oneItemImageView.pic_path=pic_path;
//    oneItemImageView.state=state;
//    oneItemImageView.sum_id=sum_id;
//    oneItemImageView.get_date=get_date;
//    oneItemImageView.type=type;
//    oneItemImageView.buy_price=buy_price;
//    NSLog(@"------------------------name:%@",oneItemImageView.name);
//    NSLog(@"------------------------sum_id:%@",oneItemImageView.sum_id);
    //初始化UINavigationController(方式一)
//    self.tabBarController = [[[UINavigationController alloc] initWithRootViewController:geocodeDemoViewController ] autorelease ];
//    
//    
// 
//    //                                                              nil]];
//    //跳转到FirstView页面
//    [self presentViewController:self.tabBarController animated:YES completion:nil];
    
     [self presentModalViewController:geocodeDemoViewController animated:YES];

    
}



-(void)openOggSpeex:(id)sender{
    //创建一个viewcontroller
     OggSpeexViewController *oggSpeexViewController =[[[OggSpeexViewController alloc] init] autorelease];
 
    
    [self presentModalViewController:oggSpeexViewController animated:YES];
    
    
}



-(void)openUserRegistered:(id)sender{
    //创建一个viewcontroller
    UserRegisteredViewController *userRegisteredViewController =[[[UserRegisteredViewController alloc] init] autorelease];
    
    
    [self presentModalViewController:userRegisteredViewController animated:YES];
    
    
}

-(void)openCreateTeam:(id)sender{
    //创建一个viewcontroller
    CreateTeamViewController *createTeamViewController =[[[CreateTeamViewController alloc] init] autorelease];
    
    
    [self presentModalViewController:createTeamViewController animated:YES];
    
    
}

-(void)openAddTeamMember:(id)sender{
    //创建一个viewcontroller
    AddTeamMemberViewController *addTeamMemberViewController =[[[AddTeamMemberViewController alloc] init] autorelease];
    
    
    [self presentModalViewController:addTeamMemberViewController animated:YES];
    
    
}

-(void)openTeamMemberList:(id)sender{
    //创建一个viewcontroller
    TeamMemberListViewController *teamMemberListViewController =[[[TeamMemberListViewController alloc] init] autorelease];
    
    
    [self presentModalViewController:teamMemberListViewController animated:YES];
    
    
}



@end
