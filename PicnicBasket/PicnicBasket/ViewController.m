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
@property (weak, nonatomic) IBOutlet UIImageView *fabricTop;
@property (weak, nonatomic) IBOutlet UIImageView *fabricBottom;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGRect basketTopFrame = self.basketTop.frame;
    basketTopFrame.origin.y = - self.view.bounds.size.height;
    CGRect basketBottomFrame = self.basketBottom.frame;
    basketBottomFrame.origin.y = self.view.bounds.size.height;
    
    CGRect fabricTopFrame = self.fabricTop.frame;
    fabricTopFrame.origin.y = -self.view.bounds.size.height;
    CGRect fabricBottomFrame = self.fabricBottom.frame;
    fabricBottomFrame.origin.y = self.view.bounds.size.height;
    
    [UIView animateWithDuration:5.0
                          delay:2.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.basketTop.frame = basketTopFrame;
                         self.basketBottom.frame = basketBottomFrame;
                     }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:5.0
                                               delay:2.0
                                             options:UIViewAnimationOptionCurveEaseOut
                                          animations:^{
                                              self.fabricTop.frame = fabricTopFrame;
                                              self.fabricBottom.frame = fabricBottomFrame;
                                          }completion:^(BOOL finished){
                                              
                                          }];
                     }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
