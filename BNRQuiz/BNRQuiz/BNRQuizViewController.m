//
//  BNRQuizViewController.m
//  BNRQuiz
//
//  Created by 逯晓瞳 on 15/5/11.
//  Copyright (c) 2015年 逯晓瞳. All rights reserved.
//

#import "BNRQuizViewController.h"

@interface BNRQuizViewController ()

@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;

//- (IBAction)questionButton:(id)sender;
//- (IBAction)answerButton:(id)sender;
@end

@implementation BNRQuizViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.questionLabel.text = @"Press button";
    self.answerLabel.text   = @"Press button";
    
    self.questionArray      = @[@"111111", @"222222", @"333333"];
    self.answerArray        = @[@"aaaaaa", @"bbbbbb", @"cccccc"];
    self.indexOfQuestion    = 0;
    self.indexOfAnswer      = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)questionButton:(id)sender
{
    if ( self.indexOfQuestion == 3 ) {
        self.indexOfQuestion = 0;
    }
    
    self.questionLabel.text = self.questionArray[self.indexOfQuestion];

    self.indexOfAnswer = self.indexOfQuestion;
    self.indexOfQuestion ++;
}

- (IBAction)answerButton:(id)sender
{
    if ( self.indexOfAnswer == 3 ) {
        self.indexOfAnswer = 0;
    }
    
    self.answerLabel.text = self.answerArray[self.indexOfAnswer];
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
