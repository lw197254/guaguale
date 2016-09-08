//
//  ViewController.m
//  GuaJiang
//
//  Created by 刘伟 on 16/6/27.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "ViewController.h"
#import "CarBezierPathView.h"
@interface ViewController ()
@property(nonatomic,assign)BOOL isTouch;
@property(nonatomic,strong)NSArray* dataArray;
@property(nonatomic,strong)NSMutableArray* pointArray;
@property(nonatomic,strong)CarBezierPathView*pathView;
@property(nonatomic,strong)CAShapeLayer *layer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = @[@"您中奖了",@"谢谢参与",@"谢谢参与",@"谢谢参与",@"谢谢参与",@"谢谢参与",@"谢谢参与",@"谢谢参与",@"谢谢参与",@"谢谢参与",@"谢谢参与",@"谢谢参与",@"谢谢参与",@"谢谢参与",@"您中奖了"];
    NSInteger i = arc4random() %(self.dataArray.count);
    self.titleLabel.text = self.dataArray[i];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch*touch = [touches anyObject];
    if (touch.view==self.beforeImageView) {
        self.isTouch = YES;
    }else{
      CGPoint point = [touch locationInView:self.view];
        if (!self.pointArray) {
            self.pointArray = [[NSMutableArray alloc]init];
        }
        [self.pointArray addObject:[NSValue valueWithCGPoint:point]];
        
    }
    
}
- (IBAction)drawLine:(id)sender {

    UIBezierPath*bezierPath = [UIBezierPath bezierPath];
    if (!self.layer) {
        self.layer = [CAShapeLayer layer];
        self.layer.strokeColor = [UIColor greenColor].CGColor;
        self.layer.fillColor  = [UIColor clearColor].CGColor;
    }
    
    [_pointArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CGPoint point = [obj CGPointValue];
        if (idx == 0) {
            [bezierPath moveToPoint:point];
        }else{
            [bezierPath addLineToPoint:point];
        }
        
        
    }];
    self.layer.path = bezierPath.CGPath;
    
    
    [self.view.layer addSublayer:self.layer];
    [_pointArray removeAllObjects];
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.isTouch = NO;
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (self.isTouch) {
        UIGraphicsBeginImageContext(self.beforeImageView.frame.size);
        [self.beforeImageView.image drawInRect:self.beforeImageView.bounds];
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView:touch.view];
        CGRect rect = CGRectMake(point.x-10, point.y-10, 20, 20);
        CGContextClearRect(UIGraphicsGetCurrentContext(), rect);
        self.beforeImageView.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)refreshClicked:(UIButton *)sender {
    self.beforeImageView.image = [UIImage imageNamed:@"pre10.jpg"];
    NSInteger i = arc4random() %(self.dataArray.count);
    self.titleLabel.text = self.dataArray[i];
}
@end
