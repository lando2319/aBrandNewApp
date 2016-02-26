//
//  ViewController.swift
//  aBrandNewApp
//
//  Created by MIKE LAND on 12/10/15.
//  Copyright © 2015 MIKE LAND. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var theMainLabel: UILabel!
    @IBOutlet weak var theLowerLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let image = UIImage(named: "theBackground") {
            self.view.backgroundColor = UIColor(patternImage: image)
        }
    }

    @IBAction func tipTap(sender: AnyObject) {
        let rand1:Int = Int(arc4random_uniform(UInt32(6))+1)
        let rand2:Int = Int(arc4random_uniform(UInt32(6))+1)
        
        self.theMainLabel.text = String(rand1 + rand2)
        self.eval(rand1 + rand2)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func eval(diceRoll:Int) {
        switch diceRoll {
        case 2, 3, 4, 9, 10, 11, 12:
            self.theLowerLabel.text = "WON"
        default:
            self.theLowerLabel.text = "LOST"
        }
    }

}

