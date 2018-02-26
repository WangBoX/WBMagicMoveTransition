//
//  WBMagicMoveInverseTransition.m
//  WBMagicMoveTransition
//
//  Created by 王博Bling on 2018/2/26.
//  Copyright © 2018年 王博. All rights reserved.
//

#import "WBMagicMoveInverseTransition.h"

@interface WBMagicMoveInverseTransition()

@property(nonatomic,strong)id<UIViewControllerContextTransitioning>transitionContext;

@end

@implementation WBMagicMoveInverseTransition
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.5f;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    self.transitionContext = transitionContext;
    if (![[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey] isKindOfClass:[ViewController class]]) {
        return;
    }
    TransitionViewController *fromVC = (TransitionViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    ViewController *toVC = (ViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    HomeProjectCell *cell = (HomeProjectCell *)[toVC.tableView cellForRowAtIndexPath:toVC.indexPath];
    
    UIView *snapShotView = [fromVC.headerView.iconImageView snapshotViewAfterScreenUpdates:NO];
    snapShotView.backgroundColor = [UIColor clearColor];
    cell.icon.hidden = YES;
    
    snapShotView.frame = [containerView convertRect:fromVC.headerView.iconImageView.frame fromView:fromVC.headerView.iconImageView.superview];
    fromVC.headerView.iconImageView.hidden = YES;
    //    //初始化后一个VC的位置
    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    
    [containerView insertSubview:toVC.view belowSubview:fromVC.view];
    [containerView addSubview:snapShotView];
    /*
#pragma 圆形动画
    UIBezierPath *finalPath = [UIBezierPath bezierPathWithOvalInRect:cell.icon.frame];
    
    CGPoint finalPoint;
    
    //判断触发点在那个象限
    if(cell.icon.frame.origin.x > (toVC.view.bounds.size.width / 2)){
        if (cell.icon.frame.origin.y < (toVC.view.bounds.size.height / 2)) {
            //第一象限
            finalPoint = CGPointMake(cell.icon.center.x - 0, cell.icon.center.y - CGRectGetMaxY(toVC.view.bounds)+30);
        }else{
            //第四象限
            finalPoint = CGPointMake(cell.icon.center.x - 0, cell.icon.center.y - 0);
        }
    }else{
        if (cell.icon.frame.origin.y < (toVC.view.bounds.size.height / 2)) {
            //第二象限
            finalPoint = CGPointMake(cell.icon.center.x - CGRectGetMaxX(toVC.view.bounds), cell.icon.center.y - CGRectGetMaxY(toVC.view.bounds)+30);
        }else{
            //第三象限
            finalPoint = CGPointMake(cell.icon.center.x - CGRectGetMaxX(toVC.view.bounds), cell.icon.center.y - 0);
        }
    }
    CGFloat radius = sqrt(finalPoint.x * finalPoint.x + finalPoint.y * finalPoint.y);
    UIBezierPath *startPath = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(fromVC.headerView.iconImageView.frame, -radius, -radius)];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = finalPath.CGPath;
    fromVC.view.layer.mask = maskLayer;
    
    
    CABasicAnimation *pingAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    pingAnimation.fromValue = (__bridge id)(startPath.CGPath);
    pingAnimation.toValue   = (__bridge id)(finalPath.CGPath);
    pingAnimation.duration = [self transitionDuration:transitionContext];
    pingAnimation.timingFunction = [CAMediaTimingFunction  functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pingAnimation.delegate = self;
    [maskLayer addAnimation:pingAnimation forKey:@"pingInvert"];
    */
#pragma 移动
    toVC.view.alpha = 0.f;
    fromVC.view.alpha = 1.f;
    [UIView animateWithDuration:[self transitionDuration:transitionContext]+0.1f delay:[self transitionDuration:transitionContext] usingSpringWithDamping:0.75f initialSpringVelocity:1.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        fromVC.view.alpha = 0.f;
        toVC.view.alpha = 1.f;
        snapShotView.frame = toVC.finalCellRect;
        
    } completion:^(BOOL finished) {
        
        fromVC.headerView.iconImageView.hidden = NO;
        cell.icon.hidden = NO;
        [snapShotView removeFromSuperview];
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        [self.transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view.layer.mask = nil;
        [self.transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view.layer.mask = nil;
    }];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
}



@end




