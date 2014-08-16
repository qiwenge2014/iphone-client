//
//  UIViewController+Navigation.m
//  LawOnline
//
//  Created by vic.hu on 14-1-4.
//  Copyright (c) 2014年 vic.hu. All rights reserved.
//

#import "UIViewController+Navigation.h"

@implementation UIViewController (Navigation)
-(void)initNavigationBarWithTopTitle:(NSString *)topTitle leftTitle:(NSString *)leftTitle rightTitle:(NSString *)rightTitle
{
    self.navigationController.navigationBarHidden = NO;
    self.title = topTitle;
    NSDictionary *attributes=[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:20],NSFontAttributeName, nil];
    [self.navigationController.navigationBar setTitleTextAttributes:attributes];
    
    if (leftTitle.length != 0) {
        UIBarButtonItem *leftBtnItem = [[UIBarButtonItem alloc] initWithTitle:leftTitle style:UIBarButtonItemStyleDone target:self action:@selector(leftBtnAction:)];
        [leftBtnItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:18],NSFontAttributeName, nil] forState:UIControlStateNormal];
        self.navigationItem.leftBarButtonItem = leftBtnItem;
    }
    else{
        self.navigationItem.hidesBackButton = YES;
    }
    if (rightTitle.length != 0) {
        UIBarButtonItem *rightBtnItem = [[UIBarButtonItem alloc] initWithTitle:rightTitle style:UIBarButtonItemStyleDone target:self action:@selector(rightBtnAction:)];
        [rightBtnItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:18],NSFontAttributeName, nil] forState:UIControlStateNormal];
        self.navigationItem.rightBarButtonItem = rightBtnItem;
    }
    else{
        self.navigationItem.rightBarButtonItem = nil;
    }
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}
-(void)initNavigationBarWithTopTitle:(NSString *)topTitle leftImgName:(NSString *)leftImgName rightImgName:(NSString *)rightImgName
{
    self.title = topTitle;
    NSDictionary *attributes=[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:20],NSFontAttributeName, nil];
    [self.navigationController.navigationBar setTitleTextAttributes:attributes];
    
    if (leftImgName.length != 0) {
        UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [leftBtn setFrame:CGRectMake(0, 0, 44, 44)];
        [leftBtn setBackgroundImage:[UIImage imageNamed:leftImgName] forState:UIControlStateNormal];
        [leftBtn addTarget:self action:@selector(leftBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *leftBarBtn = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
        self.navigationItem.leftBarButtonItem = leftBarBtn;
    }
    else{
        self.navigationItem.hidesBackButton = YES;
    }
    if (rightImgName.length != 0) {
        UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [rightBtn setFrame:CGRectMake(0, 0, 44, 44)];
        [rightBtn setBackgroundImage:[UIImage imageNamed:rightImgName] forState:UIControlStateNormal];
        [rightBtn addTarget:self action:@selector(rightBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
        self.navigationItem.rightBarButtonItem = rightBarBtn;
    }
    else{
        self.navigationItem.rightBarButtonItem = nil;
    }
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}
-(void)clearNavigation
{
    self.navigationController.navigationBar.topItem.rightBarButtonItem = nil;
	self.navigationController.navigationBar.topItem.leftBarButtonItem = nil;
}
-(void)rightBtnAction:(id)sender
{
    
}
-(void)leftBtnAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
