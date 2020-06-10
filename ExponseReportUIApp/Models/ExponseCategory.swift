//
//  ExponseCategory.swift
//  ExponseReportUIApp
//
//  Created by yongzhan on 2020/6/10.
//  Copyright © 2020 yongzhan. All rights reserved.
//

import SwiftUI

struct ExponseCategory:Identifiable {
    var id = UUID()
    var name: String = ""
    var percent: CGFloat = 0
    var amount: CGFloat = 0
    var colors: [Color] = []
}
