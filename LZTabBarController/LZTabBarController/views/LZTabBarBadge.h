//
//  LZTabBarBadge.h
//  LZTabBarController
//
//  Created by bhqm on 2017/11/7.
//  Copyright © 2017年 wanglz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZTabBarBadge : UIButton
/***  TabBarItem标记值 */
@property (nonatomic, copy) NSString *badgeValue;

/***  TabBarItem个数   */
@property (nonatomic, assign) NSInteger tabBarItemCount;

/***  TabBarItem标记字体大小    */
@property (nonatomic, strong) UIFont *badgeTitleFont;

@end
