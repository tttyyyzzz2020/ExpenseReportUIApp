//
//  ExpenseBreakdwonView.swift
//  ExponseReportUIApp
//
//  Created by yongzhan on 2020/6/10.
//  Copyright © 2020 yongzhan. All rights reserved.
//

import SwiftUI

struct ExpenseBreakdwonView: View {
    @ObservedObject var expenseBreakdown = ExpenseBreakdown()
    var body: some View {
        VStack{
            HStack{
                Text("本月消费总计")
                    .bold()
                Spacer()
                Text("¥ \(String(format: "%.2f", expenseBreakdown.exponse.consumed))")
                .bold()
            }
            
            ForEach(expenseBreakdown.categories) { category in
                ExpenseCategoryView(category: category)
            }
        }
    }
}

struct ExpenseBreakdwonView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseBreakdwonView()
    }
}
