//
//  ExpenseCategoryView.swift
//  ExponseReportUIApp
//
//  Created by yongzhan on 2020/6/10.
//  Copyright © 2020 yongzhan. All rights reserved.
//

import SwiftUI

struct ExpenseCategoryView: View {
    var category = ExponseCategory()
    @State var percent: CGFloat = 0
    var body: some View {
        
        GeometryReader { gr in
            ZStack(alignment: .leading) {
                self.renderHorizontalView(with: gr.size)
                self.renderDetailView()
            }
            .onAppear{
                self.percent = self.category.percent
            }
        }
        .frame(height: 60)
    }
    
    func renderHorizontalView(with size: CGSize)-> some View {
        Rectangle()
            .frame(width: size.width * percent, height: 60, alignment: .leading)
            .foregroundColor(Color.lightGray)
            .animation(.easeInOut(duration: 1))
    }
    
    func renderDetailView() -> some View {
        HStack {
            RingView(percent:$percent, size: CGSize(width: 40, height: 40), strokeWidth: 4, color: category.colors.first!, pathColor: Color.gray)
                .modifier(PercentAnimation(value: percent * 100, suffix: "%", color: .black, font: .system(size:12)))
                .animation(.easeInOut(duration: 1))
            Text(category.name)
            Spacer()
            Text("¥\(String(format: "%.2f", category.amount))")
        }
        .padding(.leading)
    }
}

struct ExpenseCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseCategoryView(category: ExpenseBreakdown().categories.first!)
    }
}
