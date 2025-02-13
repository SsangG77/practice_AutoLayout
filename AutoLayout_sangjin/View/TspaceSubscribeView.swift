//
//  ZebraView.swift
//  AutoLayout_sangjin
//
//  Created by 차상진 on 2/12/25.
//

import Foundation
import SwiftUI
import UIKit
import Fakery
import Then
import SnapKit

class TspaceSubscribeView : CustomView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    fileprivate func setupLayout() {
       
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 30
        self.backgroundColor = .black
//        self.hasShadow = true
        self.layer.applyShadow(y: 5)
        
        let subTitleLabel = UILabel().then { label in
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "우주급 파격혜택"
            label.font = UIFont.systemFont(ofSize: 14)
            label.textColor = .white
            label.numberOfLines = 1
        }
        
        let titleLabel = UILabel().then { l in
            l.translatesAutoresizingMaskIntoConstraints = false
            l.text = "구독 요금 0원! \nT 우주패스 free"
            l.font = UIFont.systemFont(ofSize: 19)
            l.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 22)!
            l.textColor = .white
            l.numberOfLines = 2
        }
        
        let imageView = UIImageView(image: UIImage(systemName: "bubble.fill")).then { i in
            i.translatesAutoresizingMaskIntoConstraints = false
            i.backgroundColor = .clear
        }
        
        /// NSLayoutConstraint 로 작업
//        NSLayoutConstraint.activate([
//            imageView.widthAnchor.constraint(equalToConstant: 130),
//            imageView.heightAnchor.constraint(equalToConstant: 130),
//        ])
        
        /// Snapkit으로 작업
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(130)
        }
        
        
        self.addSubview(imageView)
        self.addSubview(subTitleLabel)
        self.addSubview(titleLabel)
        
        
        /// NSLayoutConstraint 로 작업
//        NSLayoutConstraint.activate([
//            subTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
//            subTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
//            subTitleLabel.widthAnchor.constraint(equalTo: self.widthAnchor),
//            
//            titleLabel.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 5),
//            titleLabel.leadingAnchor.constraint(equalTo: subTitleLabel.leadingAnchor),
//            
//            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
//            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: -5)
//        ])
        
        /// Snapkit으로 작업
        subTitleLabel.snp.makeConstraints { make in
            make.leading.top.equalTo(self).inset(40)
            make.width.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).inset(5)
            make.leading.equalTo(subTitleLabel.snp.leading)
        }
        imageView.snp.makeConstraints { make in
            make.trailing.equalTo(self.snp.trailing).inset(30)
            make.top.equalTo(titleLabel.snp.bottom).inset(5)
        }
        
        
        
//        NSLayoutConstraint.activate([
//            self.heightAnchor.constraint(equalToConstant: 250)
//        ])
        
        self.snp.makeConstraints { make in
            make.height.equalTo(250)
        }
        
        
        
        
        
    }
}


