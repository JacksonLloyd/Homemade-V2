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
var recipes = model.allRecipes.recipes


class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    // Property referencing the label in the view
    @IBOutlet weak var lblAnswers: UILabel!
    @IBOutlet weak var imgCard: UIImageView!
    @IBOutlet weak var placeHolder: UIView!
    var filtered:[String] = []
    //var recipes:[Recipe]? = model.allRecipes.recipes
    var searchActive:Bool = false
	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
		
        /* Setup delegates */
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
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

