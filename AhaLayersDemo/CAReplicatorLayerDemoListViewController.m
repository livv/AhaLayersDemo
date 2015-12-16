//
//  CAReplicatorLayerDemoListViewController.m
//  AhaLayersDemo
//
//  Created by wei on 15/12/16.
//  Copyright © 2015年 livv. All rights reserved.
//

#import "CAReplicatorLayerDemoListViewController.h"
#import "CAReplicatorLayerDemoViewController.h"

@interface CAReplicatorLayerDemoListViewController ()

@property (nonatomic, strong) NSArray * titles;

@end

@implementation CAReplicatorLayerDemoListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"CAReplicatorLayer";
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.titles.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"hehe"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"hehe"];
    }
    
    cell.textLabel.text = self.titles[indexPath.row];
    
    return cell;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    CAReplicatorLayerDemoViewController * _vc = [[CAReplicatorLayerDemoViewController alloc] initWithNibName:@"CAReplicatorLayerDemoViewController" bundle:nil];
    _vc.index = indexPath.row;
    _vc.titleStr = self.titles[indexPath.row];
    [self.navigationController pushViewController:_vc animated:YES];
}


#pragma mark - getters

- (NSArray *)titles {
    if (!_titles) {
        _titles = @[@"Volume bars",
                    @"Activity indicator",
                    @"Follow the leader"];
    }
    return _titles;
}

@end
