//
//  AllRecipes.swift
//  Homemade V2
//
//  Created by Jackson Lloyd on 21/8/17.
//  Copyright © 2017 JoshuaJon. All rights reserved.
//

import Foundation

struct AllRecipes{
    // Stored properties
    var recipes:[Recipe]
    var favourites:[Recipe] = []
    
    init()
    {
        // Create an array populate with one of each recipe
        recipes = Recipe.getRecipes()
        favourites = getFavourites()
    }
    
    mutating func Recipes() -> [Recipe]
    {
        recipes = Recipe.getRecipes()
        return recipes
    }
    mutating func getFavourites() -> [Recipe]
    {
//        for fave in recipes {
//            if fave.favourite == true {
//                favourites.append(fave)
//            }
//        }
        return favourites
    }
    
    mutating func addToFavourites(newItem:Recipe)
    {
        favourites.append(newItem)
    }
    
    mutating func deleteFromFavourites(removedItem:Recipe)
    {
        for (index, item) in favourites.enumerated()
        {
            if item.id == removedItem.id{
                favourites.remove(at: index)
            }
        }
    }

}
