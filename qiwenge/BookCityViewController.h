//
//  BookCityViewController.h
//  qiwenge
//
//  Created by John on 14-7-8.
//  Copyright (c) 2014年 qiwenge. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecommendViewController.h"
#import "RankViewController.h"
#import "CategoryViewController.h" 
#import "ViewPager.h"

@interface BookCityViewController : UIViewController<UIViewPagerDelegate>
 
@property (weak, nonatomic) IBOutlet ViewPager *mSlideView;

@property(strong, nonatomic) RecommendViewController *recommendViewController;

@property(strong, nonatomic) RankViewController *rankViewController;

@property(strong, nonatomic) CategoryViewController *categoryViewController;

@end
