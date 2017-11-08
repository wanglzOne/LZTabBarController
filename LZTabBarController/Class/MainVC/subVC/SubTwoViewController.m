//
//  SubTwoViewController.m
//  LZTabBarController
//
//  Created by bhqm on 2017/11/8.
//  Copyright © 2017年 wanglz. All rights reserved.
//

#import "SubTwoViewController.h"
#import "LZTabBarController.h"

@interface SubTwoViewController ()

@end

@implementation SubTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)popToRootVC:(id)sender {
    
    /**
     * Call this for iOS 11.0-
     *
     * You could also add this method to your custom navigationController's method: `-popToRootViewControllerAnimated:`, like this:
     *
     * - (NSArray *)popToRootViewControllerAnimated:(BOOL)animated {
     *     [super popToRootViewControllerAnimated:animated];
     *
     *     if ([UIDevice currentDevice].systemVersion.floatValue < 11.0) {
     *         [(LCTabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController removeOriginControls];
     *     }
     * }
     */
    [self.navigationController popToRootViewControllerAnimated:YES];

    if ([UIDevice currentDevice].systemVersion.floatValue < 11.0) {
        [(LZTabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController removeOriginControls];
    }
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
