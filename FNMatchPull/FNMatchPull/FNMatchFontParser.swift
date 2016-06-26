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
let fontHeight = CGFloat(25.0)
let fontWidthWithMargin = CGFloat(35.0)

class FNMatchFontParser: NSObject {
    class func parserText(text:NSString) -> (NSArray, NSArray) {
        var startPoints:NSMutableArray = []
        var endPoints:NSMutableArray = []
        let leftMargin = (SCREENWIDTH - fontWidthWithMargin * CGFloat(text.length) - fontWidthWithMargin + fontWidth)/2
        let topMargin = (pullViewHeight - fontHeight)/2
        for i in 0 ... text.length - 1 {
            let char = text.substringWithRange(NSMakeRange(i, 1))
            let (startPointsToAdd, endPointsToAdd) = parserChar(char)
            if startPointsToAdd.count == 0 || endPointsToAdd.count == 0 {
                continue
            }
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
            startPointsToAdd = [NSValue.init(CGPoint: CGPointMake(fontWidth * 0.5, 0)),
                                NSValue.init(CGPoint: CGPointMake(0, fontHeight * 0.3)),
                                NSValue.init(CGPoint: CGPointMake(0, fontHeight * 0.6)),
                                NSValue.init(CGPoint: CGPointMake(fontWidth * 0.5, 0)),
                                NSValue.init(CGPoint: CGPointMake(0, fontHeight * 0.6)),
                                NSValue.init(CGPoint: CGPointMake(fontWidth, fontHeight * 0.3)),
                                NSValue.init(CGPoint: CGPointMake(fontWidth, fontHeight * 0.6))]
            endPointsToAdd = [NSValue.init(CGPoint: CGPointMake(0, fontHeight * 0.3)),
                              NSValue.init(CGPoint: CGPointMake(0, fontHeight * 0.6)),
                              NSValue.init(CGPoint: CGPointMake(0, fontHeight)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth, fontHeight * 0.3)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth, fontHeight * 0.6)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth, fontHeight * 0.6)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth, fontHeight))]
            break
        case "B","b":
            startPointsToAdd = [NSValue.init(CGPoint: CGPointMake(0, 0)),
                                NSValue.init(CGPoint: CGPointMake(0, 0)),
                                NSValue.init(CGPoint: CGPointMake(fontHeight * 0.55, 0)),
                                NSValue.init(CGPoint: CGPointMake(0, fontHeight * 0.45)),
                                NSValue.init(CGPoint: CGPointMake(0, fontHeight * 0.45)),
                                NSValue.init(CGPoint: CGPointMake(fontWidth, fontHeight * 0.45)),
                                NSValue.init(CGPoint: CGPointMake(0, fontHeight))]
            endPointsToAdd = [NSValue.init(CGPoint: CGPointMake(0, fontHeight * 0.45)),
                              NSValue.init(CGPoint: CGPointMake(fontHeight * 0.55, 0)),
                              NSValue.init(CGPoint: CGPointMake(fontHeight * 0.45, fontHeight * 0.45)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth, fontHeight * 0.45)),
                              NSValue.init(CGPoint: CGPointMake(0, fontHeight)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth, fontHeight)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth, fontHeight))]
            break
        case "C","c":
            startPointsToAdd = [NSValue.init(CGPoint: CGPointMake(0, 0)),
                                NSValue.init(CGPoint: CGPointMake(0, 0)),
                                NSValue.init(CGPoint: CGPointMake(0, fontHeight * 0.5)),
                                NSValue.init(CGPoint: CGPointMake(fontWidth, 0)),
                                NSValue.init(CGPoint: CGPointMake(0, fontHeight)),
                                NSValue.init(CGPoint: CGPointMake(fontWidth, fontHeight * 0.7))]
            endPointsToAdd = [NSValue.init(CGPoint: CGPointMake(0, fontHeight * 0.5)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth, 0)),
                              NSValue.init(CGPoint: CGPointMake(0, fontHeight)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth, fontHeight * 0.3)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth, fontHeight)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth, fontHeight))]
            break
        case "D","d":
            startPointsToAdd = [NSValue.init(CGPoint: CGPointMake(fontWidth * 0.2, 0)),
                                NSValue.init(CGPoint: CGPointMake(fontWidth * 0.2, fontHeight * 0.5)),
                                NSValue.init(CGPoint: CGPointMake(0, 0)),
                                NSValue.init(CGPoint: CGPointMake(fontWidth, 0)),
                                NSValue.init(CGPoint: CGPointMake(fontWidth, fontHeight * 0.5)),
                                NSValue.init(CGPoint: CGPointMake(0, fontHeight))]
            endPointsToAdd = [NSValue.init(CGPoint: CGPointMake(fontWidth * 0.2, fontHeight * 0.5)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth * 0.2, fontHeight)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth, 0)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth, fontHeight * 0.5)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth, fontHeight)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth, fontHeight))]
            break
        case "E","e":
            startPointsToAdd = [NSValue.init(CGPoint: CGPointMake(0, 0)),
                                NSValue.init(CGPoint: CGPointMake(0, 0)),
                                NSValue.init(CGPoint: CGPointMake(0, fontHeight * 0.5)),
                                NSValue.init(CGPoint: CGPointMake(0, fontHeight * 0.5)),
                                NSValue.init(CGPoint: CGPointMake(0, fontHeight))]
            endPointsToAdd = [NSValue.init(CGPoint: CGPointMake(0, fontHeight * 0.5)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth, 0)),
                              NSValue.init(CGPoint: CGPointMake(0, fontHeight)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth * 0.8, fontHeight * 0.5)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth, fontHeight))]
            break
        case "F","f":
            startPointsToAdd = [NSValue.init(CGPoint: CGPointMake(0, 0)),
                                NSValue.init(CGPoint: CGPointMake(0, 0)),
                                NSValue.init(CGPoint: CGPointMake(0, fontHeight * 0.5)),
                                NSValue.init(CGPoint: CGPointMake(0, fontHeight * 0.5))]
            endPointsToAdd = [NSValue.init(CGPoint: CGPointMake(0, fontHeight * 0.5)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth, 0)),
                              NSValue.init(CGPoint: CGPointMake(0, fontHeight)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth * 0.8, fontHeight * 0.5))]
            break
        case "G","g":
            startPointsToAdd = [NSValue.init(CGPoint: CGPointMake(0, 0)),
                                NSValue.init(CGPoint: CGPointMake(0, 0)),
                                NSValue.init(CGPoint: CGPointMake(0, fontHeight * 0.5)),
                                NSValue.init(CGPoint: CGPointMake(fontWidth, 0)),
                                NSValue.init(CGPoint: CGPointMake(fontWidth * 0.5, fontHeight * 0.5)),
                                NSValue.init(CGPoint: CGPointMake(0, fontHeight)),
                                NSValue.init(CGPoint: CGPointMake(fontWidth, fontHeight * 0.5))]
            endPointsToAdd = [NSValue.init(CGPoint: CGPointMake(0, fontHeight * 0.5)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth, 0)),
                              NSValue.init(CGPoint: CGPointMake(0, fontHeight)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth, fontHeight * 0.3)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth, fontHeight * 0.5)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth, fontHeight)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth, fontHeight))]
            break
        case "H","h":
            startPointsToAdd = [NSValue.init(CGPoint: CGPointMake(0, 0)),
                                NSValue.init(CGPoint: CGPointMake(0, fontHeight * 0.5)),
                                NSValue.init(CGPoint: CGPointMake(0, fontHeight * 0.5)),
                                NSValue.init(CGPoint: CGPointMake(fontWidth, 0)),
                                NSValue.init(CGPoint: CGPointMake(fontWidth, fontHeight * 0.5))]
            endPointsToAdd = [NSValue.init(CGPoint: CGPointMake(0, fontHeight * 0.5)),
                              NSValue.init(CGPoint: CGPointMake(0, fontHeight)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth, fontHeight * 0.5)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth, fontHeight * 0.5)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth, fontHeight))]
            break
        case "I","i":
            startPointsToAdd = [NSValue.init(CGPoint: CGPointMake(fontWidth * 0.5, 0)),
                                NSValue.init(CGPoint: CGPointMake(fontWidth * 0.5, fontHeight * 0.5))]
            endPointsToAdd = [NSValue.init(CGPoint: CGPointMake(fontWidth * 0.5, fontHeight * 0.5)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth * 0.5, fontHeight))]
            break
        case "J","j":
            startPointsToAdd = [NSValue.init(CGPoint: CGPointMake(fontWidth * 0.9, 0)),
                                NSValue.init(CGPoint: CGPointMake(fontWidth * 0.9, fontHeight * 0.5)),
                                NSValue.init(CGPoint: CGPointMake(fontWidth * 0.1, fontHeight * 0.8)),
                                NSValue.init(CGPoint: CGPointMake(fontWidth * 0.1, fontHeight))]
            endPointsToAdd = [NSValue.init(CGPoint: CGPointMake(fontWidth * 0.9, fontHeight * 0.5)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth * 0.9, fontHeight)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth * 0.1, fontHeight)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth * 0.9, fontHeight))]
            break
        case "K","k":
            startPointsToAdd = [NSValue.init(CGPoint: CGPointMake(0, 0)),
                                NSValue.init(CGPoint: CGPointMake(0, fontHeight * 0.5)),
                                NSValue.init(CGPoint: CGPointMake(0, fontHeight * 0.5)),
                                NSValue.init(CGPoint: CGPointMake(fontWidth * 0.7, fontHeight * 0.5)),
                                NSValue.init(CGPoint: CGPointMake(fontWidth * 0.7, fontHeight * 0.5))]
            endPointsToAdd = [NSValue.init(CGPoint: CGPointMake(0, fontHeight * 0.5)),
                              NSValue.init(CGPoint: CGPointMake(0, fontHeight)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth * 0.7, fontHeight * 0.5)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth, 0)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth, fontHeight))]
            break
        case "L","l":
            startPointsToAdd = [NSValue.init(CGPoint: CGPointMake(fontWidth * 0.1, 0)),
                                NSValue.init(CGPoint: CGPointMake(fontWidth * 0.1, fontHeight * 0.5)),
                                NSValue.init(CGPoint: CGPointMake(fontWidth * 0.1, fontHeight))]
            endPointsToAdd = [NSValue.init(CGPoint: CGPointMake(fontWidth * 0.1, fontHeight * 0.5)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth * 0.1, fontHeight)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth * 0.9, fontHeight))]
            break
        case "M","m":
            startPointsToAdd = [NSValue.init(CGPoint: CGPointMake(0, 0)),
                                NSValue.init(CGPoint: CGPointMake(0, fontHeight * 0.5)),
                                NSValue.init(CGPoint: CGPointMake(0, 0)),
                                NSValue.init(CGPoint: CGPointMake(fontWidth * 0.5, fontHeight * 0.4)),
                                NSValue.init(CGPoint: CGPointMake(fontWidth, 0)),
                                NSValue.init(CGPoint: CGPointMake(fontWidth, fontHeight * 0.5))]
            endPointsToAdd = [NSValue.init(CGPoint: CGPointMake(0, fontHeight * 0.5)),
                              NSValue.init(CGPoint: CGPointMake(0, fontHeight)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth * 0.5, fontHeight * 0.4)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth, 0)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth, fontHeight * 0.5)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth, fontHeight))]
            break
        case "N","n":
            startPointsToAdd = [NSValue.init(CGPoint: CGPointMake(0, 0)),
                                NSValue.init(CGPoint: CGPointMake(0, fontHeight * 0.5)),
                                NSValue.init(CGPoint: CGPointMake(0, 0)),
                                NSValue.init(CGPoint: CGPointMake(fontWidth, 0)),
                                NSValue.init(CGPoint: CGPointMake(fontWidth, fontHeight * 0.5))]
            endPointsToAdd = [NSValue.init(CGPoint: CGPointMake(0, fontHeight * 0.5)),
                              NSValue.init(CGPoint: CGPointMake(0, fontHeight)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth, fontHeight * 0.6)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth, fontHeight * 0.5)),
                              NSValue.init(CGPoint: CGPointMake(fontWidth, fontHeight))]
            break
        default:
            break
        }
        return (startPointsToAdd, endPointsToAdd)
    }
}