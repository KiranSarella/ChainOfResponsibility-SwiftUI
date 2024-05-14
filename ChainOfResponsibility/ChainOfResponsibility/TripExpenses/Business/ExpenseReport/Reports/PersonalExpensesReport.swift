//
//  PersonalReport.swift
//  ChainOfResponsibility
//
//

import Foundation

class PersonalExpensesReport: ReportGenerator {
    var next: ReportGenerator?
    
    func fillDetails(in report: inout ExpenseReport) {
        let detail = ExpenseGroupDetail(name: ExpenseCategory.personal.name, items: randomItems)
        report.expenses.append(detail)
        // pass to next
        next?.fillDetails(in: &report)
    }
}
