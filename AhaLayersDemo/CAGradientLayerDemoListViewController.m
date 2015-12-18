//
//  CAGradientLayerDemoListViewController.m
//  AhaLayersDemo
//
//  Created by wei on 15/12/18.
//  Copyright © 2015年 livv. All rights reserved.
//

#import "CAGradientLayerDemoListViewController.h"
#import "CAGradientLayerDemoViewController.h"

@interface CAGradientLayerDemoListViewController ()

@property (nonatomic, strong) NSArray * titles;

@end

@implementation CAGradientLayerDemoListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"CAGradientLayer";
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
    
    CAGradientLayerDemoViewController * _vc = [[CAGradientLayerDemoViewController alloc] initWithNibName:@"CAGradientLayerDemoViewController"
                                                                                                  bundle:nil];
    _vc.index = indexPath.row;
    _vc.titleStr = self.titles[indexPath.row];
    [self.navigationController pushViewController:_vc animated:YES];
}


#pragma mark - getters

- (NSArray *)titles {
    if (!_titles) {
        _titles = @[@"Process bar",
                    @"Background"];
    }
    return _titles;
}



+ (void)pushWithViewController:(UIViewController *)vc {
    
    NSAssert(vc.navigationController, @".._..");
    
    if (vc.navigationController) {
        
        CAGradientLayerDemoListViewController * _vc = [[CAGradientLayerDemoListViewController alloc] initWithNibName:@"CAGradientLayerDemoListViewController" bundle:nil];
        
        [vc.navigationController pushViewController:_vc animated:YES];
    }
}

@end
