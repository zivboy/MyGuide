//
//  FourthViewController.m
//  MyGuide
//
//  Created by mac on 15-8-30.
//  Copyright (c) 2015年 home. All rights reserved.
//

#import "FourthViewController.h"
#import <BaiduMapAPI/BMapKit.h>//引入所有的头文件

@interface FourthViewController ()

@end

@implementation FourthViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"我的", @"我的");
        self.tabBarItem.image = [UIImage imageNamed:@"2-2"];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
     _mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
    
    _mapView.delegate = self;
    _mapView.mapType = BMKMapTypeStandard;
    _mapView.zoomEnabled=YES;
    _mapView.scrollEnabled = YES;
    _mapView.zoomLevel =15;
    _mapView.showsUserLocation=NO;
     [_mapView setCompassPosition:CGPointMake(180,320)];
    
    //调节初始地图坐标
    _mapView.centerCoordinate = CLLocationCoordinate2DMake(29.544606, 106.530635);
    
     _locationService = [[BMKLocationService alloc] init];
    
    
    
//    if (_mapView.userLocation.location != nil)
//    {
//        NSLog(@"定位成功");
//        coor = [[_mapView.userLocation location] coordinate];
//        NSLog(@"%f",coor->latitude);
//        NSLog(@"%f",coor->longitude);
//    }
//    coor = [[_mapView.userLocation location] coordinate];
//    BMKCoordinateRegion viewRegion = BMKCoordinateRegionMake(*(coor), BMKCoordinateSpanMake(0.02f,0.02f));
//    BMKCoordinateRegion adjustedRegion = [_mapView regionThatFits:viewRegion];
//    [_mapView setRegion:adjustedRegion animated:YES];
    
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(10, 400, 30, 30);
    [button addTarget:self action:@selector(dobutton:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"定位" forState:UIControlStateNormal];
    
    [self.view addSubview:button];
    
    //定位之后的箭头
    [BMKLocationService setLocationDesiredAccuracy:kCLLocationAccuracyNearestTenMeters];
    BMKLocationViewDisplayParam* displayParam = [[BMKLocationViewDisplayParam alloc] init];
    displayParam.isRotateAngleValid = true;//跟随态旋转角度是否生效
    displayParam.isAccuracyCircleShow = true;//精度圈是否显示
    displayParam.locationViewOffsetX = 0;//定位偏移量（经度）
    displayParam.locationViewOffsetY = 0;//定位偏移量（纬度）
    [_mapView updateLocationViewWithParam:displayParam];
    
    //进入地图开始显示自己的坐标
    [_locationService startUserLocationService];
    _mapView.showsUserLocation = YES;
    _mapView.userTrackingMode = BMKUserTrackingModeNone;
    
    [_mapView setBuildingsEnabled:YES];//使用3D楼宇
    
    
    //切换为卫星图
   // [_mapView setMapType:BMKMapTypeSatellite];
    //切换为普通地图
    [_mapView setMapType:BMKMapTypeStandard];
    self.view = _mapView;
    
    [self startLocation];
    
    //定位功能
//    //设置定位精确度，默认：kCLLocationAccuracyBest
//    [BMKLocationServicesetLocationDesiredAccuracy:kCLLocationAccuracyNearestTenMeters];
//    //指定最小距离更新(米)，默认：kCLDistanceFilterNone
//    [BMKLocationServicesetLocationDistanceFilter:100.f];
//    
//    //初始化BMKLocationService
//    _locService = [[BMKLocationService alloc]init];
//    _locService.delegate = self;
//    //启动LocationService
//    [_locService startUserLocationService];
    //定位功能
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
}
- (void)viewWillDisappear:(BOOL)animated
{
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




//开始添加标注代码

- (void) viewDidAppear:(BOOL)animated {
    // 添加一个PointAnnotation
    BMKPointAnnotation* annotation = [[BMKPointAnnotation alloc]init];
    CLLocationCoordinate2D coor;
    coor.latitude = 39.915;
    coor.longitude = 116.404;
    annotation.coordinate = coor;
    annotation.title = @"这里是北京";
    [_mapView addAnnotation:annotation];
}
// Override
- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[BMKPointAnnotation class]]) {
        BMKPinAnnotationView *newAnnotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"myAnnotation"];
        newAnnotationView.pinColor = BMKPinAnnotationColorPurple;
        newAnnotationView.animatesDrop = YES;// 设置该标注点动画显示
        return newAnnotationView;
    }
    return nil;
}
//结束添加标注代码



- (void)startLocation
{
    [_locationService startUserLocationService];
    _mapView.userTrackingMode = BMKUserTrackingModeNone;//设置定位的状态
}//调用这个方法开始定位,如果不想定位了可以在适当的位置把定位关闭


//加载自己的经纬度，并显示到地图上
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    NSLog(@"当前位置%f,%f", userLocation.location.coordinate.latitude, userLocation.location.coordinate.longitude);
    _mapView.centerCoordinate = userLocation.location.coordinate;
    [_mapView updateLocationData:userLocation];
 }




//定位代码
//实现相关delegate 处理位置信息更新
//处理方向变更信息
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    NSLog(@"heading is %@",userLocation.heading);
      [_mapView updateLocationData:userLocation];
}

//定位代码


#pragma mark mapViewDelegate 代理方法
- (void)mapView:(BMKMapView *)mapView1 didUpdateUserLocation:(BMKUserLocation *)userLocation
{
    BMKCoordinateRegion region;
    region.center.latitude  = userLocation.location.coordinate.latitude;
    region.center.longitude = userLocation.location.coordinate.longitude;
    region.span.latitudeDelta  = 0.2;
    region.span.longitudeDelta = 0.2;
    if (_mapView)
    {
        _mapView.region = region;
        NSLog(@"当前的坐标是: %f,%f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    }
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
