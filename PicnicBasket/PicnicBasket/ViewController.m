//
//  ViewController.m
//  PicnicBasket
//
//  Created by 逯晓瞳 on 15/11/11.
//  Copyright © 2015年 逯晓瞳. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *basketTop;
@property (weak, nonatomic) IBOutlet UIImageView *basketBottom;
@property (weak, nonatomic) IBOutlet UIImageView *fabricTop;
@property (weak, nonatomic) IBOutlet UIImageView *fabricBottom;
@property (weak, nonatomic) IBOutlet UIImageView *bug;
@property BOOL bugDead;

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
                                               delay:0.0
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
    [UIView animateWithDuration:3.0
                          delay:0.0
                        options:(UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         self.bug.center = CGPointMake(75, 200);
                     }
                     completion:^(BOOL finished){
                         if ( !self.bugDead ) {
                             [self faceToRight];
                         }
                     }];
}

- (void)faceToRight {
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:(UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         self.bug.transform = CGAffineTransformMakeRotation(M_PI);
                     }
                     completion:^(BOOL finished){
                         if ( !self.bugDead ) {
                             [self moveToRight];
                         }
                     }];
}

- (void)moveToRight {
    [UIView animateWithDuration:3.0
                          delay:0.0
                        options:(UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         self.bug.center = CGPointMake(230, 250);
                     }
                     completion:^(BOOL finished){
                         if ( !self.bugDead ) {
                             [self faceToLeft];
                         }
                     }];
}

- (void)faceToLeft {
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:(UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionBeginFromCurrentState)
                     animations:^{
                         self.bug.transform = CGAffineTransformMakeRotation(0);
                     }
                     completion:^(BOOL finished){
                         if ( !self.bugDead ) {
                             [self moveToLeft];
                         }
                     }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if ( self.bugDead ) {
        return;
    }
    
    NSString *squishPath = [[NSBundle mainBundle]
                            pathForResource:@"squish" ofType:@"caf"];
    NSURL *squishURL = [NSURL fileURLWithPath:squishPath];
    SystemSoundID squishSoundID;
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)squishURL, &squishSoundID);
    AudioServicesPlaySystemSound(squishSoundID);
    
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:self.view];
    CGRect bugRect = [[[self.bug layer] presentationLayer] frame];
    if ( CGRectContainsPoint(bugRect, touchLocation) ) {
        self.bugDead = TRUE;
        
        [UIView animateWithDuration:0.8
                              delay:0.0
                            options:UIViewAnimationOptionBeginFromCurrentState
                         animations:^{
                             self.bug.transform = CGAffineTransformMakeScale(1.25, 0.75);
                         }
                         completion:^(BOOL finished){
                             [UIView animateWithDuration:0.2
                                                   delay:0.0
                                                 options:UIViewAnimationOptionBeginFromCurrentState
                                              animations:^{
                                                  self.bug.alpha = 0;
                                              }
                                              completion:^(BOOL finished){
                                                  [self.bug removeFromSuperview];
                                              }];
                         }];
    }
}
@end
