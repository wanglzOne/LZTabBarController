//
//  LZTabBar.h
//  LZTabBarController
//
//  Created by bhqm on 2017/11/7.
//  Copyright © 2017年 wanglz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LZTabBar, LZTabBarItem;

@protocol LZTabBarDelegate <NSObject>

@optional

/***  选择item(当前item --> 目的item) */
- (void)tabBar:(LZTabBar *)tabBarView didSelectedItemFrom:(NSInteger)from to:(NSInteger)to;

@end

@interface LZTabBar : UIView

/***  item标题颜色   */
@property (nonatomic, strong) UIColor *itemTitleColor;

/***  item选中时标题颜色 */
@property (nonatomic, strong) UIColor *selectedItemTitleColor;

/***  item标题字体大小    */
@property (nonatomic, strong) UIFont *itemTitleFont;

/***  item上标记字体大小(小红点儿上字体大小)    */
@property (nonatomic, strong) UIFont *badgeTitleFont;

/***  item图片比例(图片的位置)   */
@property (nonatomic, assign) CGFloat itemImageRatio;

/***  item个数 */
@property (nonatomic, assign) NSInteger tabBarItemCount;

/***  选中的item */
@property (nonatomic, strong) LZTabBarItem *selectedItem;

/***  item数组    */
@property (nonatomic, strong) NSMutableArray *tabBarItems;

/***  TabBar代理 delegate */
@property (nonatomic, weak) id<LZTabBarDelegate> delegate;

/***  添加TabBarItem(类似今日头条中间的"+")   */
- (void)addTabBarItem:(UITabBarItem *)item;

@end
