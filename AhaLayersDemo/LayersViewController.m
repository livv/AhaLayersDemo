//
//  LayersViewController.m
//  AhaLayersDemo
//
//  Created by wei on 15/12/16.
//  Copyright © 2015年 livv. All rights reserved.
//

#import "LayersViewController.h"
#import "CAReplicatorLayerDemoListViewController.h"
#import "CAEmitterLayerDemoViewController.h"
#import "CAGradientLayerDemoListViewController.h"

@interface LayersViewController ()

@property (nonatomic, strong) NSArray * titles;

@end

@implementation LayersViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"layers";
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
    
    if ([self.titles[indexPath.row] isEqualToString:@"CAReplicatorLayer"]) {
        
        CAReplicatorLayerDemoListViewController * _vc = [[CAReplicatorLayerDemoListViewController alloc] initWithNibName:@"CAReplicatorLayerDemoListViewController" bundle:nil];
        [self.navigationController pushViewController:_vc animated:YES];
        
    } else if ([self.titles[indexPath.row] isEqualToString:@"CAEmitterLayer"]) {
        
        [CAEmitterLayerDemoViewController pushWithViewController:self];
        
    } else if ([self.titles[indexPath.row] isEqualToString:@"CAGradientLayer"]) {
        
        [CAGradientLayerDemoListViewController pushWithViewController:self];
        
    } else if ([self.titles[indexPath.row] isEqualToString:@"CAEmitterLayer"]) {
        
    } else if ([self.titles[indexPath.row] isEqualToString:@"CAEmitterLayer"]) {
        
    } else if ([self.titles[indexPath.row] isEqualToString:@"CAEmitterLayer"]) {
        
    }
    
    
}


#pragma mark - getters 

- (NSArray *)titles {
    if (!_titles) {
        _titles = @[@"CAReplicatorLayer",
                    @"CAEmitterLayer",
                    @"CAGradientLayer"];
    }
    return _titles;
}

@end
