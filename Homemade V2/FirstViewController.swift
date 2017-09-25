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
let recipes = model.allRecipes.getRecipes()
let session = URLSession.shared

// Constants for building various url requests to the service
let BASE_URL: String = "http://api.yummly.com/v1/api/"
let ALL_RECIPES:String = "recipes/"
let RECIPE_DETAILS:String = "recipe/"
let API_KEY:String = "?_app_key=04689cd3a2a696e426bc2aa144f4e925"
let APP_KEY:String = "?_app_id=f9d0a582"
var ID_LENGTH:Int = 4
//let movieTitle:String = txtMovieTitle.text!.escapedParameters()
//let findMovieId = BASE_URL + SEARCH_MOVIE + API_KEY + "&" + movieTitle
//if let url = URL(string: findMovieId)
//{
//    let request = URLRequest(url: url)
//    // Initialise the task for getting the data, this is a custom method so you will get a compile error here as we haven't yet
//    written this method.
//    initialiseTaskForGettingData(request, element: "results")
//}

protocol Refresh
{
    func refresh(recipe:Recipe)
}
extension String {
    
    func escapedParameters() -> String {
        
        var urlVars = [String]()
        let parameters:[String: AnyObject] = [
            "query": self as AnyObject
        ]
        
        for (key, value) in parameters {
            
            /* Make sure that it is a string value */
            let stringValue = "\(value)"
            
            /* Escape it */
            let escapedValue = stringValue.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
            
            /* Append it */
            urlVars += [key + "=" + "\(escapedValue!)"]
        }
        
        return (!urlVars.isEmpty ? "" : "") + urlVars.joined(separator: "&")
    }
}

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Property referencing the label in the view
    @IBOutlet weak var lblAnswers: UILabel!
    @IBOutlet weak var imgCard: UIImageView!
    @IBOutlet weak var placeHolder: UIView!

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return (recipes.count)
    }
    
    // returns cell in tableView of recipes
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FirstViewControllerTableViewCell
        
        //assign label and image
        cell.mealLabel.text = recipes[indexPath.row].name
        cell.mealImage.image = UIImage(named: (recipes[indexPath.row].name))
        
        //puts image to the back
        cell.mealImage.layer.zPosition = -5;
        
        /* add gradient over image*/
        cell.mealImage.image = imageWithGradient(img: cell.mealImage.image)
        return(cell)
    }
    
    // segue to MealSceneController for table row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableIndex = indexPath.row
        performSegue(withIdentifier: "featureToMealSegue", sender: self)
    }
    override func prepare(for segue:UIStoryboardSegue, sender: Any?){
        if let destination = segue.destination as? MealSceneController {
            destination.recip = recipes[tableIndex]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    func back(){
        self.navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

