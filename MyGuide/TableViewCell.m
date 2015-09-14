//
//  TableViewCell.m
//  HomeManager
//
//  Created by imac on 15-5-19.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_imageView1 release];
    [_imageView2 release];
    [_textLabel1 release];
    [_textLabel2 release];
    [_textLabel3 release];
    [_textLabel4 release];
    [super dealloc];
}
@end
