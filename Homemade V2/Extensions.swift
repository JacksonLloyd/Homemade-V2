//
//  extensions.swift
//  Homemade V2
//
//  Created by Jackson Lloyd on 1/10/17.
//  Copyright © 2017 JoshuaJon. All rights reserved.
//

import Foundation
import UIKit

extension String {

    func escapedParameters() -> String {

        var urlVars = [String]()
        let parameters:[String: AnyObject] = [
            "query": self as AnyObject
        ]

        for (key, value) in parameters {

            /* Make sure that it is a string value */
            let stringValue = "\(value)"

            /* Escape it */
            let escapedValue = stringValue.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)

            /* Append it */
            urlVars += [key + "=" + "\(escapedValue!)"]
        }

        return (!urlVars.isEmpty ? "" : "") + urlVars.joined(separator: "&")
    }
}

extension UIImageView {
    public func loadImageUsingUrlString(urlString: String) {
        
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                print(error)
                return
            }
            
            DispatchQueue.main.async(execute: {self.image = UIImage(data: data!)})
        }).resume()
    }
    
}
