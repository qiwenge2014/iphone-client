//
//  BookDetailViewController.m
//  qiwenge
//
//  Created by Eric on 14-8-30.
//  Copyright (c) 2014年 qiwenge. All rights reserved.
//

#import "BookDetailViewController.h"

#define   FORMAT_SHOW_AUTHOR       @"作者 : %@"
#define   FORMAT_SHOW_CATEGORY     @"类型 : %@"
#define   FORMAT_SHOW_STATUS       @"状态 : %@"

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
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    
    [self initNavigationBarWithTopTitle:@"小说详情" leftTitle:@"返回" rightTitle:nil];
    [self initViews];
    [self showBook];
}

-(void)passArguments:(id)id{
    if(id){
        book=id;
    }
}

-(void)initViews{
    [self.view setBackgroundColor:[UIColor sendBackgoundColor]];
    
    [self.lableTitle setTextColor:[UIColor mainDressColor]];
    
    [self.btnChapter setStyleOfBookDetail];
    [self.btnAdd setStyleOfBookDetail];
}

-(void)showBook{
    if (book) {
        [self.mCover setBookCover:book.cover];
        
        [self.lableTitle setText:book.title];
        [self.lbAuthor setText:[NSString stringWithFormat:FORMAT_SHOW_AUTHOR,book.author]];
        if (book.categories&&book.categories.count>0) {
            [self.lbCategory setText:[NSString stringWithFormat:FORMAT_SHOW_AUTHOR,[book.categories objectAtIndex:0]]];
        }
        
        NSString *desc=book.desc;
        [self.lableDesc setBookDesc:desc];
        [self.lableDesc setLineSpacing:5];
     
        [self setContentSize];
    }
}

-(void)setContentSize{
    float heightContainer=self.mViewDesc.frame.size.height;
    float height=self.lableDesc.frame.size.height;
    float offset=heightContainer-height;
    [self.lableDesc autoResizeHeight];
    
    float newHeight=self.lableDesc.frame.size.height;
    
    self.mViewDesc.frame=CGRectMake(self.mViewDesc.frame.origin.x, self.mViewDesc.origin.y, self.mViewDesc.frame.size.width, newHeight+offset);
    
    int contentHeight=self.mViewDesc.frame.origin.y+self.mViewDesc.size.height+16;
    
    self.mScrollView.contentSize = CGSizeMake(320, contentHeight);
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

- (IBAction)skipToChapter:(id)sender {
    ChapterViewController *chapter=[[ChapterViewController alloc] init];
    [chapter passArguments:book];
    [self.navigationController pushViewController:chapter animated:YES];
}

@end
