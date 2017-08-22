//
//  AllShoppingList.swift
//  Homemade V2
//
//  Created by Jackson Lloyd on 23/8/17.
//  Copyright © 2017 JoshuaJon. All rights reserved.
//

import Foundation


struct AllShoppingList{
    // Stored properties
    var shopList:[ShoppingList]?
    
    //dummy data
    let item1 = ShoppingList.init(recipeName:"meal1", ingredients:["flour","eggs","milk"])
    
    let item2 = ShoppingList.init(recipeName:"meal2", ingredients:["cheese","lettuce","almonds"])
    
    let item3 = ShoppingList.init(recipeName:"meal3", ingredients:["potato","chicken","rice"])
    
    init()
    {
        // Create an array populate with one of each recipe
        shopList = getList()
    }
    
    mutating func getShoppingList() ->[ShoppingList]?
    {
        return shopList
    }
    mutating func getList() ->[ShoppingList]?
    {
        return [item1!, item2!, item3!]
    }
    
    //doing loops by name will result in bugs, think about using recipe id?
    mutating func addToShoppingList(newItem:ShoppingList)
    {
        shopList?.append(newItem)
    }
    mutating func deleteFromShoppingList(removedItem:ShoppingList)
    {
        for (index, item) in shopList!.enumerated()
        {
            if item.recipeName == removedItem.recipeName{
                shopList?.remove(at: index)
            }
        }
    }
}
