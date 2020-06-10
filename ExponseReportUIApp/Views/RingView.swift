//
//  RingView.swift
//  ExponseReportUIApp
//
//  Created by yongzhan on 2020/6/10.
//  Copyright © 2020 yongzhan. All rights reserved.
//

import SwiftUI

struct RingView: View {
    @Binding var percent: CGFloat
    var size: CGSize = CGSize(width: 50, height: 50)
    var strokeWidth: CGFloat = 10
    var color: Color = .white
    var pathColor: Color = Color.white.opacity(0.4)
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(pathColor, style: StrokeStyle(lineWidth: strokeWidth))
            
            Circle()
                .trim(from: 0, to: percent)
                .stroke(color, style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round))
                .rotationEffect(.degrees(-90))
        }
        .frame(width: size.width, height: size.height)
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(percent: .constant(0.5), size: CGSize(width:100, height: 100), strokeWidth: 8, color: Color.red, pathColor: Color.lightGray)
    }
}
