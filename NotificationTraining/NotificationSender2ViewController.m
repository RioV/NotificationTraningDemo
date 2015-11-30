//
//  NotificationSender2ViewController.m
//  NotificationTraining
//
//  Created by Hoang Minh Nhat on 11/17/15.
//  Copyright © 2015 Hoang Minh Nhat. All rights reserved.
//

#import "NotificationSender2ViewController.h"

@interface NotificationSender2ViewController ()

@end

@implementation NotificationSender2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = NSStringFromClass([self class]);
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SampleNotification" object:[NotificationSender2ViewController class] userInfo:nil];
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
