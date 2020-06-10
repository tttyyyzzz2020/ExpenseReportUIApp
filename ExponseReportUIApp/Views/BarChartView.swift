//
//  BarChartView.swift
//  ExponseReportUIApp
//
//  Created by yongzhan on 2020/6/10.
//  Copyright © 2020 yongzhan. All rights reserved.
//

import SwiftUI

struct BarChartView: View {
    var expenses = Exponse.getRandom()
    @State var slectedExpense = Exponse()
    var onSelect:((Exponse)->()) = {_ in }
    var body: some View {
        GeometryReader { gr in
            HStack {
                self.renderBarView(size: gr.size)
            }
        }
        .frame(height: 100)
        .onAppear {
            self.slectedExpense = Exponse.getRandom().first(where: { $0.month == Date.month })!
        }
        
    }
    func renderBarView(size: CGSize) -> some View {
        ForEach(expenses, id: \.month) {  exponse in
            BarView(expense: exponse,
                    size: size,
                    isSelected: self.slectedExpense.month == exponse.month) { (expense) in
                        self.slectedExpense = expense
                        self.onSelect(expense)
            }
        }
    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView(expenses: Exponse.getRandom())
    }
}
