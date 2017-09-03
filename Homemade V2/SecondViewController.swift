//
//  SecondViewController.swift
//  Homemade V2
//
//  Created by Joshua Jon on 14/8/17.
//  Copyright © 2017 JoshuaJon. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var segueTime = 0
    
    @IBAction func shortBtn(_ sender: Any) {
        segueTime = 1
        performSegue(withIdentifier: "timeBtn", sender: self)
    }
    @IBAction func medBtn(_ sender: Any) {
        segueTime = 2
        performSegue(withIdentifier: "timeBtn", sender: self)
    }
    @IBAction func longBtn(_ sender: Any) {
        segueTime = 3
        performSegue(withIdentifier: "timeBtn", sender: self)
    }
    
    override func prepare(for segue:UIStoryboardSegue, sender: Any?){
        if let destination = segue.destination as? TimeTableController {
            destination.time = segueTime
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

