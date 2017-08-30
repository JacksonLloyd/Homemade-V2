//
//  RecipeShoppingButtonTableViewCell.swift
//  Homemade V2
//
//  Created by Joshua Jon on 30/8/17.
//  Copyright © 2017 JoshuaJon. All rights reserved.
//

import UIKit

class RecipeShoppingButtonTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

class RoundedButton: UIButton {
    
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
    
    // round corners func
//    override func draw(_ rect: CGRect) {
//        super.draw(rect)
//        layer.cornerRadius = self.frame.height / 2
//        clipsToBounds = true
//    }
}
