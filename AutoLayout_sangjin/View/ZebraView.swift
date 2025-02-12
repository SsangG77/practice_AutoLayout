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

class ZebraView : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    fileprivate func setupLayout() {
        self.layer.cornerRadius = 20
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.backgroundColor = .black
        
        let subTitleLabel = UILabel().then { label in
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "우주급 파격혜택"
            label.textColor = .black
            label.numberOfLines = 1
        }
        
        let titleLabel = UILabel().then { l in
            l.translatesAutoresizingMaskIntoConstraints = false
            l.text = "구독 요금 0원! \n T 우주패스 free"
            l.textColor = .white
            l.numberOfLines = 2
        }
        
        let imageView = UIImageView(image: UIImage(systemName: "bubble.right")).then { i in
            i.translatesAutoresizingMaskIntoConstraints = false
            
        }
        
        self.addSubview(subTitleLabel)
        NSLayoutConstraint.activate([
            subTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            subTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            subTitleLabel.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        
        
        
        
    }
    
    
    
    
    
}


class ZebraViewController : UIViewController {
    
    let zebraView = ZebraView()
    
    
    let container  = UIView().then { container in
        container.backgroundColor = .yellow
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        self.view.addSubview(container)
       
        
    }
}




#if DEBUG

import SwiftUI


struct ZebraViewPresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewCOntroller: UIViewControllerType, context: Context) {
        
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        ZebraViewController()
    }
    
}

struct ZebraViewControllerPresentablePreviews: PreviewProvider {
    static var previews: some View {
        ZebraViewPresentable()
            .ignoresSafeArea()
    }
}



#endif
