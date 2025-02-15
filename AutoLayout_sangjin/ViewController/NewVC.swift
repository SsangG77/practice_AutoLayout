//
//  NewVC.swift
//  AutoLayout_sangjin
//
//  Created by 차상진 on 2/16/25.
//

import Foundation
import UIKit


class NewVC : UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    
    
    @IBOutlet var myTableView: UITableView!
    
    
    var dummyList : [String] = [
        "asdaf",
        "sdsfasdf",
        "asfasdf",
        "asdaf",
        "sdsfasdf",
        "asfasdf",
        "asdaf",
        "sdsfasdf",
        "asfasdf",
        "asdaf",
        "sdsfasdf",
        "asfasdf",
        "asdaf",
        "sdsfasdf",
        "asfasdf"
    ]
    
    
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        myTableView.dataSource = self
        myTableView.delegate = self
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dummyList.count // 데이터의 갯수
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "MyCell")
        cell.textLabel?.text = dummyList[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#fileID, #function, #line, "- ")
    }
    
}

