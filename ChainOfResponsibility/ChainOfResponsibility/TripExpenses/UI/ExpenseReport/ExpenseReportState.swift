//
//  ExpenseReportState.swift
//  ChainOfResponsibility
//

import Foundation

@Observable
class ExpenseReportState {
    
    var business = ExpensesBusiness()
    var expenseReport = ExpenseReport(expenses: [])
    
    func generateExpenseReport(_ emp: Employee) {
        expenseReport = business.generateExpenseReport(emp)
    }
    
    
}
