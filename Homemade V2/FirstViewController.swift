//
//  FirstViewController.swift
//  Homemade V2
//
//  Created by Joshua Jon on 14/8/17.
//  Copyright © 2017 JoshuaJon. All rights reserved.
//

import UIKit

protocol Refresh
{
    func refresh(recipe:Recipe)
}

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Property referencing the label in the view
    @IBOutlet weak var lblAnswers: UILabel!
    
    @IBOutlet weak var imgCard: UIImageView!
    // Property referencing the model for managing data and business logic
    var model = Model.sharedInstance
    
    @IBOutlet weak var placeHolder: UIView!
    
    let recipes = Model.sharedInstance.allRecipes.recipeOrder()//["meal1", "meal2", "meal3", "meal4", "meal5"]
    var index = 0

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return (recipes.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FirstViewControllerTableViewCell
        
        cell.mealLabel.text = recipes[indexPath.row].name
        cell.mealImage.image = UIImage(named: (recipes[indexPath.row].name))
        
        //puts image to the back
        cell.mealImage.layer.zPosition = -5;
        
        /* add gradient over image
        cell.mealImage.image = imageWithGradient(img: cell.mealImage.image)*/
        return(cell)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

