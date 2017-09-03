//
//  Recipes.swift
//  Homemade V2
//
//  Created by Jackson Lloyd on 21/8/17.
//  Copyright © 2017 JoshuaJon. All rights reserved.
//

import Foundation

enum Recipe:Int
{
    case recipe1=1, recipe2, recipe3, recipe4, recipe5, recipe6, recipe7
    
    // This initialiser is used to return a default representation if one is not asked for explicitly.
    init()
    {
        self = .recipe1
    }
    
    // This initialiser is used to request a specific card base on its rank.
    // Note this must be declared as 'Optional' because an invalid number could be provided which would result in 'nil' being returned.
    init?(number: Int)
    {
        switch number
        {
        case 1: self = .recipe1
        case 2: self = .recipe2
        case 3: self = .recipe3
        case 4: self = .recipe4
        case 5: self = .recipe5
        case 6: self = .recipe6
        case 7: self = .recipe7

        default:
            return nil
        }
    }
    
    var id:String
    {
        get
        {
            switch self
            {
            case .recipe1: return "m01"
            case .recipe2: return "m02"
            case .recipe3: return "m03"
            case .recipe4: return "m04"
            case .recipe5: return "m05"
            case .recipe6: return "m06"
            case .recipe7: return "m07"
//            default: return "m00"
            }
        }
    }
    
    var name:String
    {
        get
        {
            switch self
            {
            case .recipe1: return "PearsonDelight"
            case .recipe2: return "AppleCrunch"
            case .recipe3: return "GloryBights"
            case .recipe4: return "LoydSpecial"
            case .recipe5: return "ScatmanChicken"
            case .recipe6: return "FestiveNuts"
            case .recipe7: return "SweetLemonde"
//            default: return "Pearson Delight"
            }
        }
    }
    
    var imageName:String
    {
        get
        {
            if self.name != "" {
                return self.name.replacingOccurrences(of: " ", with: "")
            }
            else{
                return "defaultMealPic"
            }
        }
    }
    
    var ingredients:[String]?
    {
        get
        {
            switch self
            {
            case .recipe1: return ["10g flour", "2 eggs", "250ml milk", "1 cup of water", "500g of bacon (preferably rindless bacon)", "2 eggs", "250ml milk", "1 cup of water", "500g of bacon (preferably rindless bacon)"]
            case .recipe2: return ["1 tablespoon of sriracha", "2 limes, zested and juices", "2 bunches of broccolini, ends trimmed", "4 salmon fillets"]
            case .recipe3: return ["200g dried rice noodles", "1 tablespoon of peanut oil", "500g of turkey mince"]
            case .recipe4: return ["10g flour", "2 eggs", "250ml milk", "1 cup of water", "500g of bacon (preferably rindless bacon)", "2 eggs", "250ml milk", "1 cup of water", "500g of bacon (preferably rindless bacon)"]
            case .recipe5: return ["1 tablespoon of sriracha", "2 limes, zested and juices", "2 bunches of broccolini, ends trimmed", "4 salmon fillets"]
            case .recipe6: return ["200g dried rice noodles", "1 tablespoon of peanut oil", "500g of turkey mince"]
            case .recipe7: return ["10g flour", "2 eggs", "250ml milk", "1 cup of water", "500g of bacon (preferably rindless bacon)", "2 eggs", "250ml milk", "1 cup of water", "500g of bacon (preferably rindless bacon)"]
//            default: return ["yogurt", "oats"]
            }
        }
    }
    
    var timeTotal:Int
    {
        get
        {
            switch self
            {
            case .recipe1: return 10
            case .recipe2: return 55
            case .recipe3: return 90
            case .recipe4: return 10
            case .recipe5: return 55
            case .recipe6: return 90
            case .recipe7: return 200
//            default: return 60
            }
        }
    }
    
    var rating:Int
    {
        get
        {
            switch self
            {
            case .recipe1: return 2
            case .recipe2: return 4
            case .recipe3: return 5
            case .recipe4: return 2
            case .recipe5: return 4
            case .recipe6: return 5
            case .recipe7: return 2
//            default: return 1
            }
        }
    }
    
    var sourceURL:String
    {
        get
        {
            switch self
            {
            case .recipe1: return "http://iowagirleats.com/2016/04/25/bacon-and-goat-cheese-stuffed-sweet-pepper-poppers/"
            case .recipe2: return "https://www.thepaleomom.com/shrimp-pad-thai/"
            case .recipe3: return "http://www.joyfulhealthyeats.com/bbq-chicken-zucchini-boats/"
            case .recipe4: return "http://iowagirleats.com/2016/04/25/bacon-and-goat-cheese-stuffed-sweet-pepper-poppers/"
            case .recipe5: return "https://www.thepaleomom.com/shrimp-pad-thai/"
            case .recipe6: return "http://www.joyfulhealthyeats.com/bbq-chicken-zucchini-boats/"
            case .recipe7: return "http://iowagirleats.com/2016/04/25/bacon-and-goat-cheese-stuffed-sweet-pepper-poppers/"
//            default: return "https://www.yummly.com"
            }
        }
    }
    
    var favourite:Bool
    {
        get
        {
            switch self
            {
            case .recipe1: return true
            case .recipe2: return false
            case .recipe3: return true
            case .recipe4: return true
            case .recipe5: return false
            case .recipe6: return true
            case .recipe7: return true
//            default: return false
            }
        }
    }
    
    static func getRecipes() ->[Recipe]
    {
        return [recipe1, recipe2, recipe3, recipe4, recipe5, recipe6, recipe7]
    }
}
