//
//  FNMatchPullAnimator.swift
//  FNMatchPull
//
//  Created by Fnoz on 16/6/25.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit
import Refresher

class FNMatchPullAnimator: UIView, PullToRefreshViewDelegate {
    var matchPullView:FNMatchPullView!
    
    private let layerLoader = CAShapeLayer()
    private let layerSeparator = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        matchPullView = FNMatchPullView.init(frame:CGRectMake(0, 0, frame.size.width, frame.size.height))
        matchPullView.startPoints = []
        matchPullView.endPoints = []
        matchPullView.initMatch()
        addSubview(matchPullView);
        
        layerLoader.lineWidth = 4
        layerLoader.strokeColor = UIColor(red: 0.13, green: 0.79, blue: 0.31, alpha: 1).CGColor
        layerLoader.strokeEnd = 0
        
        layerSeparator.lineWidth = 1
        layerSeparator.strokeColor = UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 1).CGColor
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func pullToRefresh(view: PullToRefreshView, progressDidChange progress: CGFloat) {
        matchPullView.progress = progress
        layerLoader.strokeEnd = progress
    }
    
    func pullToRefresh(view: PullToRefreshView, stateDidChange state: PullToRefreshViewState) {
        
    }
    
    func pullToRefreshAnimationDidEnd(view: PullToRefreshView) {
        layerLoader.removeAllAnimations()
    }
    
    func pullToRefreshAnimationDidStart(view: PullToRefreshView) {
        let pathAnimationEnd = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimationEnd.duration = 0.5
        pathAnimationEnd.repeatCount = 100
        pathAnimationEnd.autoreverses = true
        pathAnimationEnd.fromValue = 1
        pathAnimationEnd.toValue = 0.8
        layerLoader.addAnimation(pathAnimationEnd, forKey: "strokeEndAnimation")
        
        let pathAnimationStart = CABasicAnimation(keyPath: "strokeStart")
        pathAnimationStart.duration = 0.5
        pathAnimationStart.repeatCount = 100
        pathAnimationStart.autoreverses = true
        pathAnimationStart.fromValue = 0
        pathAnimationStart.toValue = 0.2
        layerLoader.addAnimation(pathAnimationStart, forKey: "strokeStartAnimation")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let superview = superview {
            
            if layerLoader.superlayer == nil {
                superview.layer.addSublayer(layerLoader)
            }
            if layerSeparator.superlayer == nil {
                superview.layer.addSublayer(layerSeparator)
            }
            let bezierPathLoader = UIBezierPath()
            bezierPathLoader.moveToPoint(CGPointMake(0, superview.frame.height - 3))
            bezierPathLoader.addLineToPoint(CGPoint(x: superview.frame.width, y: superview.frame.height - 3))
            
            let bezierPathSeparator = UIBezierPath()
            bezierPathSeparator.moveToPoint(CGPointMake(0, superview.frame.height - 1))
            bezierPathSeparator.addLineToPoint(CGPoint(x: superview.frame.width, y: superview.frame.height - 1))
            
            layerLoader.path = bezierPathLoader.CGPath
            layerSeparator.path = bezierPathSeparator.CGPath
        }
    }
}
