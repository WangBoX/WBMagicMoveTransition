//
//  WBMagicMoveTransition.m
//  WBMagicMoveTransition
//
//  Created by 王博Bling on 2018/2/26.
//  Copyright © 2018年 王博. All rights reserved.
//

#import "WBMagicMoveTransition.h"


@interface WBMagicMoveTransition ()
@property (nonatomic,strong)id<UIViewControllerContextTransitioning> transitionContext;

@end

@implementation WBMagicMoveTransition


- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.6f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    self.transitionContext = transitionContext;
    if (![[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey] isKindOfClass:[ViewController class]]) {
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
        return;
    }
    //获取两个VC 和 动画发生的容器
    ViewController *fromVC = (ViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    TransitionViewController *toVC = (TransitionViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    //对Cell上的 imageView 截图，同时将这个 imageView 本身隐藏
    HomeProjectCell *cell = (HomeProjectCell *)[fromVC.tableView cellForRowAtIndexPath:fromVC.indexPath];
    
    
    UIView *snapShotView = [cell.icon snapshotViewAfterScreenUpdates:NO];
    snapShotView.frame = fromVC.finalCellRect = [containerView convertRect:cell.icon.frame fromView:cell.icon.superview];
    cell.icon.hidden = YES;
    
    //设置第二个控制器的位置、透明度
    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    toVC.view.alpha = 0;
    toVC.headerView.iconImageView.hidden = YES;
    
    //把动画前后的两个ViewController加到容器中,顺序很重要,snapShotView在上方
    [containerView addSubview:toVC.view];
    [containerView addSubview:snapShotView];
    
#pragma 圆形动画
    UIBezierPath *maskStartBP =  [UIBezierPath bezierPathWithOvalInRect:cell.icon.frame];
    
    //创建两个圆形的 UIBezierPath 实例；一个是 cell.icon 的 size ，另外一个则拥有足够覆盖屏幕的半径。最终的动画则是在这两个贝塞尔路径之间进行的
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
    
    CGFloat radius = sqrt((finalPoint.x * finalPoint.x) + (finalPoint.y * finalPoint.y));
    UIBezierPath *maskFinalBP = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(cell.icon.frame, -radius, -radius)];
    
    //创建一个 CAShapeLayer 来负责展示圆形遮盖
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = maskFinalBP.CGPath; //将它的 path 指定为最终的 path 来避免在动画完成后会回弹
    toVC.view.layer.mask = maskLayer;
    
    CABasicAnimation *maskLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    maskLayerAnimation.fromValue = (__bridge id)(maskStartBP.CGPath);
    maskLayerAnimation.toValue = (__bridge id)((maskFinalBP.CGPath));
    maskLayerAnimation.duration = [self transitionDuration:transitionContext];
    maskLayerAnimation.timingFunction = [CAMediaTimingFunction  functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    maskLayerAnimation.delegate = self;
    
    [maskLayer addAnimation:maskLayerAnimation forKey:@"path"];
    
    #pragma 移动
    CGRect finalFrame = [containerView convertRect:toVC.headerView.iconImageView.frame fromView:toVC.headerView.iconImageView.superview];
    //todo：终点坐标需要设置为目标frame！！！
    finalFrame = CGRectMake(20, 87, 100, 100);
    if (finalFrame.origin.x == 0 && finalFrame.origin.y == 0) {
        finalFrame = CGRectMake(20, 87, 100, 100);
    }
    [UIView animateWithDuration:[self transitionDuration:transitionContext]+0.15f delay:0.0f usingSpringWithDamping:0.75f initialSpringVelocity:1.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [containerView layoutIfNeeded];
        toVC.view.alpha = 1.0;
        snapShotView.frame = finalFrame;
    } completion:^(BOOL finished) {
        //为了让回来的时候，cell上的图片显示，必须要让cell上的图片显示出来
        toVC.headerView.iconImageView.hidden = NO;
        cell.icon.hidden = YES;
        [snapShotView removeFromSuperview];
        //告诉系统动画结束
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
        //清除 fromVC 的 mask
        [self.transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view.layer.mask = nil;
        [self.transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view.layer.mask = nil;
        
    }];
}


#pragma mark - CABasicAnimation的Delegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
}


@end




