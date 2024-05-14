//
//  TravelReport.swift
//  ChainOfResponsibility
//

import Foundation

class TravelExpensesReport: ReportGenerator {
    var next: ReportGenerator?
    
    func fillDetails(in report: inout ExpenseReport) {
        let detail = ExpenseGroupDetail(name: ExpenseCategory.travel.name, items: randomItems)
        report.expenses.append(detail)
        // pass to next
        next?.fillDetails(in: &report)
    }
}
