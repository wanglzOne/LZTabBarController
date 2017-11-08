//
//  SubOneViewController.m
//  LZTabBarController
//
//  Created by bhqm on 2017/11/8.
//  Copyright © 2017年 wanglz. All rights reserved.
//

#import "SubOneViewController.h"
#import "SubTwoViewController.h"

@interface SubOneViewController ()

@end

@implementation SubOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)gotoSubTwo:(id)sender {
    SubTwoViewController *subTwo = [SubTwoViewController new];
    subTwo.title = @"subTwo";
    [self.navigationController pushViewController:subTwo animated:YES];
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
