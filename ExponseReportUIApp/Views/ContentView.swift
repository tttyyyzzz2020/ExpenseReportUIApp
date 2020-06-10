//
//  ContentView.swift
//  ExponseReportUIApp
//
//  Created by yongzhan on 2020/6/10.
//  Copyright © 2020 yongzhan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var expenseBreakdown = ExpenseBreakdown()
    var body: some View {
        VStack{
            self.renderHeader()
            ScrollView(.vertical, showsIndicators: false) {
                self.renderCards()
                self.renderBarChart()
                ExpenseBreakdwonView(expenseBreakdown: expenseBreakdown)
                .padding()
            }
        }
    }
    
    func renderBarChart() -> some View {
        BarChartView { (expense) in
            self.expenseBreakdown.generateExponseCategories(exponse: expense)
        }
        .padding(.horizontal)
        .padding(.bottom)
    }
    
    func renderCards() -> some View {
        ScrollView(.horizontal, showsIndicators: false ){
            HStack(spacing: 16) {
                ForEach(expenseBreakdown.categories) { category in
                    CardView(category: category)
                }
            }
            .padding(.horizontal)
        }
    }
    
    func renderHeader() -> some View {
        HStack {
            VStack(alignment: .leading){
                Text("\(Date.monthName(short: expenseBreakdown.exponse.month))")
                    .font(.largeTitle)
                Text("2020")
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
