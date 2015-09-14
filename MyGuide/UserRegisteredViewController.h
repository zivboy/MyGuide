//
//  UserRegisteredViewController.h
//  MyGuide
//
//  Created by mac on 15/9/10.
//  Copyright (c) 2015年 home. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserRegisteredViewController : UIViewController

@property (strong, nonatomic) UINavigationController *navController;
@property (nonatomic, retain) IBOutlet UITextField *mobileNumberText; //手机号码
@property (nonatomic, retain) IBOutlet UITextField *verificationCodeText; //验证码
@property (nonatomic, retain) IBOutlet UIButton *buttonSendCode; //发送验证码按钮
@end
