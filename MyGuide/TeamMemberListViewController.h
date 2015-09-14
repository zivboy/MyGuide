//
//  TeamMemberListViewController.h
//  MyGuide
//
//  Created by mac on 15/9/10.
//  Copyright (c) 2015年 home. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCell.h"

@interface TeamMemberListViewController : UIViewController

@property(strong,nonatomic)UITableView *tableView;
@property(strong,nonatomic)UITableViewCell *tableViewCell;
@property(strong,nonatomic) NSMutableArray *jsonStrArray;
@property (nonatomic, strong) NSString *inTeamID;
@end
