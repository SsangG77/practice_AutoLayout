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
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupLayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 30
        self.layer.applyShadow()
        self.backgroundColor = .white
        
        let imageView = UIImageView(image: UIImage(systemName: "ticket.fill")).then {
            $0.backgroundColor = .clear
            $0.layer.applyShadow()
        }
        
        let imageContainerView = CustomView().then {
            $0.backgroundColor = .lightGray
            $0.layer.cornerRadius = 30
        }
        
        let categoryTitlelabel = UILabel().then {
            $0.text = "T 우주패스 DIY"
            $0.textColor = .lightGray
            $0.font = UIFont.systemFont(ofSize: 12)
            $0.numberOfLines = 1

        }
        
        let titleLabel = UILabel().then {
            $0.text = "DIY 기본 상품 팩 2+ 추가 상품 1~2개 더"
            $0.textColor = .black
            $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 22)!
            $0.numberOfLines = 2
        }
       
        
        let priceLabel = UILabel().then {
            $0.text = "9,900원~/1개월"
            $0.textColor = .black
            $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)!
            $0.numberOfLines = 1
        }
        
        let labelStackView = UIStackView().then {
            
            $0.axis = .vertical
            $0.alignment = .leading
            $0.spacing = 10
            $0.distribution = .fillEqually
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.addArrangedSubview(categoryTitlelabel)
            $0.addArrangedSubview(titleLabel)
            $0.addArrangedSubview(priceLabel)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(labelStackView)
        }
       
        self.addSubview(labelStackView)
       
        imageContainerView.addSubview(imageView)
        
        
        imageView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(imageContainerView).inset(10)
            make.top.bottom.equalTo(imageContainerView).inset(90)
        }
        
        self.addSubview(imageContainerView)
        
        imageContainerView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(30)
            make.bottom.equalTo(labelStackView.snp.top).inset(-5)
        }
        
        labelStackView.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.bottom.equalTo(self.snp.bottom).inset(20)
            make.leading.equalTo(imageContainerView.snp.leading)
            make.trailing.equalTo(imageContainerView.snp.trailing)
        }
        
        
        
        self.snp.makeConstraints { make in
            make.height.equalTo(600)
        }
        
        
    }
}



