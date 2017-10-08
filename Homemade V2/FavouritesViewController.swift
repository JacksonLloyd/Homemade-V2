//
//  FavouritesViewController.swift
//  Homemade V2
//
//  Created by Jackson Lloyd on 1/9/17.
//  Copyright © 2017 JoshuaJon. All rights reserved.
//

import Foundation
import UIKit

// initialised outside of class so that RecipeViewController can access
// Property referencing the model for managing data and business logic


//let model = Model.sharedInstance
let favourites = model.allFavourites.favourites
//
//protocol Refresh
//{
//    func refresh(recipe:Recipe)s
//}

class FavouritesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // Property referencing the label in the view
    @IBOutlet weak var lblAnswers: UILabel!
    @IBOutlet weak var imgCard: UIImageView!
    @IBOutlet weak var placeHolder: UIView!
    @IBOutlet weak var tableView: UITableView!
    var tblIndex = 0
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if favourites == nil {
            return 0
        }
        return favourites!.count
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if favourites == nil {
            return 0
        }
        return favourites!.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "favSectionHeader") as! FavouritesSectionHeaderTableViewCell
        
        if (section == 0) {
            headerCell.favSectionLabel.text = "No adfljdaf"
        }else if (section == 1) {
            headerCell.favSectionLabel.text = "Lunch Ideas"
        } else if (section == 2) {
            headerCell.favSectionLabel.text = "Dessert Insporation"
        } else{
            headerCell.favSectionLabel.text = "Family meals"
        }
        return headerCell
    }


    // returns cell in tableView of recipes
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        if favourites == nil {
            
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "favouritesCell", for: indexPath) as! FavouritesCell
        
        //assign label and image
        cell.mealLabel.text = favourites?[indexPath.row].name
        cell.mealImage.image = UIImage(named: (favourites?[indexPath.row].name)!)
        
        //puts image to the back
        cell.mealImage.layer.zPosition = -5;
        
        /* add gradient over image*/
        cell.mealImage.image = imageWithGradient(img: cell.mealImage.image)
        return(cell)
    }
    
    // segue to MealSceneController for table row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tblIndex = indexPath.row
        performSegue(withIdentifier: "favouriteToMealSegue", sender: self)
    }
    override func prepare(for segue:UIStoryboardSegue, sender: Any?){
        if let destination = segue.destination as? MealSceneController {
            destination.recip = favourites?[tblIndex]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.tableView.estimatedSectionHeaderHeight = 10
        
//        // Create the database
//        let filemgr = FileManager.default
//        let dirPaths =
//            NSSearchPathForDirectoriesInDomains(.documentDirectory,
//                                                .userDomainMask, true)
//        
//        let docsDir = dirPaths[0]
//        
//        databasePath = (docsDir as NSString).appendingPathComponent(
//            "recipesdb.db") as NSString
    }
    
    func back(){
        self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
