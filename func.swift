//
//  func.swift
//  Homemade V2
//
//  Created by Joshua Jon on 16/8/17.
//  Copyright © 2017 JoshuaJon. All rights reserved.
//

import UIKit

func imageWithGradient(img:UIImage!) -> UIImage{
    
    UIGraphicsBeginImageContext(img.size)
    let context = UIGraphicsGetCurrentContext()
    
    // starting point for drawing gradient
    img.draw(at: CGPoint(x: 0, y: 0))
    
    let colorSpace = CGColorSpaceCreateDeviceRGB()
    let locations:[CGFloat] = [0.4, 1.0]
    let bottom = UIColor(red: 0, green: 0, blue: 0, alpha: 5).cgColor
    let top = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
    let colors = [top, bottom] as CFArray
    let gradient = CGGradient(colorsSpace: colorSpace, colors: colors, locations: locations)
    let startPoint = CGPoint(x: img.size.width/2, y: 0)
    let endPoint = CGPoint(x: img.size.width/2, y: img.size.height)
    
    // draws linear gradient of image utilising start and end points
    context!.drawLinearGradient(gradient!, start: startPoint, end: endPoint, options: CGGradientDrawingOptions(rawValue: UInt32(0)))
    
    let image = UIGraphicsGetImageFromCurrentImageContext()
    
    UIGraphicsEndImageContext()
    
    return image!
}

// green favourites button
class greenButton: UIButton {

    // UIColor for addToShoppingListButton
    let borderColor = UIColor(red: 0, green: 191/255, blue: 165/255, alpha: 1)

    required init() {
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.borderWidth = 2.0
        layer.borderColor = borderColor.cgColor
    }
}
