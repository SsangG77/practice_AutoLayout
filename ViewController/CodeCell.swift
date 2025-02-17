//
//  CodeCell.swift
//  AutoLayout_sangjin
//
//  Created by 차상진 on 2/17/25.
//

import Foundation
import UIKit

class CodeCell : UITableViewCell {
    
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "title label"
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    lazy var bodyLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "body label"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    /// 레이아웃 설정
    fileprivate func configureUI() {
        self.backgroundColor = .systemCyan
        
        self.contentView.addSubview(self.titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10)
        ])
        
        self.contentView.addSubview(self.bodyLabel)
        NSLayoutConstraint.activate([
            bodyLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 10),
            bodyLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            bodyLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            bodyLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10)
        ])
        
    }
    
    
}



#if DEBUG

import SwiftUI

struct CondeCell_Preview: PreviewProvider {
    static var previews: some View {
        CodeCell()
            .getPreview()
    }
}


#endif


