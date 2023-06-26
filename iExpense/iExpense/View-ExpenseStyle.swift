//
//  View-ExpenseStyle.swift
//  iExpense
//
//  Created by Jenn Park on 2023-06-26.
//

import Foundation
import SwiftUI

extension View {
    func style(for item: ExpenseItem) -> some View {
        if item.amount < 10 {
            return self.font(.body)
        } else if item.amount < 100 {
            return self.font(.title3)
        } else {
            return self.font(.title)
        }
    }
}
