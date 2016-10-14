//
//  ViewController.m
//  CoreAnimation
//
//  Created by xhm on 16/9/7.
//  Copyright © 2016年 xhm. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "AppDelegate.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor grayColor];
//    CALayer*blueLayer=[CALayer layer];
//    blueLayer.frame=CGRectMake(50.0f, 50.0f, 100.0f, 100.0f);
//    blueLayer.backgroundColor=[UIColor blueColor].CGColor;

    UIImage*image=[UIImage imageNamed:@"03.jpg"];
    self.layerView.layer.contents=(__bridge id)(image.CGImage);
  
    self.layerView.layer.contentsGravity=kCAGravityCenter;
      //图层图像按比例填充 效果同下
//    self.layerView.layer.contentsGravity=kCAGravityResizeAspect;
//    self.layerView.contentMode=UIViewContentModeScaleAspectFit;
    
//    self.layerView.layer.contentsScale=image.scale;
    self.layerView.layer.contentsScale=[UIScreen mainScreen].scale;
    //修建图层的内容
    self.layerView.layer.masksToBounds=YES;
    self.layerView.layer.contentsRect=CGRectMake(0, 0, 1, 1);
    UITapGestureRecognizer * tap01 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap01:)];
    [self.layerView addGestureRecognizer:tap01];
    // Do any additional setup after loading the view, typically from a nib.
    CALayer *blueLayer = [CALayer layer];
    blueLayer.frame = CGRectMake(50.0f, 50.0f, 100.0f, 100.0f);
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    
    //set controller as layer delegate
    blueLayer.delegate = self;
    
    //ensure that layer backing image uses correct scale
    blueLayer.contentsScale = [UIScreen mainScreen].scale; //add layer to our view
    [self.layerView.layer addSublayer:blueLayer];
    
    //force layer to redraw
    [blueLayer display];
}
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    //draw a thick red circle
    CGContextSetLineWidth(ctx, 10.0f);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
}
-(void)tap01:(UITapGestureRecognizer*)pan
{
    SecondViewController*vc=[[SecondViewController alloc]init];
    UINavigationController*nav=[[UINavigationController alloc]initWithRootViewController:vc];
    AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;
    app.window.rootViewController = nav;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
