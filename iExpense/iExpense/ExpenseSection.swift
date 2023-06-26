//
//  ExpenseSection.swift
//  iExpense
//
//  Created by Jenn Park on 2023-06-26.
//

import SwiftUI

struct ExpenseSection: View {
    var title: String
    var expenses: [ExpenseItem]
    var deleteItems: (IndexSet) -> Void
    
    var body: some View {
        Section(title) {
            ForEach(expenses) { item in
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        Text(item.type)
                    }
                    
                    Spacer()
                    Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .style(for: item)
                }
            }
            .onDelete(perform: deleteItems)
            
        }
    }
}
