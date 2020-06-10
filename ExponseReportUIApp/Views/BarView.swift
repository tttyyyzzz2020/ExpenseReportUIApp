//
//  BarView.swift
//  ExponseReportUIApp
//
//  Created by yongzhan on 2020/6/10.
//  Copyright © 2020 yongzhan. All rights reserved.
//

import SwiftUI

struct BarView: View {
    var expense = Exponse()
    var size = CGSize(width: 3, height: 150)
    var isSelected: Bool = false
    var onSelect:((Exponse)->()) = {_ in }
    var body: some View {
        VStack{
            ZStack(alignment: .bottom){
                Capsule()
                    .frame(width: 3, height: size.height)
                    .foregroundColor( Color.lightGray)
                
                Capsule()
                    .frame(width: 3, height: size.height * expense.percentConsumend )
                    .foregroundColor(isSelected ? Color.red : Color.black)
            }
            Text(expense.month)
                .foregroundColor(isSelected ? Color.red : Color.black)
                .font(.system(size:10))
        }
        .frame(maxWidth: .infinity)
        .onTapGesture {
            self.onSelect(self.expense)
        }
        
    }
}

struct BarView_Previews: PreviewProvider {
    static var previews: some View {
        BarView(expense: ExpenseBreakdown().exponse, size: CGSize(width: 3, height: 200))
    }
}
