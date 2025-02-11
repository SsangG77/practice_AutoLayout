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
        
        self.view.backgroundColor = .white
        
        //첫번째 아이템 뷰
        self.view.addSubview(topStackView)
        
        NSLayoutConstraint.activate([
            topStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            topStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            topStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20)
        ])
        
        topStackView.addArrangedSubview(MyCardView())
        topStackView.addArrangedSubview(MyCardView())
        topStackView.addArrangedSubview(MyCardView())
        
        
        
        
        
        
        
        
        
        let leadingImgView : UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(systemName: "arrow.left")
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        
        
        
        let centerLabel : UILabel = {
            let label = UILabel()
            label.text = "Page 2"
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        
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
        
        
        
        let secondStackView : UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [
                leadingImgView,
                centerLabel,
                trailingImgView
            ])
            stackView.spacing = 10
            stackView.alignment = .center
            stackView.axis = .horizontal
            stackView.distribution = .equalCentering
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.backgroundColor = .gray
            stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
            stackView.layer.cornerRadius = 10
            stackView.isLayoutMarginsRelativeArrangement = true
            return stackView
        }()
        
        self.view.addSubview(secondStackView)
        
        NSLayoutConstraint.activate([
            secondStackView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 30),
            secondStackView.leadingAnchor.constraint(equalTo: topStackView.leadingAnchor),
            secondStackView.trailingAnchor.constraint(equalTo: topStackView.trailingAnchor)
        ])
        
        
    }

    
}




#if DEBUG

import SwiftUI


struct ViewControllerPresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewCOntroller: UIViewControllerType, context: Context) {
        
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        MyViewController()
    }
    
}

struct ViewControllerPresentablePreviews: PreviewProvider {
    static var previews: some View {
        ViewControllerPresentable()
            .ignoresSafeArea()
    }
}



#endif
