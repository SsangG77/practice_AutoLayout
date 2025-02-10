//
//  ViewController.swift
//  AutoLayout_sangjin
//
//  Created by 차상진 on 2/9/25.
//

import UIKit




class MyViewController: UIViewController {

  
    lazy var topStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        self.view.backgroundColor = .blue
        
        
        //첫번째 아이템 뷰
        let firstView = generateCardView()
        

        

        self.view.addSubview(topStackView)
        
        NSLayoutConstraint.activate([
            topStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            topStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            topStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
        ])
        
        topStackView.addSubview(firstView)
        
        
//        let redView = UIView()
//        redView.translatesAutoresizingMaskIntoConstraints = false
//        redView.backgroundColor = UIColor.red
//        self.view.addSubview(redView)
        
//        //크기
//        redView.widthAnchor.constraint(equalToConstant: 100).isActive = true
//        redView.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        
//        //위치
//        redView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 200).isActive = true
//        redView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 200).isActive = true
        
//        NSLayoutConstraint.activate([
//            redView.widthAnchor.constraint(equalToConstant: 100),
//            redView.heightAnchor.constraint(equalToConstant: 200),
//            redView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            redView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 300),
//            
//        ])
        
        
    }

    
}


//MARK: - extention
extension UIViewController {
    
    
    fileprivate func generateCardView() -> UIView {
        
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .yellow
        
        //제목 라벨
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Hello \n World!"
        titleLabel.numberOfLines = 0 //0으로 하면 무한줄
        
        //"무료" 라벨
        let freeTitleLabel = UILabel()
        freeTitleLabel.text = "Free"
        freeTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //서브 타이틀 뷰
        let freeSubView = UIView()
        freeSubView.translatesAutoresizingMaskIntoConstraints = false
        freeSubView.backgroundColor = .systemMint
        
        
        //아이템 뷰에 제목 라벨 추가
        containerView.addSubview(titleLabel)
        
        //제목 라벨 constraint 설정
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20)
        ])
        
        
        //첫번쨰 아이템 뷰에 서브 타이틀 뷰 추가
        containerView.addSubview(freeSubView)
        
        
        //서브 타이틀 뷰 constraint 설정
        NSLayoutConstraint.activate([
            freeSubView.heightAnchor.constraint(equalToConstant: 50),
            freeSubView.widthAnchor.constraint(equalToConstant: 100),
            freeSubView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            freeSubView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10)
            
        ])
        
          
          //서브 타이틀 뷰에 "무료" 라벨 추가
          freeSubView.addSubview(freeTitleLabel)
        
        
        
        //"무료" 라벨 설정
        NSLayoutConstraint.activate([
            freeTitleLabel.centerXAnchor.constraint(equalTo: freeSubView.centerXAnchor),
            freeTitleLabel.centerYAnchor.constraint(equalTo: freeSubView.centerYAnchor),
            freeTitleLabel.topAnchor.constraint(equalTo: freeSubView.topAnchor, constant: 5),
            freeTitleLabel.leadingAnchor.constraint(equalTo: freeSubView.leadingAnchor, constant: 5)
        ])
        
        return containerView
    }
    
}
