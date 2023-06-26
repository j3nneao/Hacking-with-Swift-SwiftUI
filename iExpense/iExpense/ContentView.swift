//
//  ContentView.swift
//  iExpense
//
//  Created by Jenn Park on 2023-06-23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                ExpenseSection(title: "Personal", expenses: expenses.personalItems, deleteItems: {offsets in removeItems(at: offsets, in: expenses.personalItems)})
                
                ExpenseSection(title: "Business", expenses: expenses.businessItems, deleteItems: {offsets in removeItems(at: offsets, in: expenses.businessItems)})
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet, in inputArray: [ExpenseItem]) {
        var itemsToDelete = IndexSet()
        
        for offset in offsets {
            let item = inputArray[offset]
            
            if let index = expenses.items.firstIndex(of: item) {
                itemsToDelete.insert(index)
            }
        }
        
        expenses.items.remove(atOffsets: itemsToDelete)
    }
}

extension FormatStyle where Self== FloatingPointFormatStyle<Double>.Currency {
    static var localCurrency: Self {
        .currency(code: Locale.current.currency?.identifier ?? "USD")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
