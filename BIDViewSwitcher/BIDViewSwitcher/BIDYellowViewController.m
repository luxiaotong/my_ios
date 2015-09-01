//
//  BIDYellowViewController.m
//  BIDViewSwitcher
//
//  Created by 逯晓瞳 on 15/8/28.
//
//

#import "BIDYellowViewController.h"

@interface BIDYellowViewController ()

@end

@implementation BIDYellowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)yellowButtonPressed:(UIButton *)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Yellow"
                                                    message:@"You pressed yellow button"
                                                   delegate:nil
                                          cancelButtonTitle:@"Yep, I did."
                                          otherButtonTitles:nil];
    [alert show];
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
