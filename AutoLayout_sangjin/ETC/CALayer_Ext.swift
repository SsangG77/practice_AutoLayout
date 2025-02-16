//
//  CALayer_Ext.swift
//  AutoLayout_sangjin
//
//  Created by 차상진 on 2/10/25.
//

import Foundation
import UIKit

extension CALayer {
    
    
    /// 그림자 적용 함수
    /// - Parameters:
    ///   - color: 그림자 색상
    ///   - alpha: 그림자 투명도
    ///   - x: x축
    ///   - y: y축
    ///   - blur: blur 정도
    ///   - spread: 퍼지는 정도
    func applyShadow(
        color: UIColor = .black,
        alpha: Float = 0.5,
        x : CGFloat = 0,
        y : CGFloat = 20,
        blur: CGFloat = 35,
        spread : CGFloat = 0) {
            masksToBounds  = false
            shadowColor = color.cgColor
            shadowOpacity = alpha
            shadowOffset = CGSize(width: x, height: y)
            shadowRadius = blur / 2.0
            if spread == 0 {
                shadowPath = nil
            } else {
                let dx = -spread
                let rect = bounds.insetBy(dx: dx, dy: dx)
                shadowPath = UIBezierPath(rect: rect).cgPath
            }
        }
    
}
