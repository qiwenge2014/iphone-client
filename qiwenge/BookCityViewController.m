//
//  BookCityViewController.m
//  qiwenge
//
//  Created by Eric on 14-7-8.
//  Copyright (c) 2014年 qiwenge. All rights reserved.
//

#import "BookCityViewController.h"

@interface BookCityViewController ()

@end

@implementation BookCityViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];  
    
//    [self initButtonStyle];
    
    self.recommendViewController=[[RecommendViewController alloc] init];
    self.recommendViewController.mDelegate=self.mDelegate;
    
    self.rankViewController=[[RankViewController alloc] init];
    self.rankViewController.mDelegate=self.mDelegate;
    
    self.categoryViewController=[[CategoryViewController alloc] init];
    
    [self focusAButton:self.lbRank];
    [self.ivIndicator setBackgroundColor:[UIColor mainDressColor]];
    
    [self.mViewPager buildUI];
    [self.mViewPager setIndicator:self.ivIndicator];
  }

-(void)initButtonStyle{
    [self.btnRank setTitleColor:[UIColor mainDressColor] forState:UIControlStateHighlighted];
    [self.btnRank setTintColor:[UIColor whiteColor]];
    
    [self.btnRecommend setTitleColor:[UIColor mainDressColor] forState:UIControlStateHighlighted];
    [self.btnRecommend setTintColor:[UIColor whiteColor]];
    
    [self.btnCategory setTitleColor:[UIColor mainDressColor] forState:UIControlStateHighlighted];
    [self.btnCategory setTintColor:[UIColor whiteColor]];
    
    [self onSelectedChanged:0];
}

-(NSUInteger)getCount:(ViewPager *)view{
    return 3;
}

-(UIViewController *)getItem:(ViewPager *)view position:(NSUInteger)number{
    if (number == 0) {
        return self.rankViewController;
    } else if (number == 1) {
        return self.recommendViewController;
    } else if (number == 2) {
        return self.categoryViewController;
    } else {
        return nil;
    }
}

-(void)onSelectedChanged:(NSUInteger)position{
    [self clearTabFocus];
    switch (position) {
        case 0:
            [self focusAButton:self.lbRank];
            break;
        case 1:
            [self focusAButton:self.lbRecommend];
            break;
        case 2:
            [self focusAButton:self.lbCategory];
            break;
        default:
            break;
    }
}

-(void)onPageDidScroll:(CGFloat)x{

}

-(void)focusAButton:(UILabel *)label{
    [label setTextColor:[UIColor mainDressColor]];
}

-(void)clearTabFocus{
    [self.lbRank setTextColor:[UIColor lightGrayColor]];
    [self.lbRecommend setTextColor:[UIColor lightGrayColor]];
    [self.lbCategory setTextColor:[UIColor lightGrayColor]];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

- (IBAction)selectRank:(id)sender {
    [self.mViewPager selectPosition:0];
}

- (IBAction)selectRecommend:(id)sender {
    [self.mViewPager selectPosition:1];
}

- (IBAction)selectCategory:(id)sender {
    [self.mViewPager selectPosition:2];
}

@end
