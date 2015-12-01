/**
 * Copyright (C) 2015 NTT DOCOMO, INC. All Rights Reserved.
 */

#import "MainTableViewController.h"

@interface MainTableViewController ()
//
@property (nonatomic, strong) NSArray *mainContents;

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
     self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.mainContents = [NSArray arrayWithObjects:@"Notification Sample", @"KVO Sample", nil];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.mainContents count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mainTableViewCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [self.mainContents objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath == [NSIndexPath indexPathForRow:0 inSection:0]) {
        [self performSegueWithIdentifier:@"FromMainToNotification" sender:self];
    } else if (indexPath == [NSIndexPath indexPathForRow:1 inSection:0]) {
        [self performSegueWithIdentifier:@"MainToKVO" sender:self];
    }
}

#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"FromMainToNotification"]) {
        
    }
}

@end