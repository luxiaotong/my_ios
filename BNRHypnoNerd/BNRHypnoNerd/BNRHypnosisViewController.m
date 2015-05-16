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
}

- (void)viewWillAppear:(BOOL)animated {
    CGRect hypnosisFrame        = self.view.bounds;
    BNRHypnosistView *hypnoView = [[BNRHypnosistView alloc] initWithFrame:hypnosisFrame];
    
    CGRect textFieldFrame       = CGRectMake(30, 100, 320, 30);
    UITextField *textField      = [[UITextField alloc] initWithFrame:textFieldFrame];
    textField.placeholder       = @"input";
    textField.backgroundColor   = [UIColor whiteColor];
    textField.delegate          = self;
    
    //[textField becomeFirstResponder];
    
    [hypnoView addSubview:textField];
    [self.view addSubview:hypnoView];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    for ( int i = 0; i < 20; i ++ ) {
        CGFloat textX = arc4random() % 300;
        CGFloat textY = arc4random() % 600;
        CGFloat textW = 100;
        CGFloat textH = 30;
        CGRect textViewFrame = CGRectMake(textX, textY, textW, textH);
        UITextView *textView = [[UITextView alloc] initWithFrame:textViewFrame];
        
        textView.text           = textField.text;
        textView.backgroundColor= [UIColor clearColor];
        textView.textColor      = [UIColor blackColor];
        textView.editable       = NO;
        
        [self.view addSubview:textView];
    }
    
    [textField resignFirstResponder];
    return YES;
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
