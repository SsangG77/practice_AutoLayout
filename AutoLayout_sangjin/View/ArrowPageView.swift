//
//  ArrowPageView.swift
//  AutoLayout_sangjin
//
//  Created by 차상진 on 2/12/25.
//

import Foundation
import UIKit
import Then




class ArrowPageView : UIStackView {
    override init(frame : CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    fileprivate func setupLayout() {
        
        
            self.spacing = 10
            self.alignment = .center
            self.axis = .horizontal
            self.distribution = .equalCentering
            self.translatesAutoresizingMaskIntoConstraints = false
            self.backgroundColor = .gray
            self.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
            self.layer.cornerRadius = 10
            self.isLayoutMarginsRelativeArrangement = true
        
        let leadingImgView = UIImageView().then { imageView in
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(systemName: "arrow.left")
            imageView.translatesAutoresizingMaskIntoConstraints = false
        }
        

        let centerLabel = UILabel().then { label in
            label.text = "page 2"
            label.translatesAutoresizingMaskIntoConstraints = false
        }


        let trailingImgView : UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(systemName: "arrow.right")
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        
        NSLayoutConstraint.activate([
            leadingImgView.widthAnchor.constraint(equalToConstant: 30),
            leadingImgView.heightAnchor.constraint(equalToConstant: 30),
            trailingImgView.widthAnchor.constraint(equalToConstant: 30),
            trailingImgView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        
        
        self.addArrangedSubview(leadingImgView)
        self.addArrangedSubview(centerLabel)
        self.addArrangedSubview(trailingImgView)
        
        
        
        
    }// setupLayout()
    
    
    
    
    
}



