//
//  Model.swift
//  Homemade V2
//
//  Created by Jackson Lloyd on 21/8/17.
//  Copyright © 2017 JoshuaJon. All rights reserved.
//

import Foundation

class Model
{
    var allRecipes:AllRecipes
    var allShoppingList:AllShoppingList
    var allFavourites:Favourites
    
    /* Here we use a Struct to hold the instance of the model i.e itself*/
    private struct Static
    {
        static var instance: Model?
    }
    
    /* This is a class variable allowing me to access it without first instantiating the model Now we can retrieve the model without instantiating it directly var model = Model.sharedInstance */
    class var sharedInstance: Model
    {
        if !(Static.instance != nil)
        {
            Static.instance = Model()
        }
        return Static.instance!
    }
    
    // Populate the model with a set of Recipes
    private init()
    {
        allRecipes = AllRecipes()
        allShoppingList = AllShoppingList()
        allFavourites = Favourites()!
    }
    
    
    // Return the oracles response to the question posed by the user
    /*func respond()->String
    {
        let recipe = Recipe()
        //let ingredients = ingredients.getRecipeIngredients()
        var recipeImpersontor = recipe
 
        // Set the current card name based on the specified index
        startingRecipe = Array(recipe.recipe)[1]
        
        return startingRecipe.interpretation
    }*/
}
