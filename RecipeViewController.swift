//
//  RecipeViewController.swift
//  Homemade V2
//
//  Created by Joshua Jon on 22/8/17.
//  Copyright © 2017 JoshuaJon. All rights reserved.
//

import UIKit
import SafariServices

class RecipeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //properties
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var totalTimeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    // retunrs number of rows to display in table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return (recipes[tableIndex].ingredients!.count+1)
    }
    
    // returns cell in tableView of ingredients to be displayed
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        if (indexPath.item == recipes[tableIndex].ingredients!.count) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingListCell", for: indexPath) as! RecipeShoppingButtonTableViewCell
            return cell

        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath) as! RecipeTableViewCell
            cell.ingredientLabel.text = recipes[tableIndex].ingredients?[indexPath.row]
            return cell

        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = recipes[tableIndex].name
        totalTimeLabel.text = "Total time: \(recipes[tableIndex].timeTotal) mins"
        recipeImage.image = UIImage(named: recipes[tableIndex].imageName)
        recipeImage.image = imageWithGradient(img: recipeImage.image)
        
        tableView.backgroundView = nil;
        // reloads table data
        func viewDidAppear(animated: Bool) {
            super.viewDidAppear(animated)
            tableView.reloadData()
        }
        self.navigationItem.hidesBackButton = true
        let backButton = UIBarButtonItem(image: UIImage(named: "backButton"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(RecipeViewController.back(sender:)))
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
    
    // back button to feature view
    @IBAction func unwindToFeature(segue:UIStoryboardSegue){
    }
    
    // add recipe ingredients to shopping list
    @IBAction func addToShoppingListButton(_ sender: Any) {
        let newItem = ShoppingList(recipeName: recipes[tableIndex].name, ingredients: recipes[tableIndex].ingredients)
        shoppingList.addToShoppingList(newItem: newItem)
    }
    
    
    // view directions button (Action) - opens recipe sourceURL in Safari
    @IBAction func directionsButton(_ sender: Any) {
        let svc = SFSafariViewController(url: URL(string: recipes[tableIndex].sourceURL)!)
        self.present(svc, animated: true, completion: nil)
    }
}
