//
//  AllRecipes.swift
//  Homemade V2
//
//  Created by Jackson Lloyd on 21/8/17.
//  Copyright © 2017 JoshuaJon. All rights reserved.
//

import Foundation

// Constants for building various url requests to the service
let BASE_URL: String = "http://api.yummly.com/v1/api/"
let ALL_RECIPES:String = "recipes"
let RECIPE_DETAILS:String = "recipe/"
let API_KEY:String = "_app_key=04689cd3a2a696e426bc2aa144f4e925"
let APP_ID:String = "_app_id=f9d0a582"
let APP_API:String = "?" + APP_ID + "&" + API_KEY

class AllRecipes{
    // Stored properties
    var recipes:[Recipe]?
	var arrayRecipes:[Recipe]? = []
	let session = URLSession.shared
    
    
    
    init()
    {
        //dummy data
        let item1 = Recipe(id:"m01", name:"PearsonDelight",
                                image:"PearsonDelight",
                                ingredients:["10g flour", "2 eggs", "250ml milk", "1 cup of water", "500g of bacon (preferably rindless bacon)", "2 eggs", "250ml milk", "1 cup of water", "500g of bacon (preferably rindless bacon)"],
                                timeTotal:10,
                                rating:2,
                                sourceURL:"http://iowagirleats.com/2016/04/25/bacon-and-goat-cheese-stuffed-sweet-pepper-poppers/")
        let item2 = Recipe(id:"m02", name:"AppleCrunch",
                                image:"AppleCrunch",
                                ingredients:["1 tablespoon of sriracha", "2 limes, zested and juices", "2 bunches of broccolini, ends trimmed", "4 salmon fillets"],
                                timeTotal:55,
                                rating:4,
                                sourceURL:"https://www.thepaleomom.com/shrimp-pad-thai/")
        let item3 = Recipe(id:"m03", name:"GloryBights",
                                image:"GloryBights",
                                ingredients:["200g dried rice noodles", "1 tablespoon of peanut oil", "500g of turkey mince"],
                                timeTotal:90,
                                rating:5,
                                sourceURL:"http://www.joyfulhealthyeats.com/bbq-chicken-zucchini-boats/")
        let item4 = Recipe(id:"m04", name:"LoydSpecial",
                                image:"LoydSpecial",
                                ingredients:["10g flour", "2 eggs", "250ml milk", "1 cup of water", "500g of bacon (preferably rindless bacon)", "2 eggs", "250ml milk", "1 cup of water", "500g of bacon (preferably rindless bacon)"],
                                timeTotal:10,
                                rating:2,
                                sourceURL:"http://iowagirleats.com/2016/04/25/bacon-and-goat-cheese-stuffed-sweet-pepper-poppers/")
        let item5 = Recipe(id:"m05", name:"ScatmanChicken",
                                image:"ScatmanChicken",
                                ingredients:["1 tablespoon of sriracha", "2 limes, zested and juices", "2 bunches of broccolini, ends trimmed", "4 salmon fillets"],
                                timeTotal:55,
                                rating:4,
                                sourceURL:"https://www.thepaleomom.com/shrimp-pad-thai/")
        let item6 = Recipe(id:"m06", name:"FestiveNuts",
                                image:"FestiveNuts",
                                ingredients:["200g dried rice noodles", "1 tablespoon of peanut oil", "500g of turkey mince"],
                                timeTotal:90,
                                rating:5,
                                sourceURL:"http://www.joyfulhealthyeats.com/bbq-chicken-zucchini-boats/")
        let item7 = Recipe(id:"m07", name:"SweetLemonde",
                                image:"SweetLemonde",
                                ingredients:["10g flour", "2 eggs", "250ml milk", "1 cup of water", "500g of bacon (preferably rindless bacon)", "2 eggs", "250ml milk", "1 cup of water", "500g of bacon (preferably rindless bacon)"],
                                timeTotal:200,
                                rating:2,
                                sourceURL:"http://iowagirleats.com/2016/04/25/bacon-and-goat-cheese-stuffed-sweet-pepper-poppers/")
        func recipePop() -> [Recipe] {
            return [item1!, item2!, item3!, item4!, item5!, item6!, item7!]
        }
		
		//DispatchQueue.main.async(execute: {})
		self.allRecipesAPI()
        
        // Create an array populate with one of each recipe
        recipes = arrayRecipes
    }
	
	
	func allRecipesAPI()
	{
		let getAllRecipes = BASE_URL + ALL_RECIPES + APP_API
		if let url = URL(string: getAllRecipes)
		{
			let request = URLRequest(url: url)
			// Initialise the task for getting the data, this is a custom method so you will get a compile error here as we haven't yet written this method.
			initialiseTaskForGettingData(request, element: "results")
		}
	}
	
