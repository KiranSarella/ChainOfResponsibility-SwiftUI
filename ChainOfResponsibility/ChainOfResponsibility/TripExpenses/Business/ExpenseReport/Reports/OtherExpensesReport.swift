//
//  OtherExpenses.swift
//  ChainOfResponsibility
//
//

import Foundation

class OtherExpensesReport: ReportGenerator {
    var next: ReportGenerator?
    
    func fillDetails(in report: inout ExpenseReport) {
        let detail = ExpenseGroupDetail(name: "Others", items: randomItems)
        report.expenses.append(detail)
        // pass to next
        next?.fillDetails(in: &report)
    }
}
