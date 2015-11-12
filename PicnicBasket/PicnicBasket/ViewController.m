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
@property (weak, nonatomic) IBOutlet UIImageView *bug;

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
    
    [UIView animateWithDuration:2.0
                          delay:1.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.basketTop.frame = basketTopFrame;
                         self.basketBottom.frame = basketBottomFrame;
                     }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:2.0
                                               delay:1.0
                                             options:UIViewAnimationOptionCurveEaseOut
                                          animations:^{
                                              self.fabricTop.frame = fabricTopFrame;
                                              self.fabricBottom.frame = fabricBottomFrame;
                                          }completion:^(BOOL finished){
                                          }];
                     }];
    
    //Move for bug
    [self moveToLeft];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)moveToLeft {
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:(UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         [UIView setAnimationDelegate:self];
                         [UIView setAnimationDidStopSelector:@selector(faceToRight)];
                         self.bug.center = CGPointMake(75, 200);
                     }
                     completion:^(BOOL finished){
                     }];
}

- (void)faceToRight {
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:(UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         [UIView setAnimationDelegate:self];
                         [UIView setAnimationDidStopSelector:@selector(moveToRight)];
                         self.bug.transform = CGAffineTransformMakeRotation(M_PI);
                     }
                     completion:^(BOOL finished){
                     }];
}

- (void)moveToRight {
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:(UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         [UIView setAnimationDelegate:self];
                         [UIView setAnimationDidStopSelector:@selector(faceToLeft)];
                         self.bug.center = CGPointMake(230, 250);
                     }
                     completion:^(BOOL finished){
                     }];
}

- (void)faceToLeft {
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:(UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         [UIView setAnimationDelegate:self];
                         [UIView setAnimationDidStopSelector:@selector(moveToLeft)];
                         self.bug.transform = CGAffineTransformMakeRotation(0);
                     }
                     completion:^(BOOL finished){
                     }];
}

@end
