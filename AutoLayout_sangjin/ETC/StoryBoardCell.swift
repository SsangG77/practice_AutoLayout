//
//  StoryBoardCell.swift
//  AutoLayout_sangjin
//
//  Created by 차상진 on 2/16/25.
//

import Foundation
import UIKit

class StoryBoardCell : UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var bodyLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}
