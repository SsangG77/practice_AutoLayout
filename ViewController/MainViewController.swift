//
//  MainViewController.swift
//  AutoLayout_sangjin
//
//  Created by 차상진 on 2/16/25.
//

import Foundation
import UIKit


class MainViewController : UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBAction func doSecondPushAction(_ sender: UIButton) {
        print(#fileID, #function, #line)
        
        let second = UIStoryboard(name: "SecondVC", bundle: Bundle.main)
        if let vc = second.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC {
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
    
    
}
