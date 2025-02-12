//
//  ViewController.swift
//  AutoLayout_sangjin
//
//  Created by 차상진 on 2/9/25.
//

import UIKit
import Then




class MyViewController: UIViewController {

  
    
    lazy var topStackView = UIStackView().then { topStackView in
        topStackView.spacing = 10
        topStackView.alignment = .center
        topStackView.axis = .horizontal
        topStackView.distribution = .fillEqually
        topStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let zebraView = ZebraView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        self.view.addSubview(zebraView)
       
        
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
