//
//  FourthViewController.h
//  MyGuide
//
//  Created by mac on 15-8-30.
//  Copyright (c) 2015年 home. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BaiduMapAPI/BMapKit.h>//引入所有的头文件

@interface FourthViewController : UIViewController  {
   IBOutlet  BMKMapView *_mapView;
    BMKLocationService *_locationService;
    CLLocationCoordinate2D *coor; 
}

@end
