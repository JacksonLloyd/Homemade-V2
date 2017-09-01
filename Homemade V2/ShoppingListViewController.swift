//
//  ShoppingListViewController.swift
//  Homemade V2
//
//  Created by Joshua Jon on 30/8/17.
//  Copyright © 2017 JoshuaJon. All rights reserved.
//

import UIKit
    var shoppingList = model.allShoppingList


class ShoppingListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidAppear(_ animated: Bool) {
         self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (shoppingList.getShoppingList()![section].ingredients!.count)
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = shoppingList.getShoppingList()?[section].recipeName
        return title
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return (shoppingList.getShoppingList()!.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingIngredientCell", for: indexPath) as! ShoppingListTableViewCell
        cell.shoppingIngredientLabel.text = shoppingList.getShoppingList()![indexPath.section].ingredients?[indexPath.row]
        return cell
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
