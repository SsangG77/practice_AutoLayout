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
        
//        setupScrollViewDefault()
        
        setupScrollViewSnp()
    }
    
}

//MARK: - ui setting - default
extension MainVC {
    
    
    /// 스냅킷 스크롤뷰 셋업
    fileprivate func setupScrollViewSnp() {
        
        let fakery = Faker(locale : "ko")
 
        let contentLabel = UILabel().then {
            $0.numberOfLines = 0
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.text = fakery.lorem.paragraphs(amount: 1)
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
        
        
        
        let tspaceSubscribeView = TspaceSubscribeView()
        let tspacePassItem = TspacePassItem()
        
        let containerView = UIView().then { container in
            container.translatesAutoresizingMaskIntoConstraints = false
            
           
            container.addSubview(tspaceSubscribeView)
            container.addSubview(tspacePassItem)
            container.addSubview(topStackView)
            container.addSubview(contentLabel)
        }
        
        tspaceSubscribeView.snp.makeConstraints { make in
            make.centerX.equalTo(containerView.snp.centerX)
            make.top.equalTo(containerView.snp.top).offset(10)
            make.width.equalTo(containerView.snp.width)
        }
        
        tspacePassItem.snp.makeConstraints { make in
            make.centerX.equalTo(containerView.snp.centerX)
            make.top.equalTo(tspaceSubscribeView.snp.bottom).offset(20)
            make.width.equalTo(containerView.snp.width)
        }
        
        
        NSLayoutConstraint.activate([
            topStackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            topStackView.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            topStackView.topAnchor.constraint(equalTo: tspacePassItem.bottomAnchor, constant: 30)
        ])
        
      
        NSLayoutConstraint.activate([
            contentLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            contentLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            contentLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            contentLabel.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 30)
           
        ])
      
     
        let scrollView = UIScrollView().then { sc in
            sc.alwaysBounceVertical = true
            sc.isUserInteractionEnabled = true
            sc.translatesAutoresizingMaskIntoConstraints = false
            sc.addSubview(containerView)
        }
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().offset(10)
            make.width.equalTo(scrollView.frameLayoutGuide.snp.width).multipliedBy(0.95)
            make.centerX.equalTo(scrollView.snp.centerX)
        }
        
        self.view.addSubview(scrollView)
 
        scrollView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
        
    } // setupScrollViewSnp
    
    /// 기본 스크롤뷰 셋업
    fileprivate func setupScrollViewDefault() {
        let fakery = Faker(locale : "ko")
 
        
        let contentLabel = UILabel().then { l in
            l.numberOfLines = 0
            l.translatesAutoresizingMaskIntoConstraints = false
            l.text = fakery.lorem.paragraphs(amount: 1)
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
        
        
        
        let tspaceSubscribeView = TspaceSubscribeView()
        
        let containerView = UIView().then { container in
            container.translatesAutoresizingMaskIntoConstraints = false
//            container.backgroundColor = .yellow
            
           
            container.addSubview(tspaceSubscribeView)
            container.addSubview(topStackView)
            container.addSubview(contentLabel)
        }
        
        
        
        NSLayoutConstraint.activate([
            tspaceSubscribeView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            tspaceSubscribeView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            tspaceSubscribeView.widthAnchor.constraint(equalTo: containerView.widthAnchor)
        ])
        
        
        
        NSLayoutConstraint.activate([
            topStackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            topStackView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 1),
            topStackView.topAnchor.constraint(equalTo: tspaceSubscribeView.bottomAnchor, constant: 30)
        ])
        
      
        NSLayoutConstraint.activate([
            contentLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            contentLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            contentLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            contentLabel.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 30)
           
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
        
    } // setupScrollViewDefault
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
