/**
 * Copyright (C) 2013-2015 NTT DOCOMO, INC. All Rights Reserved.
 */

#import "NotificationViewController.h"
#import "NotificationSender2ViewController.h"

@interface NotificationViewController ()

@property (nonatomic, weak) IBOutlet UILabel *labelNotification1;
@property (nonatomic, weak) IBOutlet UILabel *labelNotification2;
@property (nonatomic, weak) IBOutlet UILabel *labelNotification3;

@end

@implementation NotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = NSStringFromClass([self class]);
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateUIWhenReceivedNotification:) name:@"SampleNotification" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateUIWhenReceivedNotification2:) name:@"SampleNotification" object:[NotificationSender2ViewController class]];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)updateUIWhenReceivedNotification:(NSNotification *)notificationInfo {
    if (notificationInfo.userInfo == nil) {
        NSString *stringMessage = notificationInfo.name;
        stringMessage = [stringMessage stringByAppendingString:[notificationInfo.object description]];
        self.labelNotification1.text = stringMessage;
    } else if (notificationInfo.userInfo != nil) {
        NSString *stringMessage = notificationInfo.name;
        stringMessage = [stringMessage stringByAppendingString:[notificationInfo.object description]];
        stringMessage = [stringMessage stringByAppendingString:[notificationInfo.userInfo description]];
        self.labelNotification2.text = stringMessage;
    }
}

- (void)updateUIWhenReceivedNotification2:(NSNotification *)notificationInfo {
    NSString *stringMessage = notificationInfo.name;
    stringMessage = [stringMessage stringByAppendingString:[notificationInfo.object description]];
    self.labelNotification3.text = stringMessage;
}

- (IBAction)invokeButtonNext:(UIButton *)sender {
    [self performSegueWithIdentifier:@"FromNotificationToNotificationDetail" sender:self];
}

- (IBAction)invokeButtonNotification2:(UIButton *)sender {
    [self performSegueWithIdentifier:@"NotificationToSender2" sender:self];
}

@end