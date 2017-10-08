//
//  TimeTableController.swift
//  Homemade V2
//
//  Created by Jackson Lloyd on 3/9/17.
//  Copyright © 2017 JoshuaJon. All rights reserved.
//

import Foundation
import UIKit

// initialised outside of class so that RecipeViewController can access
// Property referencing the model for managing data and business logic

let short = model.allRecipes.shortTime
let med = model.allRecipes.mediumTime
let long = model.allRecipes.longTime

class TimeTableController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // Property referencing the label in the view
    @IBOutlet weak var lblAnswers: UILabel!
    @IBOutlet weak var imgCard: UIImageView!
    @IBOutlet weak var placeHolder: UIView!
    var tblIndex = 0
    var time = 0
    var reps:[Recipe] = []
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if time == 1 {
            reps = short
        } else if time == 2 {
            reps = med
        } else if time == 3 {
            reps = long
        } else {
            reps = short
        }
        return reps.count
    }
    
    // returns cell in tableView of recipes
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "timeCell", for: indexPath) as! TimeCell
        
        //assign label and image
        cell.mealLabel.text = reps[indexPath.row].name
        cell.mealImage.image = UIImage(named: (reps[indexPath.row].name))
        
        //puts image to the back
        cell.mealImage.layer.zPosition = -5;
        
        /* add gradient over image*/
        cell.mealImage.image = imageWithGradient(img: cell.mealImage.image)
        return(cell)
    }
    
    // segue to MealSceneController for table row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tblIndex = indexPath.row
        performSegue(withIdentifier: "timeToMealSegue", sender: self)
    }
    override func prepare(for segue:UIStoryboardSegue, sender: Any?){
        if let destination = segue.destination as? MealSceneController {
            destination.recip = reps[tblIndex]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.hidesBackButton = true
        let backButton = UIBarButtonItem(image: UIImage(named: "backButton"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(TimeTableController.back(sender:)))
        self.navigationItem.leftBarButtonItem = backButton
        self.automaticallyAdjustsScrollViewInsets = true
    }
    func back(sender: UIBarButtonItem){
        self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

