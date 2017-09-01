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

var faveIndex = 0
//let model = Model.sharedInstance
let favourites = model.allFavourites.getFavourites()
//
//protocol Refresh
//{
//    func refresh(recipe:Recipe)
//}

class FavouritesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Property referencing the label in the view
    @IBOutlet weak var lblAnswers: UILabel!
    @IBOutlet weak var imgCard: UIImageView!
    @IBOutlet weak var placeHolder: UIView!
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return (favourites.count)
    }
    
    // returns cell in tableView of recipes
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "favouritesCell", for: indexPath) as! FavouritesCell
        
        //assign label and image
        cell.mealLabel.text = favourites[indexPath.row].name
        cell.mealImage.image = UIImage(named: (favourites[indexPath.row].name))
        
        //puts image to the back
        cell.mealImage.layer.zPosition = -5;
        
        /* add gradient over image*/
        cell.mealImage.image = imageWithGradient(img: cell.mealImage.image)
        return(cell)
    }
    
    // segue to MealSceneController for table row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        faveIndex = indexPath.row
        //performSegue(withIdentifier: "featureToMealSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //        self.navigationItem.hidesBackButton = true
        //        let backButton = UIBarButtonItem(image: UIImage(named: "backButton"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(FirstViewController.back))
        //        self.navigationItem.leftBarButtonItem = backButton
        //        self.automaticallyAdjustsScrollViewInsets = true
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