	func initialiseTaskForGettingData(_ request: URLRequest, element:String)
	{
		/* 4 - Initialize task for getting data */
		let task = session.dataTask(with: request, completionHandler: {(data, response, downloadError) in
			// Handler in the case of an error
			if let error = downloadError
			{
				print("\(data) \n data")
				print("\(response) \n response")
				print("\(error)\n error")
			}
			else
			{
				do
				{
					self.recipes = [Recipe]()
					// Convert the http response payload to JSON.
					let parsedResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:Any]
					
					let data = parsedResult["matches"] as! [[String: AnyObject]]
					
					DispatchQueue.main.async(execute: {self.getRecipeDetails(data)})
					//self.tableView.reloadData()
				}
				catch let error as NSError
				{
					print(error)
				}
				catch
				{
					fatalError()
				}
				
				
			}
		})
		task.resume()
	}
	
	func getRecipeDetails(_ data: [[String: AnyObject]])
	{
		self.recipes = [Recipe]()
		
		for item in data
		{
			var recipe = Recipe(id:"m01",
			                    name:"PearsonDelight",
			                    image:"PearsonDelight",
			                    ingredients:["10g flour", "2 eggs", "250ml milk", "1 cup of water", "500g of bacon (preferably rindless bacon)", "2 eggs", "250ml milk", "1 cup of water", "500g of bacon (preferably rindless bacon)"],
			                    timeTotal:10,
			                    rating:2,
			                    sourceURL:"http://iowagirleats.com/2016/04/25/bacon-and-goat-cheese-stuffed-sweet-pepper-poppers/")
			
			let rDictionary = item as NSDictionary
			let recipeId:String = (rDictionary["id"] as? String)!
			
			// Build the URL as the basis for the request
			let recipeDetailsURL = BASE_URL + RECIPE_DETAILS + recipeId + APP_API
			let url = URL(string: recipeDetailsURL)!
			let request = URLRequest(url: url)
			
			
			// Initialise the task for getting the data
			let task = session.dataTask(with: request, completionHandler: {data, response, downloadError in
				if let error = downloadError
				{
					print(error)
				}
				else
				{
					// Parse the data received from the service
					var parsingError: NSError? = nil
					do
					{
						let parsedResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:AnyObject]
						
						//self.recipe = Recipe()
						var ingredientsArray:[String]? = []
						
						recipe!.id = (parsedResult["id"] as? String)!
						recipe!.name = (parsedResult["name"] as? String)!
						recipe!.timeTotal = (parsedResult["totalTimeInSeconds"] as? Int)!
						recipe!.rating = (parsedResult["rating"] as? Int)!
						
						if let imageURL = parsedResult["images"] as? [[String: AnyObject]] {
							let lrgImage = imageURL[0]
							recipe!.image = (lrgImage["hostedLargeUrl"]! as? String)!
						}
						
						if let source = parsedResult["source"] as? [String:AnyObject] {
							let sourceURL = source["sourceRecipeUrl"]
							recipe!.sourceURL = (source["sourceRecipeUrl"]! as? String)!
						}
						
						let ingredients = parsedResult["ingredientLines"] as! [String]
						
						for item in ingredients {
							ingredientsArray?.append(item)
						}
						recipe!.ingredients = ingredientsArray!
						
						self.arrayRecipes!.append(recipe!)
					} catch var error as NSError {
						parsingError = error
					}
					catch {
						fatalError()
					}
				}
			})
			task.resume()
		}
	}
	
	
	func getRecipes() -> [Recipe]
    {
        return recipes!
    }
    
}
