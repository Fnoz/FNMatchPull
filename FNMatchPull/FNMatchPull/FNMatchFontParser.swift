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
    
    class func parserText(_ text: NSString, width: CGFloat) -> (NSArray, NSArray) {
        let startPoints: NSMutableArray = []
        let endPoints: NSMutableArray = []
        let leftMargin = (width - fontWidthWithMargin * CGFloat(text.length) + fontWidthWithMargin - fontWidth)/2
        let topMargin = (pullViewHeight - fontHeight)/2
        for i in 0 ... text.length - 1 {
            let char = text.substring(with: NSMakeRange(i, 1))
            let (startPointsToAdd, endPointsToAdd) = parserChar(char as NSString)
            if startPointsToAdd.count == 0 || endPointsToAdd.count == 0 {
                continue
            }
            for j in 0 ... startPointsToAdd.count - 1 {
                var startPoint = (startPointsToAdd[j] as! NSValue).cgPointValue
                startPoint.x += leftMargin + CGFloat(i) * fontWidthWithMargin
                startPoint.y += topMargin
                startPointsToAdd.replaceObject(at: j, with: NSValue.init(cgPoint: startPoint))
                var endPoint = (endPointsToAdd[j] as! NSValue).cgPointValue
                endPoint.x += leftMargin + CGFloat(i) * fontWidthWithMargin
                endPoint.y += topMargin
                endPointsToAdd.replaceObject(at: j, with: NSValue.init(cgPoint: endPoint))
            }
            startPoints.addObjects(from: startPointsToAdd as [AnyObject])
            endPoints.addObjects(from: endPointsToAdd as [AnyObject])
        }
        
        return (startPoints, endPoints)
    }
    
    class func parserChar(_ char: NSString) -> (NSMutableArray, NSMutableArray) {
        var startPointsToAdd:NSMutableArray = []
        var endPointsToAdd:NSMutableArray = []
        switch char {
        case "A","a":
            startPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.5, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight * 0.3)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight * 0.6)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.5, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight * 0.6)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight * 0.3)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight * 0.6))]
            endPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight * 0.3)),
                              NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight * 0.6)),
                              NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight * 0.3)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight * 0.6)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight * 0.6)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight))]
            break
        case "B","b":
            startPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: 0, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: fontHeight * 0.55, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight * 0.45)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight * 0.45)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight * 0.45)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight))]
            endPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight * 0.45)),
                              NSValue.init(cgPoint: CGPoint(x: fontHeight * 0.55, y: 0)),
                              NSValue.init(cgPoint: CGPoint(x: fontHeight * 0.45, y: fontHeight * 0.45)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight * 0.45)),
                              NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight))]
            break
        case "C","c":
            startPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: 0, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight * 0.5)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight * 0.7))]
            endPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight * 0.5)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: 0)),
                              NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight * 0.3)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight))]
            break
        case "D","d":
            startPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.2, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.2, y: fontHeight * 0.5)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight * 0.5)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight))]
            endPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.2, y: fontHeight * 0.5)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.2, y: fontHeight)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: 0)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight * 0.5)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight))]
            break
        case "E","e":
            startPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: 0, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight * 0.5)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight * 0.5)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight))]
            endPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight * 0.5)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: 0)),
                              NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.8, y: fontHeight * 0.5)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight))]
            break
        case "F","f":
            startPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: 0, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight * 0.5)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight * 0.5))]
            endPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight * 0.5)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: 0)),
                              NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.8, y: fontHeight * 0.5))]
            break
        case "G","g":
            startPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: 0, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight * 0.5)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.5, y: fontHeight * 0.5)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight * 0.5))]
            endPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight * 0.5)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: 0)),
                              NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight * 0.3)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight * 0.5)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight))]
            break
        case "H","h":
            startPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: 0, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight * 0.5)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight * 0.5)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight * 0.5))]
            endPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight * 0.5)),
                              NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight * 0.5)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight * 0.5)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight))]
            break
        case "I","i":
            startPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.5, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.5, y: fontHeight * 0.5))]
            endPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.5, y: fontHeight * 0.5)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.5, y: fontHeight))]
            break
        case "J","j":
            startPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.9, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.9, y: fontHeight * 0.5)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.1, y: fontHeight * 0.8)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.1, y: fontHeight))]
            endPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.9, y: fontHeight * 0.5)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.9, y: fontHeight)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.1, y: fontHeight)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.9, y: fontHeight))]
            break
        case "K","k":
            startPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: 0, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight * 0.5)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight * 0.5)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.7, y: fontHeight * 0.5)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.7, y: fontHeight * 0.5))]
            endPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight * 0.5)),
                              NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.7, y: fontHeight * 0.5)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: 0)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight))]
            break
        case "L","l":
            startPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.1, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.1, y: fontHeight * 0.5)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.1, y: fontHeight))]
            endPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.1, y: fontHeight * 0.5)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.1, y: fontHeight)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.9, y: fontHeight))]
            break
        case "M","m":
            startPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: 0, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight * 0.5)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.5, y: fontHeight * 0.4)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight * 0.5))]
            endPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight * 0.5)),
                              NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.5, y: fontHeight * 0.4)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: 0)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight * 0.5)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight))]
            break
        case "N","n":
            startPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: 0, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight * 0.5)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight * 0.5))]
            endPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight * 0.5)),
                              NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight * 0.6)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight * 0.5)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight))]
            break
        case "O","o":
            startPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: 0, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight * 0.5)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight * 0.5))]
            endPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight * 0.5)),
                              NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: 0)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight * 0.5)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight))]
            break
        case "P","p":
            startPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: 0, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight * 0.6)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight * 0.6)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth, y: 0))]
            endPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight * 0.6)),
                              NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: 0)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight * 0.6)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight * 0.6))]
            break
        case "Q","q":
            startPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: 0, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight * 0.5)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight * 0.5)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.4, y: fontHeight * 0.75))]
            endPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight * 0.5)),
                              NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: 0)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight * 0.5)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.6, y: fontHeight * 1.25))]
            break
        case "R","r":
            startPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: 0, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight * 0.6)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight * 0.6)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.6, y: fontHeight * 0.6))]
            endPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight * 0.6)),
                              NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: 0)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight * 0.6)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight * 0.6)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight))]
            break
        case "S","s":
            startPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: 0, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight * 0.45)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight * 0.8)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight * 0.45))]
            endPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight * 0.45)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: 0)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight * 0.2)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight * 0.45)),
                              NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight))]
            break
        case "T","t":
            startPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: 0, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.5, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.5, y: fontHeight * 0.5))]
            endPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: fontWidth, y: 0)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.5, y: fontHeight * 0.5)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.5, y: fontHeight))]
            break
        case "U","u":
            startPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: 0, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight * 0.5)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight * 0.5))]
            endPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight * 0.5)),
                              NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight * 0.5)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight))]
            break
        case "V","v":
            startPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: 0, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.25, y: fontHeight * 0.5)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.5, y: fontHeight)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.75, y: fontHeight * 0.5))]
            endPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.25, y: fontHeight * 0.5)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.5, y: fontHeight)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.75, y: fontHeight * 0.5)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: 0))]
            break
        case "W","w":
            startPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: fontWidth * -0.1, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth * -0.05, y: fontHeight * 0.5)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.5, y: fontHeight * 0.3)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth * 1.05, y: fontHeight * 0.5))]
            endPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: fontWidth * -0.05, y: fontHeight * 0.5)),
                              NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.5, y: fontHeight)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.5, y: fontHeight)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.5, y: fontHeight)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth * 1.05, y: fontHeight * 0.5)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth * 1.1, y: 0))]
            break
        case "X","x":
            startPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: 0, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight))]
            endPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.5, y: fontHeight * 0.5)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.5, y: fontHeight * 0.5)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.5, y: fontHeight * 0.5)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.5, y: fontHeight * 0.5))]
            break
        case "Y","y":
            startPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: 0, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight * 0.6)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.5, y: fontHeight * 0.6))]
            endPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight * 0.6)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight * 0.6)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight * 0.6)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.5, y: fontHeight))]
            break
        case "Z","z":
            startPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: 0, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth, y: 0)),
                                NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.5, y: fontHeight * 0.5)),
                                NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight))]
            endPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: fontWidth, y: 0)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.5, y: fontHeight * 0.5)),
                              NSValue.init(cgPoint: CGPoint(x: 0, y: fontHeight)),
                              NSValue.init(cgPoint: CGPoint(x: fontWidth, y: fontHeight))]
            break
        case ",":
            startPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.35, y: fontHeight * 0.65))]
            endPointsToAdd = [NSValue.init(cgPoint: CGPoint(x: fontWidth * 0.35, y: fontHeight))]
            break
        default:
            break
        }
        return (startPointsToAdd, endPointsToAdd)
    }
}
