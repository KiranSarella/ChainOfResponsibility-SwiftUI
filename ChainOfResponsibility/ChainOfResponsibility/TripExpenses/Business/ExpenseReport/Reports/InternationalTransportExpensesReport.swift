//
//  InternationalTransportExpensesReport.swift
//  ChainOfResponsibility
//

import Foundation

class InternationalTransportExpensesReport: ReportGenerator {
    var next: ReportGenerator?
    
    func fillDetails(in report: inout ExpenseReport) {
        let detail = ExpenseGroupDetail(name: "International Transport", items: randomItems)
        report.expenses.append(detail)
        // pass to next
        next?.fillDetails(in: &report)
    }
}
