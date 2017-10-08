//
//  FirstViewController.swift
//  Homemade V2
//
//  Created by Joshua Jon on 14/8/17.
//  Copyright © 2017 JoshuaJon. All rights reserved.
//

import UIKit

// initialised outside of class so that RecipeViewController can access
// Property referencing the model for managing data and business logic
var tableIndex = 0
let model = Model.sharedInstance
//var recipes = model.allRecipes.getRecipes()
var recipes:[Recipe]? = []

// Constants for building various url requests to the service
let BASE_URL: String = "http://api.yummly.com/v1/api/"
let ALL_RECIPES:String = "recipes"
let RECIPE_DETAILS:String = "recipe/"
let API_KEY:String = "_app_key=04689cd3a2a696e426bc2aa144f4e925"
let APP_ID:String = "_app_id=f9d0a582"
let APP_API:String = "?" + APP_ID + "&" + API_KEY
var START:Int = 0
let STARTSTR = "start="
//let movieTitle:String = txtMovieTitle.text!.escapedParameters()

protocol Refresh
{
    func refresh(recipe:Recipe)
}


class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    // Property referencing the label in the view
    @IBOutlet weak var lblAnswers: UILabel!
    @IBOutlet weak var imgCard: UIImageView!
    @IBOutlet weak var placeHolder: UIView!
    var filtered:[String] = []
    //var recipes:[Recipe]?
    let session = URLSession.shared
    var searchActive:Bool = false
    
    func allRecipesAPI()
    {
        let getAllRecipes = BASE_URL + ALL_RECIPES + APP_API + STARTSTR + String(START)
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
                    // Convert the http response payload to JSON.
                    let parsedResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:Any]
                    
                    let data = parsedResult["matches"] as! [[String: AnyObject]]
                    
					DispatchQueue.main.async(execute: {self.getRecipeDetails(data)})
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
		//recipes! = [Recipe]()
		
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
			let session = URLSession.shared

			
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
						
						//recipe = Recipe()
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
						
						recipes!.append(recipe!)
					} catch var error as NSError {
						parsingError = error
					}
					catch {
						fatalError()
					}
				}
				//print(recipes!)
				DispatchQueue.main.async(execute: {self.tableView.reloadData()})
			})
			task.resume()
		}
    }

	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		model.databaseSetup()
        // Do any additional setup after loading the view, typically from a nib.
        allRecipesAPI()
		
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
		
        /* Setup delegates */
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
		if tableView.contentOffset.y >= (tableView.contentSize.height - tableView.frame.size.height) {
			
			//you reached end of the table
		}
    }
	
    func back(){
        self.navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
     * Search bar functions
     */
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        searchBar.endEditing(true)
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        
        if(filtered.count == 0){
            searchActive = false;
        } else {
            searchActive = true;
        }
    }
    
    /**
     * Table Setup
     */
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return recipes?.count ?? 0
    }
    
    // returns cell in tableView of recipes
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FirstViewControllerTableViewCell
        
        //assign label and image
        cell.mealLabel.text = recipes?[indexPath.row].name
        
        let url = recipes?[indexPath.row].image!
		cell.mealImage.loadImageUsingUrlString(urlString: url!)

        //puts image to the back
        cell.mealImage.layer.zPosition = -5;
		
        return(cell)
    }
	
    // segue to MealSceneController for table row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableIndex = indexPath.row
        performSegue(withIdentifier: "featureToMealSegue", sender: self)
    }
    override func prepare(for segue:UIStoryboardSegue, sender: Any?){
        if let destination = segue.destination as? MealSceneController {
            destination.recip = recipes?[tableIndex]
        }
    }


}

