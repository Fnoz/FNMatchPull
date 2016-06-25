//
//  FNMatchPullView.swift
//  FNMatchPull
//
//  Created by Fnoz on 16/6/25.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit

let horizontalMove = CGFloat(100.0)
let verticalMove = CGFloat(200.0)
let pullViewHeight = CGFloat(80.0)

class FNMatchPullView: UIView {
    
    var matchViews:NSMutableArray = []
    var startPoints:NSArray = []
    var endPoints:NSArray = []
    var progress:CGFloat = 0.0 {
        didSet {
            refreshView(progress)
        }
    }
    
    func refreshView(progress:CGFloat) {
        let progressHandled = min(progress, 1.0)
        for i in 0 ... matchViews.count - 1 {
            let startPoint = (startPoints[i] as! NSValue).CGPointValue()
            let endPoint = (endPoints[i] as! NSValue).CGPointValue()
            let centerPoint = CGPointMake((startPoint.x + endPoint.x)/2, (startPoint.y + endPoint.y)/2)
            let newCenterPoint:CGPoint
            let match = matchViews[i] as! FNMatchPullMatch
            if i%2 == 0 {
                newCenterPoint = CGPointMake(centerPoint.x - horizontalMove * (1 - progressHandled), centerPoint.y)
                match.transform = CGAffineTransformMakeRotation(match.angle - CGFloat(M_PI_2) * progressHandled)
            }
            else {
                newCenterPoint = CGPointMake(centerPoint.x + horizontalMove * (1 - progressHandled), centerPoint.y)
                match.transform = CGAffineTransformMakeRotation(match.angle - CGFloat(M_PI_2) * progressHandled)
            }
            match.center = newCenterPoint
        }
    }
    
    func initMatch() {
        startPoints = [NSValue.init(CGPoint: CGPointMake(SCREENWIDTH/2, 20)), NSValue.init(CGPoint: CGPointMake(SCREENWIDTH/2, 20)), NSValue.init(CGPoint: CGPointMake(SCREENWIDTH/2, 60)), NSValue.init(CGPoint: CGPointMake(SCREENWIDTH/2, 60))]
        endPoints = [NSValue.init(CGPoint: CGPointMake(SCREENWIDTH/2 - 20, 40)), NSValue.init(CGPoint: CGPointMake(SCREENWIDTH/2 + 20, 40)), NSValue.init(CGPoint: CGPointMake(SCREENWIDTH/2 - 20, 40)), NSValue.init(CGPoint: CGPointMake(SCREENWIDTH/2 + 20, 40))]
        
        for i in 0 ... startPoints.count - 1 {
            let match = FNMatchPullMatch.init()
            match.backgroundColor = UIColor.init(white: 0.7, alpha: 0.7)
            let startPoint = (startPoints[i] as! NSValue).CGPointValue()
            let endPoint = (endPoints[i] as! NSValue).CGPointValue()
            let aaa = (endPoint.x - startPoint.x)*(endPoint.x - startPoint.x)+(endPoint.y - startPoint.y)*(endPoint.y - startPoint.y)
            match.frame = CGRectMake(0, 0, sqrt(aaa), 2)
            if i%2 == 0 {
                match.center = CGPointMake((startPoint.x + endPoint.x)/2 - horizontalMove, (startPoint.y + endPoint.y)/2 - verticalMove)
            }
            else {
                match.center = CGPointMake((startPoint.x + endPoint.x)/2 + horizontalMove, (startPoint.y + endPoint.y)/2 - verticalMove)
            }
            match.angle = atan((endPoint.y - startPoint.y)/(endPoint.x - startPoint.x)) + CGFloat(M_PI_2)
            match.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2) + match.angle)
            addSubview(match)
            matchViews.addObject(match)
        }
    }
    
}