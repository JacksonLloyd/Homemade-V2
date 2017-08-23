//
//  MealSceneController.swift
//  Homemade V2
//
//  Created by Jackson Lloyd on 22/8/17.
//  Copyright © 2017 JoshuaJon. All rights reserved.
//

import Foundation
import UIKit

class MealSceneController: UIViewController{
    @IBOutlet weak var Placeholder: UIView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var mealImage: UIImageView!
    
    
    var swiped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        mealImage.image = UIImage(named: recipes[tableIndex].imageName)

        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        swipeUp.direction = UISwipeGestureRecognizerDirection.up
        
        /*if (swipeUp.direction == UISwipeGestureRecognizerDirection.up)
        {
            swiped = true
            button.isHidden = true
            
        }*/
        
        self.view.addGestureRecognizer(swipeUp)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*@IBAction func backPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }*/
    
    @IBAction func unwindToFeature(segue:UIStoryboardSegue){
        
    }
    
    @IBAction func backPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "unwindSegueToFeature", sender: self)
    }
    
    @IBAction func unwindToMeal(segue:UIStoryboardSegue){
        
    }
}

extension UIViewController
{
    func swipeAction(swipe:UISwipeGestureRecognizer)
    {
        if let swipeGesture = swipe as? UISwipeGestureRecognizer {
            switch swipeGesture.direction
            {
            case UISwipeGestureRecognizerDirection.up:
                performSegue(withIdentifier: "swipeUp", sender: self)
            default:
                break
            }
        }
    }
}
