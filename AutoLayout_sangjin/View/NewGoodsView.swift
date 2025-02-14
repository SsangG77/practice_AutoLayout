//
//  MyCardView.swift
//  AutoLayout_sangjin
//
//  Created by 차상진 on 2/11/25.
//

import Foundation
import UIKit
import Then
import SnapKit


struct NewGoodsModel {
    var title: String
    var subtitle: String
    var imageName: String
}



class NewGoodsView : CustomView {
    
    override init(frame: CGRect) { //UIView 의 생성자를 상속받음
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    
//    private var model: NewGoodsModel // 모델 저장
//    
//    // 모델을 매개변수로 받는 생성자 추가
//       init(model: NewGoodsModel, frame: CGRect = .zero) {
//           self.model = model
//           super.init(frame: frame)
//           setupLayout()
//       }
       
//       required init?(coder: NSCoder) {
//           fatalError("init(coder:) has not been implemented")
//       }
    
    //MARK: - 레이아웃 설정
    fileprivate func setupLayout() {
        
        self.translatesAutoresizingMaskIntoConstraints = false
       
        /// 상품 이미지
        let imageView = UIImageView(image: UIImage(systemName: "jacket.fill")).then {
            $0.tintColor = .brown
            $0.translatesAutoresizingMaskIntoConstraints = false
            
        }
        
        /// 싱픔 이미지 컨테이너
        let imageContainer = CustomView().then {
            $0.layer.cornerRadius = 25
            $0.backgroundColor = .lightGray
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        imageContainer.addSubview(imageView)
        self.addSubview(imageContainer)
        
        /// 이미지 컨테이너 constraint
        imageContainer.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.height.equalTo(170)
            
        }
        
        /// 이미지 constraint
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(imageContainer).inset(14)
        }
        
        
        /// 브랜드 라벨
        let brandLabel = UILabel().then {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.text = "KOLEAT"
            $0.textColor = .lightGray
        }
        
        /// 상품 이름 라벨
        let titleLabel = UILabel().then {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.text = "(남녀공용) 기모 오버핏 브로스 가을 겨울 체크 셔츠 [BLUE] "
            $0.numberOfLines = 2
            $0.font = UIFont(name:"HelveticaNeue-Bold", size: 15.0)
        }

        
        let priceLabel = UILabel().then {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.text = "37,000원"
            $0.font = UIFont(name:"HelveticaNeue-Bold", size: 18.0)
        }
        
        
        /// 브랜드 라벨 추가
        self.addSubview(brandLabel)
        
        /// 제목 라벨 추가
        self.addSubview(titleLabel)
        
        /// 가격 라벨
        self.addSubview(priceLabel)
        
        
        
        brandLabel.snp.makeConstraints { make in
            make.top.equalTo(imageContainer.snp.bottom).offset(20)
            make.leading.equalTo(imageContainer.snp.leading)
            make.trailing.equalTo(imageContainer.snp.trailing)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(brandLabel.snp.bottom).offset(8)
            make.leading.equalTo(imageContainer.snp.leading)
            make.trailing.equalTo(imageContainer.snp.trailing)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.leading.equalTo(imageContainer.snp.leading)
            make.trailing.equalTo(imageContainer.snp.trailing)
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.bottom.equalTo(self.snp.bottom)
        }
    }
}








#if DEBUG

import SwiftUI


struct MyCardViewPresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewCOntroller: UIViewControllerType, context: Context) {
        
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        MainVC()
    }
    
}

struct MyCardViewPresentablePreviews: PreviewProvider {
    static var previews: some View {
        MainVCPresentable()
            .ignoresSafeArea()
    }
}



#endif
