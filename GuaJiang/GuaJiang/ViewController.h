//
//  ViewController.h
//  GuaJiang
//
//  Created by 刘伟 on 16/6/27.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *beforeImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
- (IBAction)refreshClicked:(UIButton *)sender;

@end

