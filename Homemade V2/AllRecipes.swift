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
    var shortTime:[Recipe] = []
    var mediumTime:[Recipe] = []
    var longTime:[Recipe] = []
    
    init()
    {
        // Create an array populate with one of each recipe
        recipes = Recipe.getRecipes()
        favourites = getFavourites()
        shortTime = shortTiming()
        mediumTime = medTiming()
        longTime = longTiming()
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
<<<<<<< HEAD
    mutating func shortTiming() -> [Recipe]
    {
        for item in recipes {
            if item.timeTotal <= 45 {
                shortTime.append(item)
            }
        }
        return shortTime
    }
    mutating func medTiming() -> [Recipe]
    {
        for item in recipes {
            if item.timeTotal > 45 && item.timeTotal <= 90 {
                mediumTime.append(item)
            }
        }
        return mediumTime
    }
    mutating func longTiming() -> [Recipe]
    {
        for item in recipes {
            if item.timeTotal > 90 {
                longTime.append(item)
            }
        }
        return longTime
    }
=======

>>>>>>> origin/joshFavourites
}
