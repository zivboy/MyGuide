//
//  AppDelegate.h
//  MyGuide
//
//  Created by imac on 15-8-29.
//  Copyright (c) 2015年 home. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BaiduMapAPI/BMapKit.h>//引入所有的头文件
#import "OggSpeexViewController.h"


@interface AppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate>{
      BMKMapManager *_mapManager;
       
}

@property (strong, nonatomic) UIWindow *window;

//@property (strong, nonatomic) UITabBarController *tabBarController;
@property (strong, nonatomic) UIViewController *viewController;
@end
