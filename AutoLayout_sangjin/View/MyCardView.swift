//
//  MyCardView.swift
//  AutoLayout_sangjin
//
//  Created by 차상진 on 2/11/25.
//

import Foundation
import UIKit

class MyCardView : UIView {
    
    override init(frame: CGRect) { //UIView 의 생성자를 상속받음
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    //MARK: - 레이아웃 설정
    fileprivate func setupLayout() {
        
        self.layer.cornerRadius = 10
        self.translatesAutoresizingMaskIntoConstraints = false
        
//        NSLayoutConstraint.activate([
//            self.widthAnchor.constraint(equalToConstant: 100),
//            self.heightAnchor.constraint(equalToConstant: 200)
//        ])
        
        //제목 라벨
        let titleLabel = UILabel()
        titleLabel.text = "사운드\n테라피"
        titleLabel.numberOfLines = 0 //0으로 하면 무한줄
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
       
        //"무료" 라벨
        let subTitleLabel = UILabel()
        subTitleLabel.text = "Free"
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //서브 타이틀 뷰
        let subTitleLabelBg = UIView()
        subTitleLabelBg.backgroundColor = .systemMint
        subTitleLabelBg.translatesAutoresizingMaskIntoConstraints = false
        
        subTitleLabelBg.addSubview(subTitleLabel)
        
        //제목 라벨 constraint 설정
        NSLayoutConstraint.activate([
            subTitleLabel.centerXAnchor.constraint(equalTo: subTitleLabelBg.centerXAnchor),
            subTitleLabel.centerYAnchor.constraint(equalTo: subTitleLabelBg.centerYAnchor),
            subTitleLabel.topAnchor.constraint(equalTo: subTitleLabelBg.topAnchor, constant: 5),
            subTitleLabel.leadingAnchor.constraint(equalTo: subTitleLabelBg.leadingAnchor, constant: 5)
            
        ])
        
        
        //image view
        let bottomImageView = UIImageView(image: UIImage(systemName: "figure.wave"))
        bottomImageView.translatesAutoresizingMaskIntoConstraints = false
        bottomImageView.contentMode = .scaleAspectFit
        
        
        NSLayoutConstraint.activate([
            bottomImageView.widthAnchor.constraint(equalToConstant: 50),
            bottomImageView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        
        
        //아이템 뷰에 제목 라벨 추가
        self.addSubview(titleLabel)
        
        self.addSubview(subTitleLabelBg)
        
        
        self.addSubview(bottomImageView)
        
        
        NSLayoutConstraint.activate([
            
            self.heightAnchor.constraint(equalToConstant: 200),
            
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            subTitleLabelBg.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            subTitleLabelBg.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            bottomImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            bottomImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5)
        ])
       
        
        self.backgroundColor = .systemYellow
        
        
    }
    
}

