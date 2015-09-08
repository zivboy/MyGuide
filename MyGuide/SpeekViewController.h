//
//  SpeekViewController.h
//  MyGuide
//
//  Created by mac on 15/9/4.
//  Copyright (c) 2015年 home. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpeekViewController : UIViewController
@property (nonatomic, strong) IBOutlet UIProgressView *levelMeter;
@property (nonatomic, strong) IBOutlet UILabel *consoleLabel;
@property (nonatomic, strong) IBOutlet UIButton *recordButton;
@property (nonatomic, strong) IBOutlet UIButton *playButton;

@property (nonatomic, assign) BOOL isRecording;
@property (nonatomic, assign) BOOL isPlaying;

@property (nonatomic, copy) NSString *filename;

- (IBAction)recordButtonClicked:(id)sender;
- (IBAction)playButtonClicked:(id)sender;
@end
