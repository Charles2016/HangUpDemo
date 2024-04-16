//
//  ClassifyVC.m
//  NewProject
//
//  Created by chaolong on 31/10/2016.
//  Copyright © 2016 Charles. All rights reserved.
//

#import "ClassifyVC.h"

@interface ClassifyVC ()

@end

@implementation ClassifyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"分类";
    self.view.backgroundColor = kColorOrange;
    [self loadingStart];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self loadingSuccess];
    });
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
