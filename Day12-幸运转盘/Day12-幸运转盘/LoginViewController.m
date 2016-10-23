//
//  LoginViewController.m
//  Day12-幸运转盘
//
//  Created by 刘伟 on 16/8/8.
//  Copyright © 2016年 Yin jianxun. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //buzhidaonizaiganshenme
    ///zhendebuzhidao zenmeban
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)backClicked:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
