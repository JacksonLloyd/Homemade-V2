//
//  ShoppingListSectionTableViewCell.swift
//  Homemade V2
//
//  Created by Joshua Jon on 1/9/17.
//  Copyright © 2017 JoshuaJon. All rights reserved.
//

import UIKit

class ShoppingListSectionTableViewCell: UITableViewCell {
    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var shoppingListDeleteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
