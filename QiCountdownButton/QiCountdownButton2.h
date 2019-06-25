//
//  QiCountdownButton2.h
//  QiCountdownButton
//
//  Created by huangxianshuai on 2019/6/25.
//  Copyright © 2019 HuangXianshuai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QiCountdownButton2 : UIButton

@property (nonatomic, assign) NSUInteger timeInterval;
@property (nonatomic, assign) NSInteger maxInteger;
@property (nonatomic, assign) NSInteger minInteger;

- (void)startCountdown;
- (void)stopCountdown;

@end

NS_ASSUME_NONNULL_END
