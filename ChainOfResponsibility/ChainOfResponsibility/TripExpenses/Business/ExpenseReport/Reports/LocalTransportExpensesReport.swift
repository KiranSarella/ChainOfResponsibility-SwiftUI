//
//  LocalTransportExpensesReport.swift
//  ChainOfResponsibility
//
//

import Foundation

class LocalTransportExpensesReport: ReportGenerator {
    var next: ReportGenerator?
    
    func fillDetails(in report: inout ExpenseReport) {
        let detail = ExpenseGroupDetail(name: "Local Transport", items: randomItems)
        report.expenses.append(detail)
        // pass to next
        next?.fillDetails(in: &report)
    }
}
