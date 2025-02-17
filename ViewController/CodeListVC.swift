//
//  CodeListVC.swift
//  AutoLayout_sangjin
//
//  Created by 차상진 on 2/16/25.
//

import Foundation
import UIKit


class CodeListVC : UIViewController {
    
    @IBOutlet weak var myTableView : UITableView!
    
    var dummyList : [DummySection] = DummySection.getDummies(10)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    
    fileprivate func configureTableView() {
        self.myTableView.register(CodeCell.self, forCellReuseIdentifier: "CodeCell")
        
        myTableView.dataSource = self
        myTableView.delegate = self
        
    }
    
    
    
}






//MARK: - 데이터 소스 관리 extension
extension CodeListVC : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       "title : " + dummyList[section].title
    }
    
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        "footer : " +  dummyList[section].title
    }
    
    
    
    /// 현재 섹션이 몇개인지 반환하는 함수
    func numberOfSections(in tableView: UITableView) -> Int {
        dummyList.count
    }
    
    
    
    /// 하나의 섹션에 몇개의 row가 있는지 반환
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dummyList[section].rows.count // 데이터의 갯수
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CodeCell", for: indexPath) as? CodeCell {
            
            let sectionData : DummySection = dummyList[indexPath.section]
            
            let cellData : DummyData = sectionData.rows[indexPath.row]
            
            cell.titleLabel.text = cellData.title
            cell.bodyLabel.text = cellData.body
            
            return cell
        } else {
            return UITableViewCell()
        }
        
        
//        cell.textLabel?.text = cellData.title
//        cell.detailTextLabel?.numberOfLines = 0
//        cell.detailTextLabel?.text = cellData.body
        
        
    }
}


//MARK: - 델리겟 관리 extension
extension CodeListVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#fileID, #function, #line, "- ")
    }
}
