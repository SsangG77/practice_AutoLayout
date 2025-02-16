//
//  DummyData.swift
//  AutoLayout_sangjin
//
//  Created by 차상진 on 2/16/25.
//

import Foundation
import Fakery


struct DummySection {
    let uuid: UUID
    let title: String
    let body: String
    
    let rows:[DummyData]
    
    init() {
        uuid = UUID()
        self.title = "section title \(uuid)"
        self.body = "section body \(uuid)"
        self.rows = DummyData.getDummies(Int.random(in: 1...5))
    }
    
    
    static func getDummies(_ count: Int = 10) -> [DummySection] {
        return Array(1...count).map { _ in DummySection() }
    }
    
}

struct DummyData {
    let uuid: UUID
    let title: String
    let body: String
    
    init() {
        uuid = UUID()
        
        let fakery = Faker(locale: "ko")
        
        
        
        self.title = "타이틀 : \(fakery.name.firstName()) \(fakery.name.lastName())"
        self.body = "바디 :  \(fakery.lorem.paragraphs())"
    }
    
    
    static func getDummies(_ count: Int = 100) -> [DummyData] {
        return Array(1...count).map { _ in DummyData() }
    }
    
    
}
