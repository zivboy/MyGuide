//
//  AddTeamMemberViewController.h
//  MyGuide
//
//  Created by mac on 15/9/10.
//  Copyright (c) 2015年 home. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddTeamMemberViewController : UIViewController

@property (nonatomic, retain) IBOutlet UITextField *userNameText; //名字
@property (nonatomic, retain) IBOutlet UITextField *mobileNumberText; //手机号码
@property (strong, nonatomic) IBOutlet UIScrollView *scrollViewBase;

@end
