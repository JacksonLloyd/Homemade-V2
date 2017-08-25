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
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addToShoppingListButton: UIButton!
    
    // UIColor for addToShoppingListButton
    let borderColor = UIColor(red: 0, green: 191/255, blue: 165/255, alpha: 1)
    
    // retunrs number of rows to display in table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return (recipes[tableIndex].ingredients!.count)
    }
    
    // returns cell in tableView of ingredients to be displayed
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath) as! RecipeTableViewCell
        
         cell.ingredientLabel.text = recipes[tableIndex].ingredients?[indexPath.row]
        
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = recipes[tableIndex].name
        recipeImage.image = UIImage(named: recipes[tableIndex].imageName)
        recipeImage.image = imageWithGradient(img: recipeImage.image)
        addToShoppingListButton.layer.borderColor = borderColor.cgColor
        
        tableView.backgroundView = nil;
        // reloads table data
        func viewDidAppear(animated: Bool) {
            super.viewDidAppear(animated)
            tableView.reloadData()
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // back button to feature view
    @IBAction func unwindToFeature(segue:UIStoryboardSegue){
    }
    
    // view directions button (Action) - opens recipe sourceURL in Safari
    @IBAction func directionsButton(_ sender: Any) {
        let svc = SFSafariViewController(url: URL(string: recipes[tableIndex].sourceURL)!)
        self.present(svc, animated: true, completion: nil)
    }
}
