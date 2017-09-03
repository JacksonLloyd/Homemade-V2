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
<<<<<<< HEAD
let favourites = model.allFavourites.favourites
=======
var favourites = model.allFavourites.getFavourites()
var favouritesList = model.allFavourites
>>>>>>> origin/joshFavourites
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
<<<<<<< HEAD
    var tblIndex = 0

=======
    @IBOutlet weak var tableView: UITableView!
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        viewWillAppear(true)
        self.tableView.reloadData()

    }
>>>>>>> origin/joshFavourites
    
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
        tblIndex = indexPath.row
        performSegue(withIdentifier: "favouriteToMealSegue", sender: self)
    }
    override func prepare(for segue:UIStoryboardSegue, sender: Any?){
        if let destination = segue.destination as? MealSceneController {
            destination.recip = favourites[tblIndex]
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD
=======
//        self.tableView.reloadData()
        tableView.delegate = self
        tableView.dataSource = self
        
        print(favourites)
>>>>>>> origin/joshFavourites
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
