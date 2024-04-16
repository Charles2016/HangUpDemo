//
//  GDLastVC.m
//  NewProject
//
//  Created by 1084-Wangcl-Mac on 2024/4/15.
//  Copyright © 2024 Charles. All rights reserved.
//

#import "GDLastVC.h"

@interface GDLastVC ()

@property (nonatomic, assign) CGPoint lastTouchLocation;

@end

@implementation GDLastVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"最后一页";
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = UIColor.blueColor;
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.height.mas_equalTo(80);
    }];
}

@end
