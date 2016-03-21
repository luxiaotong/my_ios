//
//  ViewController.m
//  TestForSixDigitPassward
//
//  Created by 逯晓瞳 on 16/3/18.
//  Copyright © 2016年 逯晓瞳. All rights reserved.
//

#import "ViewController.h"
#import "TFDigitTextField.h"

@interface ViewController () <UITextFieldDelegate, TFDigitTextFieldDelegate>

@property (weak, nonatomic) IBOutlet TFDigitTextField *digit1;
@property (weak, nonatomic) IBOutlet TFDigitTextField *digit2;
@property (weak, nonatomic) IBOutlet TFDigitTextField *digit3;
@property (weak, nonatomic) IBOutlet TFDigitTextField *digit4;
@property (weak, nonatomic) IBOutlet TFDigitTextField *digit5;
@property (weak, nonatomic) IBOutlet TFDigitTextField *digit6;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _digit1.delegate = self;
    _digit2.delegate = self;
    _digit3.delegate = self;
    _digit4.delegate = self;
    _digit5.delegate = self;
    _digit6.delegate = self;
    
    _digit1.digitDelegate = self;
    _digit2.digitDelegate = self;
    _digit3.digitDelegate = self;
    _digit4.digitDelegate = self;
    _digit5.digitDelegate = self;
    _digit6.digitDelegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Move the cursor when input or delete
- (BOOL)textField:(TFDigitTextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSArray *digitArr = @[_digit1, _digit2, _digit3, _digit4, _digit5, _digit6];
    NSInteger i = 0;

    for ( i = 0; i < 5; i ++ ) {
        if ( [textField isEqual:digitArr[i]] ) {
            if ( string.length == 0 && i < 5 && [[digitArr[i+1] text] length] > 0) {
                break;
            }
            [digitArr[i+1] becomeFirstResponder];
            textField.text = string;
            break;
        }
    }
    if ( i == 5 ) {
        textField.text = string;
        if ( string.length > 0 ) {
            [digitArr[i] resignFirstResponder];
        }
    }
    
    return NO;
}

//Move the cursor when user select field.
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSArray *digitArr = @[_digit1, _digit2, _digit3, _digit4, _digit5, _digit6];
    NSInteger i = 0;
    if ( textField.text.length > 0 ) {
        //Find the nearest empty field.
        for ( i = 0; i < 5; i++ ) {
            if ( [[digitArr[i+1] text] length] == 0) {
                [digitArr[i] becomeFirstResponder];
                break;
            }
        }
        if ( i == 5 ) {
            [digitArr[i] becomeFirstResponder];
        }
    }
}

- (void)backToLastTextField:(TFDigitTextField *)textField {
    NSArray *digitArr = @[_digit1, _digit2, _digit3, _digit4, _digit5, _digit6];
    NSInteger i = 0;
    for ( i = 5; i > 0; i-- ) {
        if ( [textField isEqual:digitArr[i]] ) {
            [digitArr[i-1] becomeFirstResponder];
            [digitArr[i-1] setText:@""];
            break;
        }
    }
}

@end
