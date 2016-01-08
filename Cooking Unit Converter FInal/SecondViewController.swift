//
//  SecondViewController.swift
//  Cooking Unit Converter FInal
//
//  Created by HChlebek on 12/19/15.
//  Copyright © 2015 HChlebek. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController
{

    @IBOutlet weak var finalLabel: UILabel!
    
    var output = ""
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        finalLabel.text = output
    
    }
    
}
