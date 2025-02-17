//
//  UIView+Ext.swift
//  AutoLayout_sangjin
//
//  Created by 차상진 on 2/17/25.
//

import Foundation
import UIKit



#if DEBUG

import SwiftUI

extension UIView {
    
    private struct ViewPresentable: UIViewRepresentable {
        
        let uiView: UIView
        
        func updateUIView(_ uiView: UIViewType, context: Context) {}
        
        func makeUIView(context: Context) -> some UIView {
            return uiView
        }
    }
    
    func getPreview() -> some View {
        ViewPresentable(uiView: self)
    }
}



#endif
