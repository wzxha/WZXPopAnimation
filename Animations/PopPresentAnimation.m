//
//  PopAnimation.m
//  WZXPopAnimation
//
//  Created by WzxJiang on 16/12/6.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//

#import "PopPresentAnimation.h"

@implementation PopPresentAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.6;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController * toVC =
    [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIViewController * fromVC =
    [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    toVC.view.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 300);
    
    [[transitionContext containerView] addSubview:toVC.view];
    
    CATransform3D t1 = CATransform3DIdentity;
    t1.m34 = 1.0/-900;
    t1 = CATransform3DScale(t1, 0.95, 0.95, 1);
    t1 = CATransform3DRotate(t1, 15.0 * M_PI/180.0, 1, 0, 0);

    
    CATransform3D t2 = CATransform3DIdentity;
    t2.m34 = 1.0/-900;
    //向上移
    t2 = CATransform3DTranslate(t2, 0, fromVC.view.frame.size.height * (-0.08), 0);
    //第二次缩小
    t2 = CATransform3DScale(t2, 0.8, 0.8, 1);

    
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        [fromVC.view.layer setTransform:t1];
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            fromVC.view.alpha = 0.5;

            CGRect rect    = toVC.view.frame;
            rect.origin.y -= rect.size.height;
            toVC.view.frame = rect;
            
            [fromVC.view.layer setTransform:t2];
            
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
        
    }];
}



@end
