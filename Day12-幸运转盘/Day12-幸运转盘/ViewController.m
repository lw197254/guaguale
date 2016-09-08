//
//  ViewController.m
//  Day12-幸运转盘
//
//  Created by Yin jianxun on 16/6/22.
//  Copyright © 2016年 Yin jianxun. All rights reserved.
//

#import "ViewController.h"
#import "YZLuckyWheel.h"
#import "LoginViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *luckWheelImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置背景
    self.view.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"LuckyBackground"].CGImage);
    
    //在storyBoard中设置 三个按钮
    //参照board
    
    //设置转盘 从XIB文件中加载
    YZLuckyWheel *wheelView = [YZLuckyWheel loadWheelXib];
//    wheelView.center = self.view.center;
    [self.view addSubview:wheelView];
    [wheelView sizeToFit];
   
    UIButton*button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"打开" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(next:) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundColor:[UIColor blackColor]];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    [wheelView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:wheelView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:wheelView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.luckWheelImageView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:10]];
    
     [self.view addConstraint:[NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:wheelView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:20]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    [button addConstraint:[NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:60]];
    [button addConstraint:[NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:44]];
    //转动
//    [wheelView start];
    NSMutableArray*array  = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i < 12; i++) {
        GiftModel*model = [[GiftModel alloc]init];
        model.index = i;
        if (i%4) {
            model.canSelectedLevel = 3;
        }
        model.giftName = [NSString stringWithFormat:@"%ld",(long)i];
        [array addObject:model];
    }
    wheelView.giftArray =array ;
    
}
- (IBAction)loginClicked:(UIButton *)sender {
    LoginViewController*login = [[LoginViewController alloc]init];
    [self presentViewController:login animated:YES completion:nil];
}
-(void)next:(UIButton*)sender{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
