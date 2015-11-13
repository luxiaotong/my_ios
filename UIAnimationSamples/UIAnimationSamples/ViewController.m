//
//  ViewController.m
//  UIAnimationSamples
//
//  Created by 逯晓瞳 on 15/11/13.
//  Copyright © 2015年 逯晓瞳. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Animation.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *movingButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnMoveTo:(UIButton *)sender {
    CGPoint targetPoint = CGPointMake(sender.center.x - self.movingButton.frame.size.width/2,
                                      sender.frame.origin.y - self.movingButton.frame.size.height);
    [self.movingButton moveTo:targetPoint duration:1.0 option:0];
}
- (IBAction)btnDownUnder:(UIButton *)sender {
    [self.movingButton downUnder];
}

@end
