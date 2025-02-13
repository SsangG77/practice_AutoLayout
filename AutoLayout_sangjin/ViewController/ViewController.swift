//
//  ViewController.swift
//  AutoLayout_sangjin
//
//  Created by 차상진 on 2/9/25.
//

import UIKit
import Then




class MyViewController: UIViewController {

  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
