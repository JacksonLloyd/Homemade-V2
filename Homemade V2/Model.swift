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
	var uuid:String
	
	
    //let insertFave = "INSERT INTO favourites (uuid, recipeID, name, image, timeTotal, rating, sourceURL) VALUES ('\(uuid)', '\(specieDetail.commonNameFR)', '\(specieDetail.commonNameES)', '\(specieDetail.commonNameDE)', '\(specieDetail.userNotes)');"
    var databasePath = NSString()
    
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
        uuid = UUID().uuidString
		
    }
	
    func retrieveFavourites(){
        let getFaves = "SELECT * FROM favourites WHERE uuid = '\(uuid)';"
        
        // Get a reference to the database
//        let recipesDB = FMDatabase(path: databasePath as String)
//        
//        if (recipesDB?.open())!
//        {
//            // Prepare a statement for operating on the database
//            let querySQL = "SELECT address, phone FROM CONTACTS WHERE name = '\(name.text!)'"
//            
//            let results:FMResultSet? = recipesDB?.executeQuery(querySQL,
//                                                               withArgumentsIn: nil)
//            
//            if results?.next() == true {
//                address.text = results?.string(forColumn: "address")!
//                phone.text = results?.string(forColumn: "phone")!
//                status.text = "Record Found"
//            } else {
//                status.text = "Record not found"
//                address.text = ""
//                phone.text = ""
//            }
//            recipesDB?.close()
//        } else {
//            print("Error: \(recipesDB?.lastErrorMessage())")
//        }
        
    }
    
    
    // Return the oracles response to the question posed by the user
//    func respond()->String
//    {
//        let recipe = Recipe()
//        //let ingredients = ingredients.getRecipeIngredients()
//        var recipeImpersontor = recipe
// 
//        // Set the current card name based on the specified index
//        startingRecipe = Array(recipe.recipe)[1]
//        
//        return startingRecipe.interpretation
//    }
	
	
}
