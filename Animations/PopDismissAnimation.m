//
//  PopDismissAnimation.m
//  WZXPopAnimation
//
//  Created by WzxJiang on 16/12/6.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//

#import "PopDismissAnimation.h"

@implementation PopDismissAnimation


- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.6;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController * toVC =
    [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIViewController * fromVC =
    [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    CATransform3D t1 = CATransform3DIdentity;
    t1.m34 = 1.0/-900;
    t1 = CATransform3DScale(t1, 0.95, 0.95, 1);
    t1 = CATransform3DRotate(t1, 15.0 * M_PI/180.0, 1, 0, 0);
    
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        CGRect rect    = fromVC.view.frame;
        rect.origin.y += rect.size.height;
        fromVC.view.frame = rect;
        
        [toVC.view.layer setTransform:t1];
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            toVC.view.alpha = 1;
            [toVC.view.layer setTransform:CATransform3DIdentity];
            
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
        
    }];

}


@end
