//
//  HomeVC.m
//  NewProject
//
//  Created by chaolong on 31/10/2016.
//  Copyright © 2016 Charles. All rights reserved.
//

#import "HomeVC.h"
#import "HomeModel.h"

#import "UUID.h"
#import "HXFAlertView.h"
#import "UIView+WaterMark.h"
#import "HttpClient.h"
#import "GDNextVC.h"

@interface HomeVC ()

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"主页";
    
    UIButton *button = InsertButton(self.view, CGRectMake(20, 80, kScreenWidth - 40, 40), 2000, self, @selector(pushAction:), UIButtonTypeCustom);
    [button setBackgroundColor:kColorBlue];
    [button setTitle:@"下一页" forState:UIControlStateNormal];
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = UIColor.grayColor;
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.height.mas_equalTo(80);
    }];
    
}


- (void)pushAction:(UIButton *)button {
    GDNextVC *VC = [[GDNextVC alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
}

@end
