//
//  DateExt.swift
//  ExponseReportUIApp
//
//  Created by yongzhan on 2020/6/10.
//  Copyright © 2020 yongzhan. All rights reserved.
//

import Foundation


extension Date {
    static var month: String = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM"
        return formatter.string(from: Date())
    }()
    
    static func monthName( short: String) -> String {
        let dict = [
            "Jan": "一月",
            "Feb": "二月",
            "Mar": "三月",
            "Apr": "四月",
            "May": "五月",
            "Jun": "六月",
            "Jul": "七月",
            "Aug": "八月",
            "Sep": "九月",
            "Otc": "十月",
            "Nov": "十一月",
            "Dec": "十二月",
        ]
        
        return dict[short] ?? "一月"
    }
}
