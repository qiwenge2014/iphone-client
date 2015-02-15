//
//  UIViewController+Navigation.h
//  LawOnline
//
//  Created by vic.hu on 14-1-4.
//  Copyright (c) 2014年 vic.hu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Navigation)

-(void)initNavigationBarWithTopTitle:(NSString *)topTitle leftTitle:(NSString *)leftTitle rightTitle:(NSString *)rightTitle;

-(void)initNavigationBarWithTopTitle:(NSString *)topTitle leftImgName:(NSString *)leftImgName rightImgName:(NSString *)rightImgName;

-(void)clearNavigation;

-(void)setNavTitle:(NSString *)title;

@end
