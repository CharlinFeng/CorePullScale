//
//  UIScrollView+PullScale.h
//  CorePullScale
//
//  Created by 沐汐 on 15-2-23.
//  Copyright (c) 2015年 沐汐. All rights reserved.
//
//  scrollView:(TableView+CollectionView) 下拉图片放大
//
//  作品时间： 2015.02.23日 11:21
//  版权信息：本作品由华西都市网iOS开发攻城狮Charlin出品


#import <UIKit/UIKit.h>

@interface UIScrollView (PullScale)


/**
 *  添加一个下拉放大的功能
 *
 *  @param imgName              图片名
 *  @param originalHeight       imageView的初始高度（关系到contentInset及contentOffset）
 */
-(void)addPullScaleFuncWithImgName:(NSString *)imgName originalHeight:(CGFloat)originalHeight hasNavBar:(BOOL)hasNavBar;


/**
 *  支持屏幕旋转
 */
-(void)rotationSupportWithNavBarH:(CGFloat)navBarH;

@end
