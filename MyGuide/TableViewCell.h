//
//  TableViewCell.h
//  HomeManager
//
//  Created by imac on 15-5-19.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
{
    
}
@property (retain, nonatomic) IBOutlet UIImageView *imageView1;
@property (retain, nonatomic) IBOutlet UIImageView *imageView2;
@property (retain, nonatomic) IBOutlet UILabel *textLabel1;
@property (retain, nonatomic) IBOutlet UILabel *textLabel2;
@property (retain, nonatomic) IBOutlet UILabel *textLabel3;
@property (retain, nonatomic) IBOutlet UILabel *textLabel4;

//@property (nonatomic,retain) UIImage *imageView1;
//@property (nonatomic,retain) UIImage *imageView2;
//@property (nonatomic,retain) UILabel *textLabel;
//@property (nonatomic,retain) UILabel *detailTextLabel1;
//@property (nonatomic,retain) UILabel *detailTextLabel2;
//@property (nonatomic,retain) UILabel *detailTextLabel3;
@end
