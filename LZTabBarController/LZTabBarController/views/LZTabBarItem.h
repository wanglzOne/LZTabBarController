//
//  LZTabBarItem.h
//  LZTabBarController
//
//  Created by bhqm on 2017/11/7.
//  Copyright © 2017年 wanglz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZTabBarItem : UIView

/***  TabBar 图片   */
@property (nonatomic, weak) UIImageView *imageView;

/***  TabBar 标题  */
@property (nonatomic, weak) UILabel *titleLabel;

/***  TabBar是否选中 */
@property (nonatomic, assign, getter=isSelected) BOOL selected;

/***  TabBarItem  */
@property (nonatomic, strong) UITabBarItem *tabBarItem;

/***   TabBarItem 个数   */
@property (nonatomic, assign) NSInteger tabBarItemCount;

/***  TabBarItem标题颜色   */
@property (nonatomic, strong) UIColor *itemTitleColor;

/***  TabBarItem选中时标题的颜色 */
@property (nonatomic, strong) UIColor *selectedItemTitleColor;

/*** TabBarItem标题字体大小    */
@property (nonatomic, strong) UIFont *itemTitleFont;

/***  TabBarItem标记字体大小(小红点儿)    */
@property (nonatomic, strong) UIFont *badgeTitleFont;

/***  TabBarItem图片比例   */
@property (nonatomic, assign) CGFloat itemImageRatio;

/***  TabBarItem图片比例初始化方法 */
- (instancetype)initWithItemImageRatio:(CGFloat)itemImageRatio;


@end
