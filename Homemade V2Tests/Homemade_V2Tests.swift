//
//  Homemade_V2Tests.swift
//  Homemade V2Tests
//
//  Created by Joshua Jon on 14/8/17.
//  Copyright © 2017 JoshuaJon. All rights reserved.
//

import XCTest
@testable import Homemade_V2

class Homemade_V2Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
	
	func testRecipe()
	{
		let recipe = Recipe(id:"01", name:"Cheese Burger", image:"", ingredients:[], timeTotal:0, rating:Double(0), sourceURL:"")
		
		//Test Initalisers of Recipe
//		func testIdInitialiser(recipe: Recipe) {
//			XCTAssertEqual(recipe.id, "01")
//		}
//		func testNameInitialiser(recipe: Recipe) {
//			XCTAssertEqual(recipe.name, "Cheese Burger")
//		}
		
//		func imageNil(recipe: Recipe) {
//			//check image is nil
////			XCTAssertNotNil(recipe.image)
//			
//			//check image is nil
////			recipe.image = nil
////			XCTAssertNil(recipe.image)
//		}
		
		func ingredients(recipe: Recipe) {
//			recipe.ingredients = nil
//			XCTAssertNil(recipe.ingredients)
			
			let ingredient:String = "1/2 a cup of flour"
			recipe.ingredients!.append(ingredient)
////			XCTAssertEqual(recipe.ingredients!, ["1/2 a cup of flour"])
			let ingredient2:String = "egg white"
			recipe.ingredients!.append(ingredient2)
//			XCTAssertEqual(recipe.ingredients!, ["1/2 a cup of flour", "egg white"])
//			
			recipe.ingredients!.removeAll()
			XCTAssertNil(recipe.ingredients)
		}
	}
	
	func testFavourites()
	{
		
	}
	
	func testRating()
	{
		
	}
	
	func testShoppingList()
	{
		
	}
}
