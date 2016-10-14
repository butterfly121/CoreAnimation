//
//  SecondViewController.m
//  CoreAnimation
//
//  Created by xhm on 16/9/7.
//  Copyright © 2016年 xhm. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    UIImage *image = [UIImage imageNamed:@"04.jpg"];
    //set igloo sprite
    [self addSpriteImage:image withContentRect:CGRectMake(0, 0, 0.5, 0.5) toLayer:self.iglooView.layer];
    //set cone sprite
    [self addSpriteImage:image withContentRect:CGRectMake(0.5, 0, 0.5, 0.5) toLayer:self.coneView.layer];
    //set anchor sprite
    [self addSpriteImage:image withContentRect:CGRectMake(0, 0.5, 0.5, 0.5) toLayer:self.anchorView.layer];
    //set spaceship sprite
    [self addSpriteImage:image withContentRect:CGRectMake(0.5, 0.5, 0.5, 0.5) toLayer:self.shipView.layer];

    UIImage *image1 = [UIImage imageNamed:@"123.png"];
    
    //set button 1
    [self addStretchableImage:image1 withContentCenter:CGRectMake(0, 0, 1, 1) toLayer:self.button1.layer];
    
    //set button 2
    [self addStretchableImage:image1 withContentCenter:CGRectMake(0, 0, 1, 1) toLayer:self.button2.layer];
    // Do any additional setup after loading the view from its nib.
}
- (void)addSpriteImage:(UIImage *)image withContentRect:(CGRect)rect toLayer:(CALayer *)layer
//set image
{
    layer.contents = (__bridge id)image.CGImage;
    
    //scale contents to fit
    layer.contentsGravity = kCAGravityResizeAspect;
    
    //set contentsRect
   
    layer.contentsRect = rect;
}
- (void)addStretchableImage:(UIImage *)image withContentCenter:(CGRect)rect toLayer:(CALayer *)layer
{
    //set image
    layer.contents = (__bridge id)image.CGImage;
    
//     layer.contentsGravity = kCAGravityResizeAspect;
    //set contentsCenter
    layer.contentsCenter = rect;
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
