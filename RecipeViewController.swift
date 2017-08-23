//
//  RecipeViewController.swift
//  Homemade V2
//
//  Created by Joshua Jon on 22/8/17.
//  Copyright © 2017 JoshuaJon. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //properties
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
//    var model = Model.sharedInstance
//    let recipes = Model.sharedInstance.allRecipes.Recipes()
    
    // number of rows to display in table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return (recipes[tableIndex].ingredients!.count)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath) as! RecipeTableViewCell
         cell.ingredientLabel.text = recipes[tableIndex].ingredients?[indexPath.row]
        
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = recipes[tableIndex].name
        recipeImage.image = UIImage(named: recipes[tableIndex].imageName)
        func viewDidAppear(animated: Bool) {
            super.viewDidAppear(animated)
            tableView.reloadData()
        }
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToFeature(segue:UIStoryboardSegue){
    }

    @IBAction func backPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "unwindSegueToFeature", sender: self)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
