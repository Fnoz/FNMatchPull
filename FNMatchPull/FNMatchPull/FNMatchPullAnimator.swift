//
//  FNMatchPullAnimator.swift
//  FNMatchPull
//
//  Created by Fnoz on 16/6/25.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit

enum FNMatchPullStyle:NSInteger{
    case pattern = 0
    case text = 1
}

class FNMatchPullAnimator: UIView, FNPullToRefreshViewDelegate {
    var matchPullView:FNMatchPullView!
    var style:FNMatchPullStyle! {
        didSet {
            matchPullView.style = style
            matchPullView.initMatch()
        }
    }
    var text:NSString! {
        didSet {
            matchPullView.text = text
            matchPullView.initMatch()
        }
    }
    var lineWidth:CGFloat? {
        didSet {
            matchPullView.lineWidth = lineWidth
            matchPullView.initMatch()
        }
    }
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
    fileprivate let layerLoader = CAShapeLayer()
    fileprivate let layerSeparator = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        matchPullView = FNMatchPullView.init(frame:CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        matchPullView.initMatch()
        addSubview(matchPullView);
        
        let line = UIView.init(frame: CGRect(x: 0, y: frame.size.height - 1, width: frame.size.width, height: 1))
        line.backgroundColor = UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 1)
        addSubview(line)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func pullToRefresh(_ view: FNPullToRefreshView, progressDidChange progress: CGFloat) {
        let validProgress = CGFloat(min(progress, 1.0))
        matchPullView.progress = validProgress
        matchPullView.center = CGPoint(x: matchPullView.center.x, y: frame.size.height/2 + frame.size.height/2 * (1 - validProgress))
    }
    
    func pullToRefresh(_ view: FNPullToRefreshView, stateDidChange state: FNPullToRefreshViewState) {
        
    }
    
    func pullToRefreshAnimationDidEnd(_ view: FNPullToRefreshView) {
        matchPullView.endBling()
    }
    
    func pullToRefreshAnimationDidStart(_ view: FNPullToRefreshView) {
        matchPullView.startBling()
    }
    
}
