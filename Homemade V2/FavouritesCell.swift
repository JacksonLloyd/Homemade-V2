//
//  FavouritesCell.swift
//  Homemade V2
//
//  Created by Jackson Lloyd on 1/9/17.
//  Copyright © 2017 JoshuaJon. All rights reserved.

import UIKit

class FavouritesCell: UITableViewCell {
    @IBOutlet weak var mealImage: UIImageView!
    @IBOutlet weak var mealLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

