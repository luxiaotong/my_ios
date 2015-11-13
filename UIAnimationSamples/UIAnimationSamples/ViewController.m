//
//  ViewController.m
//  UIAnimationSamples
//
//  Created by 逯晓瞳 on 15/11/13.
//  Copyright © 2015年 逯晓瞳. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Animation.h"
#import "AnimationCurvePicker.h"
#import "FakeHUD.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *movingButton;

@end

static int curveValues[] = {
    UIViewAnimationOptionCurveEaseInOut,
    UIViewAnimationOptionCurveEaseIn,
    UIViewAnimationOptionCurveEaseOut,
    UIViewAnimationOptionCurveLinear
};

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    curvesList = [[NSMutableArray alloc] initWithObjects:@"EaseInOut",@"EaseIn",@"EaseOut",@"Linear", nil];
    selectedCurveIndex = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnMoveTo:(UIButton *)sender {
    CGPoint targetPoint = CGPointMake(sender.center.x - self.movingButton.frame.size.width/2,
                                      sender.frame.origin.y - self.movingButton.frame.size.height);
    [self.movingButton moveTo:targetPoint duration:1.0 option:curveValues[selectedCurveIndex]];
}

- (IBAction)btnDownUnder:(UIButton *)sender {
    [self.movingButton downUnder:1.0 option:curveValues[selectedCurveIndex]];
}

- (IBAction) btnZoom:(UIButton *)sender {
    pickerView = [AnimationCurvePicker newAnimationCurvePicker:self];
    pickerView.center = sender.center;
    [self.view addSubviewWithZoomInAnimation:pickerView
                                    duration:1.0
                                      option:curveValues[selectedCurveIndex]];
}


#pragma mark - animation curves picker

// handling the picker, that is a simple tableview in this example
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [curvesList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = [curvesList objectAtIndex:indexPath.row];
    
    if (indexPath.row == selectedCurveIndex)
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    else
        cell.accessoryType = UITableViewCellAccessoryNone;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Select the Animation Curve to be used";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return @"Curves will not affect total duration but instant speed and acceleration";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    if (selectedCurveIndex != indexPath.row)
    {
        NSIndexPath *oldPath = [NSIndexPath indexPathForRow:selectedCurveIndex inSection:indexPath.section];
        cell = [tableView cellForRowAtIndexPath:oldPath];
        cell.accessoryType = UITableViewCellAccessoryNone;
        
        selectedCurveIndex = (int) indexPath.row;
    }
    
    if (pickerView)
    {
        [pickerView removeWithZoomOutAnimation:1.0 option:curveValues[selectedCurveIndex]];
        pickerView = nil;
    }
}

- (IBAction)btnHUD:(UIButton *)sender {
    FakeHUD *theSubView = [FakeHUD newFakeHUD];
    [self.view addSubviewWithFadeAnimation:theSubView duration:1.0 option:curveValues[selectedCurveIndex]];
}


@end
