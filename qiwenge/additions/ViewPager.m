


#import "ViewPager.h"

@implementation ViewPager

bool hasLayouted = false;

- (void)initViews
{
    NSLog(@"ViewPager initViews");
    self.mScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    self.mScrollView.delegate = self;
    self.mScrollView.pagingEnabled = YES;
    self.mScrollView.userInteractionEnabled = YES;
    self.mScrollView.bounces = YES;
    self.mScrollView.showsHorizontalScrollIndicator = NO;
    self.mScrollView.showsVerticalScrollIndicator = NO;
    self.mScrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth; 
    [self addSubview:self.mScrollView];
    
    self.views = [[NSMutableArray alloc] init];
    isInited = NO;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initViews];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initViews];
    }
    return self;
}

- (void)layoutSubviews
{
    if (isInited&&!hasLayouted) {
        NSLog(@"layoutSubviews");
        hasLayouted = true;
        self.mScrollView.contentSize = CGSizeMake(self.bounds.size.width * [self.views count], 0);
        for (int i = 0; i < [ self.views count]; i++) {
            UIViewController *listVC =  self.views[i];
            listVC.view.frame = CGRectMake(0+self.mScrollView.bounds.size.width*i, 0,
                                           self.mScrollView.bounds.size.width, self.mScrollView.bounds.size.height);
        }
        [self.mScrollView setContentOffset:CGPointMake(self.bounds.size.width*0, 0) animated:NO];
    }
}

- (void)buildUI
{
    NSLog(@"buildUI");
    NSUInteger number = [self.mViewPagerDelegate getCount:self];
    for (int i=0; i<number; i++) {
        UIViewController *item=[self.mViewPagerDelegate getItem:self position:i];
        [ self.views addObject:item];
        [self.mScrollView addSubview:item.view]; 
    }
    isInited = YES;
    [self setNeedsLayout];
}


-(void)selectPosition:(int)position{
    [self.mScrollView setContentOffset:CGPointMake(self.bounds.size.width*position, 0) animated:YES];
    [self.mViewPagerDelegate onSelectedChanged:position];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat x=self.mScrollView.contentOffset.x/[self.mViewPagerDelegate getCount:self];
    if (self.indicator) {
        [self.indicator setFrame:CGRectMake(x,
                                            self.indicator.frame.origin.y,
                                            self.indicator.frame.size.width,
                                            self.indicator.frame.size.height)];
    }
    [self.mViewPagerDelegate onPageDidScroll:x];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat offset=self.mScrollView.contentOffset.x;
    int position=offset/self.mScrollView.frame.size.width;
    [self.mViewPagerDelegate onSelectedChanged:position];
}

@end

