//
//  BNRHypnosisViewController.m
//  BNRHypnoNerd
//
//  Created by 逯晓瞳 on 15/5/11.
//  Copyright (c) 2015年 逯晓瞳. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosistView.h"

@interface BNRHypnosisViewController ()

@end

@implementation BNRHypnosisViewController

- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if ( self ) {
        self.tabBarItem.title = @"hypnosis";
        UIImage *timeImage    = [UIImage imageNamed:@"Hypno.png"];
        self.tabBarItem.image = timeImage;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    CGRect hypnosisFrame = self.view.bounds;
    self.view = [[BNRHypnosistView alloc] initWithFrame:hypnosisFrame];
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
