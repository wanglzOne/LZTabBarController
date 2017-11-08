//
//  MianViewController.m
//  LZTabBarController
//
//  Created by bhqm on 2017/11/7.
//  Copyright © 2017年 wanglz. All rights reserved.
//

#import "MianViewController.h"
#import "SubOneViewController.h"
#import "LZTabBarController.h"


@interface MianViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation MianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)btnaction:(id)sender {
    SubOneViewController *subOne = [SubOneViewController new];
    subOne.hidesBottomBarWhenPushed = YES;
    subOne.title = @"subOne";
    [self.navigationController pushViewController:subOne animated:YES];
}
- (IBAction)gotoMineVC:(id)sender {
    [(LZTabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController setSelectedIndex:3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
