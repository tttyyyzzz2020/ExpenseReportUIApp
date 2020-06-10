//
//  ExponseBreakdown.swift
//  ExponseReportUIApp
//
//  Created by yongzhan on 2020/6/10.
//  Copyright © 2020 yongzhan. All rights reserved.
//

import SwiftUI


class ExpenseBreakdown: ObservableObject {
    @Published var categories = [ExponseCategory]()   // 某个月的消费类别占比
    var exponse = Exponse()
    
    init() {
        self.generateExponseCategories(exponse: Exponse.getRandom().first(where: { $0.month == Date.month })!)
    }
    
    
    //生成消费明细
    func generateExponseCategories( exponse: Exponse) {
        let percent1 = CGFloat.random(in: 0...1)
        let percent2 = CGFloat.random(in: 0...(1 - percent1))
        let percent3 = CGFloat.random(in: 0...(1 - percent1 - percent2))
        let percent4 = CGFloat.random(in: 0...(1 - percent1 - percent2 - percent3))
        let percent5 = 1 - percent1 - percent2 - percent3 - percent4
        
        
        let categories = [
            ExponseCategory(name: "日常消费", percent: percent1, amount: exponse.consumed * percent1, colors: [Color.darkRed, Color.lightRed]),
            ExponseCategory(name: "教育", percent: percent2, amount: exponse.consumed * percent2, colors: [Color.darkPink, Color.lightPink]),
            ExponseCategory(name: "娱乐", percent: percent3, amount: exponse.consumed * percent3, colors: [Color.darkGreen, Color.lightGreen]),
            ExponseCategory(name: "健康", percent: percent4, amount: exponse.consumed * percent4, colors: [Color.darkPurple, Color.lightPurple]),
            ExponseCategory(name: "公益", percent: percent5, amount: exponse.consumed * percent5, colors: [Color.darkYellow, Color.lightYellow])
        
        ]
        self.categories = categories
        self.exponse = exponse
    }
}
