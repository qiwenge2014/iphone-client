//
//  BookDetailViewController.m
//  qiwenge
//
//  Created by Eric on 14-8-30.
//  Copyright (c) 2014年 qiwenge. All rights reserved.
//

#import "BookDetailViewController.h"

@interface BookDetailViewController ()

@end

@implementation BookDetailViewController

@synthesize book;

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
    NSLog(@"viewDidLoad");
    
    [self initNavigationBarWithTopTitle:@"小说详情" leftTitle:@"返回" rightTitle:nil];
    [self initViews];
}

-(void)passArguments:(id)id{
    if(id){
        book=id;
    }
}

-(void)initViews{
    [self.view setBackgroundColor:[UIColor sendBackgoundColor]];
    
    [self.lableTitle setTextColor:[UIColor mainDressColor]];
    
    if (book) {
        [self.lableTitle setText:book.title];
    }
    
    
    [self.btnChapter setBackgroundImage:[self imageWithColor:[UIColor backgoundColor]] forState:UIControlStateNormal
      ];
    [self.btnChapter setBackgroundImage:[self imageWithColor:[UIColor mainDressColor]] forState:UIControlStateHighlighted
     ];
    
    [self.btnChapter.layer setBorderWidth:1];
    [self.btnChapter.layer setBorderColor:[[UIColor mainDressColor] CGColor]];
    
    
    [self.btnAdd setBackgroundImage:[self imageWithColor:[UIColor mainDressColor]] forState:UIControlStateHighlighted
     ];
    
    [self.btnAdd.layer setBorderWidth:1];
    [self.btnAdd.layer setBorderColor:[[UIColor mainDressColor] CGColor]];
}

-(UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,[color CGColor]);
    CGContextFillRect(context, rect);
    UIImage * image = [[UIImage alloc] init];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
