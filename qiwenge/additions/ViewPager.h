

#import <UIKit/UIKit.h>

@protocol UIViewPagerDelegate;

@interface ViewPager : UIView<UIScrollViewDelegate>
{
    BOOL isInited;
}

@property (nonatomic, strong) IBOutlet UIScrollView *mScrollView;
@property (nonatomic, weak) IBOutlet id<UIViewPagerDelegate> mViewPagerDelegate;
@property (nonatomic, strong) NSMutableArray *views;
@property (nonatomic, strong) UIView *indicator;

- (void)buildUI;

- (void)selectPosition:(int)position;

@end

@protocol UIViewPagerDelegate <NSObject>

@required

- (NSUInteger)getCount:(ViewPager *)view;

- (UIViewController *)getItem:(ViewPager *)view position:(NSUInteger)number;

- (void)onSelectedChanged:(NSUInteger)position;

- (void)onPageDidScroll:(CGFloat)x;

@end

