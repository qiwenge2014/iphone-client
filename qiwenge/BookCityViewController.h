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
 
@property (weak, nonatomic) IBOutlet ViewPager *mViewPager;

@property (weak, nonatomic) IBOutlet UIButton *btnRank;

@property (weak, nonatomic) IBOutlet UIButton *btnRecommend;

@property (weak, nonatomic) IBOutlet UIButton *btnCategory;

@property (weak, nonatomic) IBOutlet UILabel *lbRecommend;
@property (weak, nonatomic) IBOutlet UILabel *lbRank;
@property (weak, nonatomic) IBOutlet UILabel *lbCategory;

@property(strong, nonatomic) RecommendViewController *recommendViewController;

@property(strong, nonatomic) RankViewController *rankViewController;

@property(strong, nonatomic) CategoryViewController *categoryViewController;

@property(retain, nonatomic) id mDelegate;

- (IBAction)selectRank:(id)sender;

- (IBAction)selectRecommend:(id)sender;

- (IBAction)selectCategory:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *ivIndicator;

@end
