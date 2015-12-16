//
//  LayersViewController.m
//  AhaLayersDemo
//
//  Created by wei on 15/12/16.
//  Copyright © 2015年 livv. All rights reserved.
//

#import "LayersViewController.h"
#import "CAReplicatorLayerDemoListViewController.h"

@interface LayersViewController ()

@end

@implementation LayersViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"layers";
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"hehe"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"hehe"];
    }
    
    cell.textLabel.text = @"CAReplicatorLayer";
    
    return cell;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    CAReplicatorLayerDemoListViewController * _vc = [[CAReplicatorLayerDemoListViewController alloc] initWithNibName:@"CAReplicatorLayerDemoListViewController" bundle:nil];
    [self.navigationController pushViewController:_vc animated:YES];
}


@end
