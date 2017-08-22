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
    case recipe1=1, recipe2, recipe3, recipe4
    
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
        default:
            return nil
        }
    }

    
    var name:String
    {
        get
        {
            switch self
            {
            case .recipe1: return "meal1"
            case .recipe2: return "meal2"
            case .recipe3: return "meal3"
            default: return "meal1"
            }
        }
    }
    
    var imageName:String
    {
        get
        {
            return self.name.replacingOccurrences(of: " ", with: "")
        }
    }
    
    var ingredients:[String]?
    {
        get
        {
            switch self
            {
            case .recipe1: return ["flour", "egg"]
            case .recipe2: return ["bread", "ham", "cheese"]
            case .recipe3: return ["pasta", "meat sauce"]
            default: return ["yogurt", "oats"]
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
            default: return 60
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
            default: return 1
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
            default: return "https://www.yummly.com"
            }
        }
    }
    
    static func getRecipes() ->[Recipe]
    {
        return [recipe1, recipe2, recipe3]
    }
}
