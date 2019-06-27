//
//  QiCountdownButton2.m
//  QiCountdownButton
//
//  Created by huangxianshuai on 2019/6/25.
//  Copyright © 2019 HuangXianshuai. All rights reserved.
//

#import "QiCountdownButton2.h"

@interface QiCountdownButton2 ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSInteger currentInteger;
@property (nonatomic, assign) NSTimeInterval didEnterBackgroundTimestamp;

@end

@implementation QiCountdownButton2


#pragma mark - Public functions

- (void)startCountdown {
    
    _currentInteger = _maxInteger;
    [self setTitle:[NSString stringWithFormat:@"%@s", @(MAX(_currentInteger, _minInteger)).stringValue] forState:UIControlStateDisabled];
    
    if (!_timer) {
        __weak typeof(self) weakSelf = self;
        _timer = [NSTimer timerWithTimeInterval:_timeInterval repeats:YES block:^(NSTimer * _Nonnull timer) {
            [weakSelf setTitle:[NSString stringWithFormat:@"%@s", @(MAX(--weakSelf.currentInteger, weakSelf.minInteger)).stringValue] forState:UIControlStateDisabled];
            if (weakSelf.currentInteger <= weakSelf.minInteger) {
                [weakSelf stopCountdown];
            }
        }];
    }
    
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidEnterBackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillEnterForeground:) name:UIApplicationWillEnterForegroundNotification object:nil];
}

- (void)stopCountdown {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillEnterForegroundNotification object:nil];
    
    [self setEnabled:YES];
    
    [_timer invalidate];
    _timer = nil;
}


#pragma mark - Notifications

- (void)applicationDidEnterBackground:(id)sender {
    NSLog(@"%s", __func__);
    
    _didEnterBackgroundTimestamp = [[NSDate date] timeIntervalSince1970];
}

- (void)applicationWillEnterForeground:(id)sender {
    NSLog(@"%s", __func__);
    
    NSTimeInterval willEnterForegroundTimestamp = [[NSDate date] timeIntervalSince1970];
    
    NSInteger onBackgroundSeconds = floor((_didEnterBackgroundTimestamp == 0)? 0: (willEnterForegroundTimestamp - _didEnterBackgroundTimestamp));
    _currentInteger -= onBackgroundSeconds;
}

- (void)dealloc {
    NSLog(@"%s", __func__);
    
    [self stopCountdown];
}

@end
