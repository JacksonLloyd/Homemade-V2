//
//  ShoppingList.swift
//  Homemade V2
//
//  Created by Jackson Lloyd on 21/8/17.
//  Copyright © 2017 JoshuaJon. All rights reserved.
//

import Foundation

class ShoppingList{
    //var recipeID:String
    var recipeName:String
    var ingredients:[String]?
    
    init(recipeName:String, ingredients:[String]?){
        self.recipeName = recipeName
        self.ingredients = ingredients
    }
    
    init?(recipeName:String, ingredients:[String]){
        if recipeName.isEmpty{
            return nil
        }
        
        self.recipeName = recipeName
        self.ingredients = ingredients
    }
}
