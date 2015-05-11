//
//  BNRQuizViewController.h
//  BNRQuiz
//
//  Created by 逯晓瞳 on 15/5/11.
//  Copyright (c) 2015年 逯晓瞳. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BNRQuizViewController : UIViewController

@property (nonatomic) NSArray *questionArray;
@property (nonatomic) NSArray *answerArray;
@property (nonatomic) int indexOfQuestion;
@property (nonatomic) int indexOfAnswer;

@end
