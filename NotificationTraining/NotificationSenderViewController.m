//
//  NotificationSenderViewController.m
//  NotificationTraining
//
//  Created by Hoang Minh Nhat on 11/17/15.
//  Copyright © 2015 Hoang Minh Nhat. All rights reserved.
//

#import "NotificationSenderViewController.h"

@interface NotificationSenderViewController ()

@end

@implementation NotificationSenderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = NSStringFromClass([self class]);
}

- (IBAction)invokeButtonSendNotification:(UIButton *)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SampleNotification" object:self userInfo:nil];
}

- (IBAction)invokeButtonSendNotificationWithUserInfo:(UIButton *)sender {
    NSDictionary *sampleUserInfo = @{@"sample_id": @"This is sample ID",
                                     @"sample_content" : @"This is sample content"};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SampleNotification" object:self userInfo:sampleUserInfo];
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
