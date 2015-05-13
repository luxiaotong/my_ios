//
//  BNRReminderViewController.m
//  BNRHypnoNerd
//
//  Created by 逯晓瞳 on 15/5/12.
//  Copyright (c) 2015年 逯晓瞳. All rights reserved.
//

#import "BNRReminderViewController.h"

@interface BNRReminderViewController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation BNRReminderViewController

- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if ( self ) {
        self.tabBarItem.title = @"reminder";
        UIImage *timeImage    = [UIImage imageNamed:@"Time.png"];
        self.tabBarItem.image = timeImage;
    }
    
    return self;
}

- (IBAction)remind:(id)sender
{
    NSLog(@"%@", self.datePicker.date);
    UILocalNotification *localReminder = [[UILocalNotification alloc] init];
    localReminder.alertBody = @"Hypnotize me!";
    localReminder.fireDate  = self.datePicker.date;
    [[UIApplication sharedApplication] scheduleLocalNotification:localReminder];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSDate *nowDate = [NSDate dateWithTimeIntervalSinceNow:60];
    self.datePicker.minimumDate = nowDate;
}

@end
