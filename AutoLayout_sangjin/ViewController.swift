//
//  ViewController.swift
//  AutoLayout_sangjin
//
//  Created by 차상진 on 2/9/25.
//

import UIKit

class MyViewController: UIViewController {

    @IBOutlet var greenView: CustomView!
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        greenView.cornerRadius = 20
        
    }

    
}

