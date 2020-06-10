//
//  CardView.swift
//  ExponseReportUIApp
//
//  Created by yongzhan on 2020/6/10.
//  Copyright © 2020 yongzhan. All rights reserved.
//

import SwiftUI

struct CardView: View {
    var category = ExponseCategory()
    @State var percent: CGFloat = 0
    var body: some View {
        VStack {
            HStack{
                self.renderRingView()
                VStack(alignment: .leading){
                    Text(category.name)
                    Text("¥\(String(format: "%.2f", category.amount))")
                        .font(.title)
                }
                .foregroundColor(Color.white)
                Spacer()
            }
            .padding(.horizontal)
        }
        .frame(width: 300, height:160)
        .background(LinearGradient(gradient: Gradient(colors: category.colors), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(20)
        .onAppear{
            self.percent = self.category.percent
        }
    }
    
    func renderRingView() -> some View {
        RingView(percent: $percent, size: CGSize(width: 50, height: 50), strokeWidth: 8, color: Color.white, pathColor: Color.white.opacity(0.4))
            .modifier(PercentAnimation(value: percent * 100, suffix: "%", color: .white, font: .body))
            .animation(.easeInOut(duration: 1))
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(category: ExpenseBreakdown().categories.first!)
    }
}
