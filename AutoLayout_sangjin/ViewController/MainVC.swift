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
        
        
        
        let tspaceSubscribeView = TspaceSubscribeView()
        let tspacePassItem = TspacePassItem()
        
        
        let newGoodsStackView = UIStackView().then {
            $0.axis = .horizontal
            $0.alignment = .center
            $0.spacing = 20
            $0.distribution = .fillEqually
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.addArrangedSubview(NewGoodsView())
            $0.addArrangedSubview(NewGoodsView())
        }
        
        
        let containerView = UIView().then { container in
            container.translatesAutoresizingMaskIntoConstraints = false
           
            container.addSubview(tspaceSubscribeView)
            container.addSubview(tspacePassItem)
            container.addSubview(newGoodsStackView)
        }
        
        tspaceSubscribeView.snp.makeConstraints { make in
            make.centerX.equalTo(containerView.snp.centerX)
            make.top.equalTo(containerView.snp.top).offset(10)
            make.width.equalTo(containerView.snp.width)
        }
        
        tspacePassItem.snp.makeConstraints { make in
            make.centerX.equalTo(containerView.snp.centerX)
            make.top.equalTo(tspaceSubscribeView.snp.bottom).offset(50)
            make.width.equalTo(containerView.snp.width)
        }
        
        
//        NSLayoutConstraint.activate([
//            newGoodsStackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
//            newGoodsStackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
//            newGoodsStackView.widthAnchor.constraint(equalTo: containerView.widthAnchor),
//            newGoodsStackView.topAnchor.constraint(equalTo: tspacePassItem.bottomAnchor, constant: 150),
//        ])
        newGoodsStackView.snp.makeConstraints { make in
            make.centerX.equalTo(containerView.snp.centerX)
            make.centerY.equalTo(containerView.snp.centerY)
            make.width.equalTo(containerView.snp.width)
            make.top.equalTo(tspacePassItem.snp.bottom).offset(150)
        }
        
     
        let scrollView = UIScrollView().then { sc in
            sc.alwaysBounceVertical = true
            sc.isUserInteractionEnabled = true
            sc.translatesAutoresizingMaskIntoConstraints = false
            sc.addSubview(containerView)
        }
        
        containerView.snp.makeConstraints { make in
            make.centerX.equalTo(scrollView.snp.centerX)
            make.edges.equalToSuperview().inset(20)
            make.width.equalTo(scrollView.frameLayoutGuide.snp.width).multipliedBy(0.9)
        }
        
        self.view.addSubview(scrollView)
 
        scrollView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
    } // setupScrollViewSnp
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
