//
//  ViewController.swift
//  aBrandNewApp
//
//  Created by MIKE LAND on 12/10/15.
//  Copyright © 2015 MIKE LAND. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let image = UIImage(named: "theBackground") {
            self.view.backgroundColor = UIColor(patternImage: image)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

