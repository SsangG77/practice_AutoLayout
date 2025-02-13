//
//  TspacePassItems.swift
//  AutoLayout_sangjin
//
//  Created by 차상진 on 2/13/25.
//

import Foundation
import UIKit
import Fakery
import Then
import SnapKit


class TspacePassItem: CustomView {
    override init(frame: CGRect) { //UIView 의 생성자를 상속받음
        super.init(frame: frame)
        self.cornerRadius = 25
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupLayout() {
        
        let imageView = UIImageView(image: UIImage(systemName: "ticket.fill")).then {
            $0.backgroundColor = .clear
        }
        
        let imageContainerView = CustomView().then {
            $0.backgroundColor = .gray
            $0.layer.applyShadow()
        }
        
        imageContainerView.addSubview(imageView)
        
        
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(imageContainerView).inset(10)
        }
        
        
        
        
        self.addSubview(imageContainerView)
        
        imageContainerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        
        self.snp.makeConstraints { make in
            make.height.equalTo(200)
        }
        
        
    }
}


