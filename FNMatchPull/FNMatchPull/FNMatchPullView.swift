//
//  FNMatchPullView.swift
//  FNMatchPull
//
//  Created by Fnoz on 16/6/25.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit

let horizontalMove = CGFloat(150.0)
let verticalMove = CGFloat(100.0)
let pullViewHeight = CGFloat(80.0)

class FNMatchPullView: UIView {
    var lineWidth:CGFloat! = CGFloat(2)
    var style:FNMatchPullStyle?
    var text:NSString?
    var startPoints:NSArray?
    var endPoints:NSArray?
    var matchViews:NSMutableArray = []
    var timer:Timer!
    var progress:CGFloat = 0.0 {
        didSet {
            refreshView(progress)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        startPoints = []
        endPoints = []
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initMatch() {
        //remove old matchs
        if matchViews.count > 0 {
            for i in 0 ... matchViews.count - 1 {
                let match = matchViews[i] as! FNMatchPullMatch
                match.removeFromSuperview()
            }
        }
        
        if style == .text {
            updateTextToPoints()
        }
        
        if startPoints?.count != endPoints?.count || startPoints?.count == 0{
            return
        }
        
        matchViews.removeAllObjects()
        matchViews = NSMutableArray.init(array: [])
        //build new matchs
        for i in 0 ... (startPoints?.count)! - 1 {
            let match = FNMatchPullMatch.init()
            match.backgroundColor = UIColor.white
            match.alpha = 0.3
            let startPoint = (startPoints?[i] as! NSValue).cgPointValue
            let endPoint = (endPoints?[i] as! NSValue).cgPointValue
            let aaa = (endPoint.x - startPoint.x)*(endPoint.x - startPoint.x)+(endPoint.y - startPoint.y)*(endPoint.y - startPoint.y)
            match.frame = CGRect(x: 0, y: 0, width: sqrt(aaa), height: lineWidth)
            if i%2 == 0 {
                match.center = CGPoint(x: (startPoint.x + endPoint.x)/2 - horizontalMove, y: (startPoint.y + endPoint.y)/2 - verticalMove)
            }
            else {
                match.center = CGPoint(x: (startPoint.x + endPoint.x)/2 + horizontalMove, y: (startPoint.y + endPoint.y)/2 - verticalMove)
            }
            match.oriCenter = match.center
            match.angle = atan((endPoint.y - startPoint.y)/(endPoint.x - startPoint.x)) + CGFloat(M_PI)
            let rotate = CGAffineTransform(rotationAngle: CGFloat(-M_PI) + match.angle)
            match.transform = rotate.scaledBy(x: 0, y: 0)
            addSubview(match)
            matchViews.add(match)
        }
    }
    
    func updateTextToPoints() {
        // Fix the issue that app will crash if text is nil
        if text == nil {
            return
        }
        let (startPointsNew, endPointsNew) = FNMatchFontParser.parserText(text!, width: self.frame.size.width)
        startPoints = startPointsNew
        endPoints = endPointsNew
    }
    
    func refreshView(_ progress:CGFloat) {
        let validProgress = min(progress, 1.0)  //限制到1以下
        if matchViews.count == 0 {
            return
        }
        for i in 0 ... matchViews.count - 1 {
            let duration = 0.6
            let interval = CGFloat((1-duration)/Double(matchViews.count - 1))
            var progressHandled = (validProgress - CGFloat(i) * interval) / 0.6
            if progressHandled<0 {
                progressHandled = 0
            }
            else if progressHandled>1 {
                progressHandled = 1
            }
            let startPoint = (startPoints![i] as! NSValue).cgPointValue
            let endPoint = (endPoints![i] as! NSValue).cgPointValue
            let centerPoint = CGPoint(x: (startPoint.x + endPoint.x)/2, y: (startPoint.y + endPoint.y)/2)
            let newCenterPoint:CGPoint
            let match = matchViews[i] as! FNMatchPullMatch
            if i%2 == 0 {
                newCenterPoint = CGPoint(x: centerPoint.x - horizontalMove * (1 - progressHandled), y: centerPoint.y - verticalMove * (1 - progressHandled))
                let rotate = CGAffineTransform(rotationAngle: match.angle + CGFloat(M_PI) * progressHandled)
                match.transform = rotate.scaledBy(x: progressHandled, y: progressHandled)
            }
            else {
                newCenterPoint = CGPoint(x: centerPoint.x + horizontalMove * (1 - progressHandled), y: centerPoint.y - verticalMove * (1 - progressHandled))
                let rotate = CGAffineTransform(rotationAngle: match.angle + CGFloat(M_PI) * progressHandled)
                match.transform = rotate.scaledBy(x: progressHandled, y: progressHandled)
            }
            match.center = newCenterPoint
        }
    }
    
    func startBling() {
        timer?.invalidate()
        timer = nil
        timer = Timer.scheduledTimer(timeInterval: 2.1,
                                                       target:self,selector:#selector(addAnimation),
                                                       userInfo:nil,repeats:true)
        timer.fire()
    }
    
    @objc func addAnimation() {
        if matchViews.count == 0 {
            return
        }
        let interval = 1.3/Double(matchViews.count)
        for i in 0 ... matchViews.count - 1 {
            let match = matchViews[i] as! FNMatchPullMatch
            UIView.animate(withDuration: 0.4, delay: interval * Double(i), options: .curveLinear, animations: {
                match.alpha = 1;
                }, completion: { (fff) in
                    UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
                        match.alpha = 0.4
                        }, completion: nil)
            })
        }
    }
    
    func endBling() {
        timer?.invalidate()
        timer = nil
        if matchViews.count == 0 {
            return
        }
        for i in 0 ... matchViews.count - 1 {
            let match = matchViews[i] as! FNMatchPullMatch
            match.layer.removeAllAnimations()
        }
        
        UIView.animate(withDuration: 1, animations: { 
            self.frame = CGRect(x: self.frame.origin.x, y: pullViewHeight/2, width: self.frame.size.width, height: self.frame.size.height)
        }) 
        
        //delay a bit of time as progress = 0 will perform later
        let delayTime = DispatchTime.now() + Double(Int64(0.01 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: delayTime) {
            for i in 0 ... self.matchViews.count - 1 {
                let match = self.matchViews[i] as! FNMatchPullMatch
                UIView.animate(withDuration: 0.5, delay: 0.6/Double(self.matchViews.count) * Double(self.matchViews.count - i), options: .curveLinear, animations: {
                    let rotate = CGAffineTransform(rotationAngle: match.angle)
                    match.transform = rotate.scaledBy(x: 0.1, y: 0.1)
                    match.center = match.oriCenter
                    }, completion: nil)
            }
        }

    }
}
