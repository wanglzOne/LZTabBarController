//
//  LZTabBar.m
//  LZTabBarController
//
//  Created by bhqm on 2017/11/7.
//  Copyright © 2017年 wanglz. All rights reserved.
//

#import "LZTabBar.h"
#import "LZTabBarItem.h"


@interface LZTabBar ()

@end

@implementation LZTabBar


- (void)setTabBarItemCount:(NSInteger)tabBarItemCount {
    _tabBarItemCount = tabBarItemCount;
    
    for (LZTabBarItem *tabBarItem in self.tabBarItems) {
        tabBarItem.tabBarItemCount = tabBarItemCount;
    }
}

- (void)setItemImageRatio:(CGFloat)itemImageRatio {
    _itemImageRatio = itemImageRatio;
    
    for (LZTabBarItem *tabBarItem in self.tabBarItems) {
        tabBarItem.itemImageRatio = itemImageRatio;
    }
}

- (NSMutableArray *)tabBarItems {
    if (_tabBarItems == nil) {
        _tabBarItems = [[NSMutableArray alloc] init];
    }
    return _tabBarItems;
}

- (void)addTabBarItem:(UITabBarItem *)item {
    
    LZTabBarItem *tabBarItem = [[LZTabBarItem alloc] initWithItemImageRatio:self.itemImageRatio];
    
    tabBarItem.badgeTitleFont         = self.badgeTitleFont;
    tabBarItem.itemTitleFont          = self.itemTitleFont;
    tabBarItem.itemTitleColor         = self.itemTitleColor;
    tabBarItem.selectedItemTitleColor = self.selectedItemTitleColor;
    
    tabBarItem.tabBarItemCount = self.tabBarItemCount;
    
    tabBarItem.tabBarItem = item;
    
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonClick:)];
    [tabBarItem addGestureRecognizer:tapGR];
    
    [self addSubview:tabBarItem];
    
    [self.tabBarItems addObject:tabBarItem];
    
    if (self.tabBarItems.count == 1) {
        
        [self onClickTabBarItem:tabBarItem];
    }
}

- (void)buttonClick:(UITapGestureRecognizer *)tapGR {
    LZTabBarItem *tabBarItem = (LZTabBarItem *)tapGR.view;
    
    [self onClickTabBarItem:tabBarItem];
}

- (void)onClickTabBarItem:(LZTabBarItem *)tabBarItem {
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedItemFrom:to:)]) {
        [self.delegate tabBar:self didSelectedItemFrom:self.selectedItem.tabBarItem.tag to:tabBarItem.tag];
    }
    
    self.selectedItem.selected = NO;
    self.selectedItem = tabBarItem;
    self.selectedItem.selected = YES;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGFloat w = self.frame.size.width;
    CGFloat h = self.frame.size.height;
    
    int count = (int)self.tabBarItems.count;
    CGFloat itemY = 0;
    CGFloat itemW = w / self.subviews.count;
    CGFloat itemH = h;
    
    for (int index = 0; index < count; index++) {
        
        LZTabBarItem *tabBarItem = self.tabBarItems[index];
        tabBarItem.tag = index;
        CGFloat itemX = index * itemW;
        tabBarItem.frame = CGRectMake(itemX, itemY, itemW, itemH);
    }
}

@end
