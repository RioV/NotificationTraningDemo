//
//  KVOSampleViewController.m
//  NotificationTraining
//
//  Created by Hoang Minh Nhat on 11/17/15.
//  Copyright © 2015 Hoang Minh Nhat. All rights reserved.
//

#import "KVOSampleViewController.h"
#import <Foundation/Foundation.h>
@interface KVOSampleViewController () <UITextFieldDelegate>

@property (nonatomic, copy) NSString *textFieldContent;
@property (nonatomic, weak) IBOutlet UITextField *textField;

@end

@implementation KVOSampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = NSStringFromClass([self class]);
    self.textFieldContent = @"This is content of text field";
    [self addObserver:self forKeyPath:@"textFieldContent" options:NSKeyValueObservingOptionNew context:NULL];
    [self addObserver:self forKeyPath:@"self.view.frame" options:NSKeyValueObservingOptionNew context:NULL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {

//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    NSLog(@"KEY = %@", keyPath);
    NSLog(@"Object = %@", [object description]);
    NSLog(@"Change = %@", [change description]);
    NSLog(@"Context = %@", context);
    if ([keyPath isEqualToString:@"textFieldContent"]) {
        self.textField.backgroundColor = [UIColor yellowColor];
    } else if ([keyPath isEqualToString:@"self.view.frame"]) {
        if (self.view.backgroundColor == [UIColor grayColor]) {
            self.view.backgroundColor = [UIColor whiteColor];
        } else {
            self.view.backgroundColor = [UIColor grayColor];
        }
    }
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    self.textField.backgroundColor = [UIColor clearColor];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.textFieldContent = self.textField.text;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.textField resignFirstResponder];
    return YES;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"self.view.frame"];
    [self removeObserver:self forKeyPath:@"textFieldContent"];
}

@end
