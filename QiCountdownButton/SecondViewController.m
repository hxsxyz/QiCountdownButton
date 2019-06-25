//
//  SecondViewController.m
//  QiCountdownButton
//
//  Created by huangxianshuai on 2019/6/25.
//  Copyright © 2019 HuangXianshuai. All rights reserved.
//

#import "SecondViewController.h"
#import "QiCountdownButton2.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    QiCountdownButton2 *countdownButton = [QiCountdownButton2 buttonWithType:UIButtonTypeCustom];
    countdownButton.timeInterval = 1.0;
    countdownButton.maxInteger = 20;
    countdownButton.minInteger = 0;
    
    [countdownButton setTitle:@"点击开始倒计时" forState:UIControlStateNormal];
    [countdownButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [countdownButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateDisabled];
    [countdownButton addTarget:self action:@selector(countdownButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    countdownButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    countdownButton.titleLabel.font = [UIFont systemFontOfSize:17.0];
    [countdownButton sizeToFit];
    
    countdownButton.center = (CGPoint){CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds)};
    
    [self.view addSubview:countdownButton];
}


#pragma mark - Action functions

- (void)countdownButtonClicked:(QiCountdownButton2 *)sender {
    
    [sender setEnabled:NO];
    [sender startCountdown];
}


#pragma mark -

- (void)dealloc {
    
    NSLog(@"%s", __func__);
}

@end
