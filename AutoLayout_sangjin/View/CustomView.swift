//
//  CustomView.swift
//  AutoLayout_sangjin
//
//  Created by 차상진 on 2/10/25.
//

import Foundation
import UIKit

@IBDesignable
class CustomView: UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    var hasShadow : Bool = false {
        didSet {
            if hasShadow {
                layer.applyShadow()
            }
        }
    }
    
    
}
