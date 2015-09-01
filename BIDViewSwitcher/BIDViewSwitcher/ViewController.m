//
//  ViewController.m
//  BIDViewSwitcher
//
//  Created by 逯晓瞳 on 15/8/28.
//
//

#import "ViewController.h"
#import "BIDBlueViewController.h"
#import "BIDYellowViewController.h"

@interface ViewController ()

@property (nonatomic) BIDBlueViewController *blueViewController;
@property (nonatomic) BIDYellowViewController *yellowViewController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.blueViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"blue"];
    [self.view insertSubview:self.blueViewController.view atIndex:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    if ( !self.blueViewController.view.superview ) {
        self.blueViewController = nil;
    } else {
        self.yellowViewController = nil;
    }
}

- (IBAction)switchViews:(UIBarButtonItem *)sender {
    [UIView beginAnimations:@"view flip" context:nil];
    [UIView setAnimationDuration:0.4];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    if ( !self.yellowViewController.view.superview ) {
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight
                               forView:self.view
                                 cache:YES];
        [self.blueViewController.view removeFromSuperview];
        
        if ( !self.yellowViewController ) {
            self.yellowViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"yellow"];
        }
        [self.view insertSubview:self.yellowViewController.view atIndex:0];
    } else {
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
                               forView:self.view
                                 cache:YES];
        [self.yellowViewController.view removeFromSuperview];
        
        if ( !self.blueViewController ) {
            self.blueViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"blue"];
        }
        [self.view insertSubview:self.blueViewController.view atIndex:0];
    }
    
    [UIView commitAnimations];
}
@end
