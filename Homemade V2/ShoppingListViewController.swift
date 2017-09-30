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
        // reloads table for any recipe add or delete
         self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // set the section header height
        self.tableView.estimatedSectionHeaderHeight = 10
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // returns number of sections in tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return (shoppingList.getShoppingList()!.count)
    }
    
    // returns number of rows in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sections = shoppingList.getShoppingList()![section].ingredients!.count
        return sections
    }
    
    // custom view for header in section
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "sectionHeaderCell") as! ShoppingListSectionTableViewCell
        headerCell.sectionLabel.text = shoppingList.getShoppingList()?[section].name
        headerCell.shoppingListDeleteButton.tag = section
        return headerCell
    }
    
    // returns cells to be displayed in sections
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingIngredientCell", for: indexPath) as! ShoppingListTableViewCell
        cell.shoppingIngredientLabel.text = shoppingList.getShoppingList()![indexPath.section].ingredients?[indexPath.row]
        return cell
    }
    
    // delete button to remove recipe from shopping list
    @IBAction func shoppingListDeleteButton(_ sender: UIButton) {
        shoppingList.deleteFromShoppingList(removedItem: shoppingList.getShoppingList()![sender.tag])
        self.tableView.reloadData()
    }
}
