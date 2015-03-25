//
//  CorePullScaleImageView.m
//  CorePullScale
//
//  Created by 沐汐 on 15-2-23.
//  Copyright (c) 2015年 沐汐. All rights reserved.
//

#import "CorePullScaleImageView.h"
#define iOS8 ([UIDevice currentDevice].systemVersion.floatValue>=8.0f)

static NSString *const CorePullScaleContentOffset = @"contentOffset";

@interface CorePullScaleImageView (){
    
    UIEdgeInsets                                            _originalContentInset;
    
    CGFloat                                                 _navBarH;
}


@property (nonatomic, weak) UIScrollView *scrollView;



@end

@implementation CorePullScaleImageView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        //初始化
        [self pullScaleImageViewPrepare];
    }
    return self;
}


/**
 *  初始化
 */
-(void)pullScaleImageViewPrepare{
    
    //设置模式
    self.contentMode=UIViewContentModeScaleAspectFill;
    
    //剪切
    self.clipsToBounds=YES;
    
    //事件监听
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(screenRotate) name:UIDeviceOrientationDidChangeNotification object:nil];
}



/**
 *  屏幕旋转
 */
-(void)screenRotate{
    
    [self rotationSupportWithNavBarH:_vc.navigationController.navigationBar.bounds.size.height];
}





-(void)willMoveToSuperview:(UIView *)newSuperview{
    
    //super
    [super willMoveToSuperview:newSuperview];
    
    // 旧的父控件
    [self.superview removeObserver:self forKeyPath:CorePullScaleContentOffset context:nil];
    
    if (newSuperview) { // 新的父控件
        [newSuperview addObserver:self forKeyPath:CorePullScaleContentOffset options:NSKeyValueObservingOptionNew context:nil];

        // 记录UIScrollView
        _scrollView = (UIScrollView *)newSuperview;
        
        // 设置永远支持垂直弹簧效果
        _scrollView.alwaysBounceVertical = YES;
        
        if(_hasNavBar) _navBarH=64.0f;
    }
}

#pragma mark - 监听UIScrollView的contentOffset属性
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    // 不能跟用户交互就直接返回
    if (self.alpha <= 0.01 || self.hidden) return;
    
    if ([CorePullScaleContentOffset isEqualToString:keyPath]) {
        [self adjustStateWithContentOffset];
    }
}


- (void)adjustStateWithContentOffset
{
    
    CGFloat y=_scrollView.contentOffset.y + _originalHeight + _navBarH;
    
    //如果是再向下拉直接返回
    if(y>=0) return;
    
    CGRect frame=self.frame;
    frame.origin.y=-_originalHeight + y ;
    frame.size.height=_originalHeight - y;
    self.frame=frame;
}



-(void)didMoveToSuperview{
    
    [super didMoveToSuperview];
    
    CGFloat h=_originalHeight;
    
    CGFloat y=-h;
    
    CGFloat w=_scrollView.bounds.size.width;

    CGRect frame=CGRectMake(0, y, w, h);

    self.frame=frame;
}


/**
 *  支持屏幕旋转
 */
-(void)rotationSupportWithNavBarH:(CGFloat)navBarH{
    NSLog(@"===%@",@(navBarH));
    _navBarH=navBarH;

    if(_hasNavBar && (!iOS8 || (iOS8 && navBarH==44.0f))) _navBarH+=20.0f;
    
    CGRect frame=self.frame;
    frame.size.height=_originalHeight;
    frame.origin.y=-_originalHeight;
    frame.size.width=_scrollView.bounds.size.width;
    [UIView animateWithDuration:0.25f animations:^{
        self.frame=frame;
    }];
}


-(void)setImgName:(NSString *)imgName{
    
    _imgName=imgName;

    //设置图片内容
    self.image=[UIImage imageNamed:imgName];
}




@end
