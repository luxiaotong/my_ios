//
//  ViewController.m
//  Control Fun
//
//  Created by 逯晓瞳 on 15/8/31.
//  Copyright (c) 2015年 逯晓瞳. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *numberField;
@property (nonatomic, retain) UIButton *doneInKeyboardButton;
@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;
@property (weak, nonatomic) IBOutlet UISwitch *leftSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *rightSwitch;
@property (weak, nonatomic) IBOutlet UIButton *doSomethingButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //注册键盘显示通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleKeyboardDidShow:) name:UIKeyboardWillShowNotification object:nil];
    //注册键盘隐藏通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleKeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    //init slider
    self.sliderLabel.text = @"50";
}

-(void)viewWillDisappear:(BOOL)animated{
    //注销键盘显示通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - keyboard
- (IBAction)textFieldDoneEditing:(id)sender {
    
}

- (IBAction)backgroundTap:(id)sender {
    [self.nameField resignFirstResponder];
    [self.numberField resignFirstResponder];
}

#pragma mark - Done in keyboard
// 键盘出现处理事件
- (void)handleKeyboardDidShow:(NSNotification *)notification
{
    // NSNotification中的 userInfo字典中包含键盘的位置和大小等信息
    NSDictionary *userInfo = [notification userInfo];
    // UIKeyboardAnimationDurationUserInfoKey 对应键盘弹出的动画时间
    CGFloat animationDuration = [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    // UIKeyboardAnimationCurveUserInfoKey 对应键盘弹出的动画类型
    NSInteger animationCurve = [[userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] integerValue];
    //数字彩,数字键盘添加“完成”按钮
    if (self.doneInKeyboardButton){
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:animationDuration];//设置添加按钮的动画时间
        [UIView setAnimationCurve:(UIViewAnimationCurve)animationCurve];//设置添加按钮的动画类型
        
        //设置自定制按钮的添加位置(这里为数字键盘添加“完成”按钮)
        self.doneInKeyboardButton.transform=CGAffineTransformMakeTranslation(0, -53);
        
        [UIView commitAnimations];
    }
}

// 键盘消失处理事件
- (void)handleKeyboardWillHide:(NSNotification *)notification
{
    // NSNotification中的 userInfo字典中包含键盘的位置和大小等信息
    NSDictionary *userInfo = [notification userInfo];
    // UIKeyboardAnimationDurationUserInfoKey 对应键盘收起的动画时间
    CGFloat animationDuration = [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    if (self.doneInKeyboardButton.superview)
    {
        [UIView animateWithDuration:animationDuration animations:^{
            //动画内容，将自定制按钮移回初始位置
            self.doneInKeyboardButton.transform=CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            //动画结束后移除自定制的按钮
            [self.doneInKeyboardButton removeFromSuperview];
        }];
    }
}

//点击输入框
- (IBAction)editingDidBegin:(id)sender {
    //初始化数字键盘的“完成”按钮
    if ( self.doneInKeyboardButton.superview==nil ) {
        [self configDoneInKeyBoardButton];
    }
}


//点击输入框
- (IBAction)editingDidEnd:(id)sender {
    NSLog(@"end");
    //动画结束后移除自定制的按钮
    [self.doneInKeyboardButton removeFromSuperview];
    self.doneInKeyboardButton = nil;
}

//初始化，数字键盘“完成”按钮
- (void)configDoneInKeyBoardButton{
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    //初始化
    if (self.doneInKeyboardButton == nil)
    {
        self.doneInKeyboardButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.doneInKeyboardButton setTitle:@"Done" forState:UIControlStateNormal];
        [self.doneInKeyboardButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        self.doneInKeyboardButton.frame = CGRectMake(10, screenHeight, 106, 53);
        
        self.doneInKeyboardButton.adjustsImageWhenHighlighted = NO;
        [self.doneInKeyboardButton addTarget:self action:@selector(finishAction) forControlEvents:UIControlEventTouchUpInside];
    }
    //每次必须从新设定“完成”按钮的初始化坐标位置
    self.doneInKeyboardButton.frame = CGRectMake(10, screenHeight, 106, 53);
    
    //由于ios8下，键盘所在的window视图还没有初始化完成，调用在下一次 runloop 下获得键盘所在的window视图
    [self performSelector:@selector(addDoneButton) withObject:nil afterDelay:0.0f];
}

- (void) addDoneButton {
    //获得键盘所在的window视图
    UIWindow* tempWindow = [[[UIApplication sharedApplication] windows] objectAtIndex:1];
    [tempWindow addSubview:self.doneInKeyboardButton];    // 注意这里直接加到window上
}

//点击“完成”按钮事件，收起键盘
-(void)finishAction {
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];//关闭键盘
}

#pragma mark - slider
- (IBAction)sliderChanged:(UISlider *)sender {
    long progress = lroundf(sender.value);
    self.sliderLabel.text = [NSString stringWithFormat:@"%ld", progress];
}

#pragma mark - switches
- (IBAction)switchChanged:(UISwitch *)sender {
    BOOL isOn = sender.isOn;
    [self.leftSwitch setOn:isOn animated:YES];
    [self.rightSwitch setOn:isOn animated:YES];
}

#pragma mark - segment
- (IBAction)toggleControls:(UISegmentedControl *)sender {
    if ( sender.selectedSegmentIndex == 0 ) {
        self.leftSwitch.hidden = NO;
        self.rightSwitch.hidden = NO;
        self.doSomethingButton.hidden = YES;
    } else {
        self.leftSwitch.hidden = YES;
        self.rightSwitch.hidden = YES;
        self.doSomethingButton.hidden = NO;
    }
}

#pragma mark - button
- (IBAction)buttonPressed:(UIButton *)sender {
    
}


@end
