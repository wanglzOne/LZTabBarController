//
//  LZTabBarController.m
//  LZTabBarController
//
//  Created by bhqm on 2017/11/7.
//  Copyright © 2017年 wanglz. All rights reserved.
//

#import "LZTabBarController.h"
#import "LZTabBarConst.h"
#import "LZTabBarItem.h"


@interface LZTabBarController ()<LZTabBarDelegate>

@end

@implementation LZTabBarController

@synthesize badgeTitleFont;
@synthesize itemTitleFont;
@synthesize itemTitleColor;
@synthesize selectedItemTitleColor;

- (void)setBadgeTitleFont:(UIFont *)aBadgeTitleFont {
    badgeTitleFont = aBadgeTitleFont;
    
    self.lzTabBar.badgeTitleFont = aBadgeTitleFont;
}

- (void)setItemTitleFont:(UIFont *)aItemTitleFont {
    itemTitleFont = aItemTitleFont;
    
    self.lzTabBar.itemTitleFont = aItemTitleFont;
}

- (void)setItemTitleColor:(UIColor *)aItemTitleColor {
    itemTitleColor = aItemTitleColor;
    
    self.lzTabBar.itemTitleColor = aItemTitleColor;
}

- (void)setItemImageRatio:(CGFloat)itemImageRatio {
    _itemImageRatio = itemImageRatio;
    
    self.lzTabBar.itemImageRatio = itemImageRatio;
}

- (void)setSelectedItemTitleColor:(UIColor *)aSelectedItemTitleColor {
    selectedItemTitleColor = aSelectedItemTitleColor;
    
    self.lzTabBar.selectedItemTitleColor = aSelectedItemTitleColor;
}

- (UIFont *)itemTitleFont {
    if (!itemTitleFont) {
        itemTitleFont = [UIFont systemFontOfSize:10.0f];
    }
    return itemTitleFont;
}

- (UIFont *)badgeTitleFont {
    if (!badgeTitleFont) {
        badgeTitleFont = [UIFont systemFontOfSize:11.0f];
    }
    return badgeTitleFont;
}

- (UIColor *)itemTitleColor {
    if (!itemTitleColor) {
        itemTitleColor = kColorForTabBar(117, 117, 117);
    }
    return itemTitleColor;
}

- (UIColor *)selectedItemTitleColor {
    if (!selectedItemTitleColor) {
        selectedItemTitleColor = kColorForTabBar(234, 103, 7);
    }
    return selectedItemTitleColor;
}

#pragma mark -

- (void)loadView {
    
    [super loadView];
    
    self.itemImageRatio = 0.70f;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.tabBar addSubview:({
        
        LZTabBar *tabBar = [[LZTabBar alloc] init];
        tabBar.frame     = self.tabBar.bounds;
        tabBar.delegate  = self;
        
        tabBar.badgeTitleFont         = self.badgeTitleFont;
        tabBar.itemTitleFont          = self.itemTitleFont;
        tabBar.itemTitleColor         = self.itemTitleColor;
        tabBar.itemImageRatio         = self.itemImageRatio;
        tabBar.selectedItemTitleColor = self.selectedItemTitleColor;
        
        self.lzTabBar = tabBar;
    })];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleTabBarItemChanged)
                                                 name:kNotificationTabBarItemChanged object:nil];
}

- (void)handleTabBarItemChanged {
    [self hideOriginControls];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self hideOriginControls];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self hideOriginControls];
}

- (void)hideOriginControls {
    if ([UIDevice currentDevice].systemVersion.floatValue >= 1.0) {
        // iOS 11.0+
        [self.tabBar.subviews enumerateObjectsUsingBlock:^(__kindof UIView * obj, NSUInteger idx, BOOL * stop) {
            if ([obj isKindOfClass:[UIControl class]]) {
                [obj setHidden:YES];
            }
        }];
    } else {
        // TODO: fix iOS 11.0-
        
    }
}

- (void)removeOriginControls {
    [self hideOriginControls];
}

- (void)addChildViewController:(UIViewController *)childController {
    [super addChildViewController:childController];
    
    self.lzTabBar.tabBarItemCount = self.viewControllers.count;
    
    UIImage *selectedImage = childController.tabBarItem.selectedImage;
    childController.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [self.lzTabBar addTabBarItem:childController.tabBarItem];
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    
    [super setSelectedIndex:selectedIndex];
    
    self.lzTabBar.selectedItem.selected = NO;
    self.lzTabBar.selectedItem = self.lzTabBar.tabBarItems[selectedIndex];
    self.lzTabBar.selectedItem.selected = YES;
}

#pragma mark - XXTabBarDelegate Method

- (void)tabBar:(LZTabBar *)tabBarView didSelectedItemFrom:(NSInteger)from to:(NSInteger)to {
    
    self.selectedIndex = to;
    if (self.LZTabbarBlock) {
        self.LZTabbarBlock(from, to);
    }
    NSLog(@"from===%ld  to====%ld",from,to);
    
}

@end
