


import UIKit

class FlipPresentAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    var originFrame = CGRectZero
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 1.0
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey),
            let containerView = transitionContext.containerView(),
            let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) else {
                return
        }
        
        let initialFrame = originFrame
        
        let finalFrame = transitionContext.finalFrameForViewController(toVC)
        
        var snapshot = fromVC.view.snapshotViewAfterScreenUpdates(true)
        
        snapshot.frame = initialFrame
        //snapshot.layer.cornerRadius = 25
        snapshot.layer.masksToBounds = true
        
        containerView.addSubview(toVC.view)
        containerView.addSubview(fromVC.view)
        toVC.view.hidden = false
        toVC.view.alpha = 0
        //AnimationHelper.perspectiveTransformForContainerView(containerView)
        
        //snapshot.layer.transform = AnimationHelper.yRotation(M_PI_2)
        
        let duration = transitionDuration(transitionContext)
        
        UIView.animateKeyframesWithDuration(
            duration,
            delay: 0,
            options: .CalculationModeCubic,
            animations: {
                
                UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 1/3, animations: {
                    //fromVC.view.layer.transform = AnimationHelper.yRotation(-M_PI_2)
                    fromVC.view.alpha = 0
                    
                    //snapshot = fromVC.view.snapshotViewAfterScreenUpdates(true)
                })
                
                UIView.addKeyframeWithRelativeStartTime(1/3, relativeDuration: 0.0, animations: {
                    //snapshot.layer.transform = AnimationHelper.yRotation(0.0)
                    //containerView.addSubview(toVC.view)
                    
                    
                })
                
                UIView.addKeyframeWithRelativeStartTime(2/3, relativeDuration: 1/3, animations: {
                    toVC.view.alpha = 1
                    //toVC.view.hidden = false
                    //snapshot = toVC.view.snapshotViewAfterScreenUpdates(true)
                    //snapshot.alpha = 1
                    //snapshot.frame = finalFrame
                    
                })
            },
            completion: { _ in
                toVC.view.hidden = false
                snapshot.removeFromSuperview()
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
                fromVC.view.alpha = 1
        })
    }
}