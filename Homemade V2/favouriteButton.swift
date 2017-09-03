//
//  favouriteButton.swift
//  Homemade V2
//
//  Created by Joshua Jon on 2/9/17.
//  Copyright © 2017 JoshuaJon. All rights reserved.
//

import UIKit

class favouriteButton: UIButton {
    var isFavourite = false
    let buttonColor = UIColor(red: 0, green: 191/255, blue: 90/255, alpha: 1)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initButton()
    }
    
    func initButton() {
        layer.borderWidth = 2.0
        layer.borderColor = buttonColor.cgColor
        layer.cornerRadius = frame.size.height/2
        
        setTitleColor(buttonColor, for: .normal)
        addTarget(self, action: #selector(favouriteButton.buttonPressed), for: .touchUpInside)
    }
    
    func buttonPressed() {
        activateButton(bool: !isFavourite)
        
    }
    
    func activateButton(bool: Bool) {
        isFavourite = true
        
        let color = bool ? buttonColor : .clear
        let title = bool ? "Favourite" : "Add Favourite"
        let titleColor = bool ? . white : buttonColor
        
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        backgroundColor = color
    }
    
}
