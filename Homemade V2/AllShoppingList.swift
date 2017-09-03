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
    let item1 = ShoppingList.init(recipeName:"Greek Pasta", ingredients:["flour","eggs","milk"])
    
    let item2 = ShoppingList.init(recipeName:"Ultimate Bacon Burger", ingredients:["cheese","lettuce","almonds", "30g butter"])
    
    let item3 = ShoppingList.init(recipeName:"Sweet Cake", ingredients:["potato","chicken","rice", "loaf of bread"])
    
    let item4 = ShoppingList.init(recipeName:"Custard Donut", ingredients:["flour","eggs","milk", "5 tablespoons canola oil"])
    
    let item5 = ShoppingList.init(recipeName:"Italian Meatballs", ingredients:["cheese","1/4 cup rice wine or white wine", "lettuce","almonds"])
    
    let item6 = ShoppingList.init(recipeName:"Gyros Platter", ingredients:["1 red onion, peeled and thinly sliced (about 2 cups)", "potato","chicken","rice"])
    
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
        return [item1!, item2!, item3!, item4!, item5!, item6!]
    }
    
    //doing loops by name will result in bugs, think about using recipe id?
    mutating func addToShoppingList(newItem:ShoppingList)
    {
        var alreadyAdded = false
        for (index, item) in shopList!.enumerated()
        {
            if item.recipeName == newItem.recipeName{
                alreadyAdded = true
            }
        }
        
        if (alreadyAdded == false) {
            shopList?.append(newItem)
        }
        
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
