//
//  MainVC.swift
//  AutoLayout_sangjin
//
//  Created by 차상진 on 2/12/25.
//

import Foundation
import UIKit
import Fakery
import Then
import SnapKit

class MainVC : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setupScrollViewDefault()
        
//        setupScrollViewSnp()
    }
    
}

//MARK: - ui setting - default
extension MainVC {
    
    
    /// 스냅킷 스크롤뷰 셋업
    fileprivate func setupScrollViewSnp() {
        let fakery = Faker(locale : "ko")
 
        
        let contentLabel = UILabel().then { l in
            l.numberOfLines = 0
            l.text = fakery.lorem.paragraphs(amount: 50)
        }
      
        contentLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(20)
        }
      
        
        let containerView = UIView().then { container in
            container.backgroundColor = .yellow
            container.addSubview(contentLabel)
        }
        
        
       
        
        let scrollView = UIScrollView().then { sc in
            sc.alwaysBounceVertical = true
            sc.isUserInteractionEnabled = true
            sc.addSubview(containerView)
        }
        
       
        
       
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView.contentLayoutGuide.snp.edges)
            make.width.equalTo(scrollView.frameLayoutGuide.snp.width)
        }
        
        
        
        self.view.addSubview(scrollView)
        
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
    /// 기본 스크롤뷰 셋업
    fileprivate func setupScrollViewDefault() {
        let fakery = Faker(locale : "ko")
 
        
        let contentLabel = UILabel().then { l in
            l.numberOfLines = 0
            l.translatesAutoresizingMaskIntoConstraints = false
            l.text = fakery.lorem.paragraphs(amount: 50)
        }
     
        let topStackView = UIStackView().then {
            $0.axis = .horizontal
            $0.alignment = .center
            $0.spacing = 20
            $0.distribution = .fillEqually
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.addArrangedSubview(MyCardView())
            $0.addArrangedSubview(MyCardView())
            $0.addArrangedSubview(MyCardView())
        }
        
        let zebraView = ZebraView()
        
        
        let containerView = UIView().then { container in
            container.translatesAutoresizingMaskIntoConstraints = false
            container.backgroundColor = .yellow
           
            container.addSubview(zebraView)
            container.addSubview(topStackView)
            container.addSubview(contentLabel)
        }
        
        NSLayoutConstraint.activate([
            zebraView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            zebraView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 1),
            zebraView.topAnchor.constraint(equalTo: containerView.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            topStackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            topStackView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 1),
            topStackView.topAnchor.constraint(equalTo: zebraView.topAnchor)
        ])
        
      
        NSLayoutConstraint.activate([
            contentLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            contentLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            contentLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            contentLabel.topAnchor.constraint(equalTo: topStackView.bottomAnchor)
           
        ])
      
     
        
        
        
        let scrollView = UIScrollView().then { sc in
            sc.alwaysBounceVertical = true
            sc.isUserInteractionEnabled = true
            sc.translatesAutoresizingMaskIntoConstraints = false
            sc.addSubview(containerView)
        }
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: 10),
            containerView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor, constant: 10),
            containerView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            containerView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor, multiplier: 0.95),
            containerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
            
        ])
        
        
        self.view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
    }
}



#if DEBUG

import SwiftUI


struct MainVCPresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewCOntroller: UIViewControllerType, context: Context) {
        
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        MainVC()
    }
    
}

struct MainVCPresentablePreviews: PreviewProvider {
    static var previews: some View {
        MainVCPresentable()
            .ignoresSafeArea()
    }
}



#endif
