//
//  MainViewController.h
//  qiwenge
//
//  Created by John on 14-7-8.
//  Copyright (c) 2014年 qiwenge. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookCityViewController.h"
#import "BookShelfViewController.h"
#import "MeViewController.h"

@interface MainViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *mContainer;

@property (weak, nonatomic) IBOutlet UIImageView *ivBookShelf;

@property (weak, nonatomic) IBOutlet UIImageView *ivBookCity;

@property (weak, nonatomic) IBOutlet UIImageView *ivMe;

@property(strong, nonatomic) BookShelfViewController *bookShelf;

@property(strong, nonatomic) BookCityViewController *bookCity;

@property(strong, nonatomic) MeViewController *meViewContoller;

- (IBAction)onBookShelfClick:(id)sender;

- (IBAction)onBookCityClick:(id)sender; 

- (IBAction)onMeClick:(id)sender;


@end
