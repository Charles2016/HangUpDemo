//
//  GDNextVC.m
//  NewProject
//
//  Created by 1084-Wangcl-Mac on 2024/4/15.
//  Copyright © 2024 Charles. All rights reserved.
//

#import "GDNextVC.h"
#import "GDLastVC.h"

@interface GDNextVC ()

@end

@implementation GDNextVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"中间页";
    UIButton *button = InsertButton(self.view, CGRectMake(20, 80, kScreenWidth - 40, 40), 2000, self, @selector(pushAction:), UIButtonTypeCustom);
    [button setBackgroundColor:kColorBlue];
    [button setTitle:@"下一页" forState:UIControlStateNormal];
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = UIColor.redColor;
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.height.mas_equalTo(80);
    }];
    
}


#pragma mark - buttonActions
- (void)pushAction:(UIButton *)button {
    GDLastVC *VC = [[GDLastVC alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
}

@end
