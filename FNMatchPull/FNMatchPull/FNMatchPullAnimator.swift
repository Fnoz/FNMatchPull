//
//  FNMatchPullAnimator.swift
//  FNMatchPull
//
//  Created by Fnoz on 16/6/25.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit

class FNMatchPullAnimator: UIView, PullToRefreshViewDelegate {
    var matchPullView:FNMatchPullView!
    var startPoints:NSArray? {
        didSet {
            matchPullView.startPoints = startPoints!
            matchPullView.initMatch()
        }
    }
    var endPoints:NSArray? {
        didSet {
            matchPullView.endPoints = endPoints!
            matchPullView.initMatch()
        }
    }
    private let layerLoader = CAShapeLayer()
    private let layerSeparator = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        matchPullView = FNMatchPullView.init(frame:CGRectMake(0, 0, frame.size.width, frame.size.height))
        matchPullView.initMatch()
        addSubview(matchPullView);
        
        let line = UIView.init(frame: CGRectMake(0, frame.size.height - 1, SCREENWIDTH, 1))
        line.backgroundColor = UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 1)
        addSubview(line)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func pullToRefresh(view: PullToRefreshView, progressDidChange progress: CGFloat) {
        let validProgress = CGFloat(min(progress, 1.0))
        matchPullView.progress = validProgress
        matchPullView.center = CGPointMake(matchPullView.center.x, frame.size.height/2 + frame.size.height/2 * (1 - validProgress))
    }
    
    func pullToRefresh(view: PullToRefreshView, stateDidChange state: PullToRefreshViewState) {
        
    }
    
    func pullToRefreshAnimationDidEnd(view: PullToRefreshView) {
        matchPullView.endBling()
    }
    
    func pullToRefreshAnimationDidStart(view: PullToRefreshView) {
        matchPullView.startBling()
    }
    
}
