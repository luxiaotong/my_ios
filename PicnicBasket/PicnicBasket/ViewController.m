//
//  ViewController.m
//  PicnicBasket
//
//  Created by 逯晓瞳 on 15/11/11.
//  Copyright © 2015年 逯晓瞳. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *basketTop;
@property (weak, nonatomic) IBOutlet UIImageView *basketBottom;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGRect basketTopFrame = self.basketTop.frame;
    basketTopFrame.origin.y = - self.view.bounds.size.height;
    CGRect basketBottomFrame = self.basketBottom.frame;
    basketBottomFrame.origin.y = self.view.bounds.size.height;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2.0];
    [UIView setAnimationDelay:2.0];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    
    self.basketTop.frame = basketTopFrame;
    self.basketBottom.frame = basketBottomFrame;
    
    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
