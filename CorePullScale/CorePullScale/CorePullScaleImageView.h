//
//  CorePullScaleImageView.h
//  CorePullScale
//
//  Created by 沐汐 on 15-2-23.
//  Copyright (c) 2015年 沐汐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CorePullScaleImageView : UIImageView

/**
 *  图片名
 */
@property (nonatomic,copy) NSString *imgName;


/**
 *  imageView的初始高度（关系到contentInset及contentOffset）
 */
@property (nonatomic,assign) CGFloat originalHeight;///是什么

/**
 *  是否含有导航条
 */
@property (nonatomic,assign) BOOL hasNavBar;


/**
 *  支持屏幕旋转
 */
-(void)rotationSupportWithNavBarH:(CGFloat)navBarH;



@end
