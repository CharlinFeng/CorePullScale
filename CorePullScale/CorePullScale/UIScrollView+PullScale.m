//
//  UIScrollView+PullScale.m
//  CorePullScale
//
//  Created by 沐汐 on 15-2-23.
//  Copyright (c) 2015年 沐汐. All rights reserved.
//

#import "UIScrollView+PullScale.h"
#import "CorePullScaleImageView.h"
#import <objc/runtime.h>


@interface UIScrollView ()

@property (weak, nonatomic) CorePullScaleImageView *imageV;

@end


#pragma mark - 运行时相关
static char CorePullScaleImageViewKey;

@implementation UIScrollView (PullScale)


/**
 *  添加一个下拉放大的功能
 *
 *  @param vc                   所属控制器
 *  @param imgName              图片名
 *  @param originalHeight       imageView的初始高度（关系到contentInset及contentOffset）
 */
-(void)addPullScaleFuncInVC:(UIViewController *)vc imgName:(NSString *)imgName originalHeight:(CGFloat)originalHeight hasNavBar:(BOOL)hasNavBar{
    
    CorePullScaleImageView *imageV=[[CorePullScaleImageView alloc] init];
    
    //记录
    self.imageV=imageV;
    
    //数据传递
    imageV.hasNavBar=hasNavBar;
    imageV.originalHeight=originalHeight;
    imageV.imgName=imgName;
    imageV.vc=vc;

    CGFloat height=originalHeight;

    
    /**
     *  contentInset
     */
    //取出之前的contentInset
    UIEdgeInsets contentInset=self.contentInset;
    
    //设置contentInset
    contentInset.top+=height;
    self.contentInset=contentInset;
    
    
    /**
     *  contentOffset
     */
    //取出之前的contentOffset
    CGPoint contentOffsett=self.contentOffset;
    
    //设置contentOffset
    contentOffsett.y-=height;
    self.contentOffset=contentOffsett;
    
    //添加控件
    [self addSubview:imageV];
}


#pragma mark 使用运行时模拟成员变量：imageV
-(void)setImageV:(CorePullScaleImageView *)imageV{
    [self willChangeValueForKey:@"CorePullScaleImageViewKey"];
    objc_setAssociatedObject(self, &CorePullScaleImageViewKey,
                             imageV,
                             OBJC_ASSOCIATION_ASSIGN);
    [self didChangeValueForKey:@"CorePullScaleImageViewKey"];
}


-(CorePullScaleImageView *)imageV{
    return objc_getAssociatedObject(self, &CorePullScaleImageViewKey);
}




@end
