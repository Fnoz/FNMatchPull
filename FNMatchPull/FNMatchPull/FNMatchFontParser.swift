//
//  FNMatchFontParser.swift
//  FNMatchPull
//
//  Created by Fnoz on 16/6/26.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import Foundation
import UIKit

let fontWidth = CGFloat(25.0)
let fontHeight = CGFloat(40.0)
let fontWidthWithMargin = CGFloat(30.0)

class FNMatchFontParser: NSObject {
    class func parserText(text:NSString) -> (NSArray, NSArray) {
        var startPoints:NSMutableArray = []
        var endPoints:NSMutableArray = []
        let leftMargin = (SCREENWIDTH - fontWidthWithMargin * CGFloat(text.length) - fontWidthWithMargin + fontWidth)/2
        let topMargin = (pullViewHeight - fontHeight)/2
        for i in 0 ... text.length - 1 {
            let char = text.substringWithRange(NSMakeRange(i, 1))
            let (startPointsToAdd, endPointsToAdd) = parserChar(char)
            for j in 0 ... startPointsToAdd.count - 1 {
                var startPoint = (startPointsToAdd[j] as! NSValue).CGPointValue()
                startPoint.x += leftMargin + CGFloat(i) * fontWidthWithMargin
                startPoint.y += topMargin
                startPointsToAdd.replaceObjectAtIndex(j, withObject: NSValue.init(CGPoint: startPoint))
                var endPoint = (endPointsToAdd[j] as! NSValue).CGPointValue()
                endPoint.x += leftMargin + CGFloat(i) * fontWidthWithMargin
                endPoint.y += topMargin
                endPointsToAdd.replaceObjectAtIndex(j, withObject: NSValue.init(CGPoint: endPoint))
            }
            startPoints.addObjectsFromArray(startPointsToAdd as [AnyObject])
            endPoints.addObjectsFromArray(endPointsToAdd as [AnyObject])
        }
        
        return (startPoints, endPoints)
    }
    
    class func parserChar(char:NSString) -> (NSMutableArray, NSMutableArray) {
        var startPointsToAdd:NSMutableArray = []
        var endPointsToAdd:NSMutableArray = []
        switch char {
        case "A","a":
            startPointsToAdd = [NSValue.init(CGPoint: CGPointMake(0, 0)),
                                NSValue.init(CGPoint: CGPointMake(0, fontHeight * 0.6)),
                                NSValue.init(CGPoint: CGPointMake(0, 0)),
                                NSValue.init(CGPoint: CGPointMake(0, fontHeight * 0.6)),
                                NSValue.init(CGPoint: CGPointMake(fontWidth, 0)),
                                NSValue.init(CGPoint: CGPointMake(fontWidth, fontHeight * 0.6))]
            endPointsToAdd = [NSValue.init(CGPoint: CGPointMake(0, fontHeight * 0.6)),
                              NSValue.init(CGPoint: CGPointMake(0, fontHeight)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth, 0)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth, fontHeight * 0.6)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth, fontHeight * 0.6)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth, fontHeight))]
            break
        default:
            break
        }
        return (startPointsToAdd, endPointsToAdd)
    }
}