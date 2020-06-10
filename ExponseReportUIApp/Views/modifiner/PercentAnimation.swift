//
//  PercentAnimation.swift
//  ExponseReportUIApp
//
//  Created by yongzhan on 2020/6/10.
//  Copyright © 2020 yongzhan. All rights reserved.
//

import SwiftUI

struct PercentAnimation: AnimatableModifier {
    
    var value: CGFloat
    var suffix: String = "%"
    var color: Color = .black
    var font: Font = .body
    
    var animatableData: CGFloat {
        get {
            value
        }
        set {
            value = newValue
        }
    }
    
    func body(content: Content) -> some View {
        content.overlay(
            Text("\(Int(value))\(suffix)")
                .font(font)
                .foregroundColor(color)
            
        )
    }
}
