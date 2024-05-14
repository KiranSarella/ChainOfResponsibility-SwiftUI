//
//  HotelReport.swift
//  ChainOfResponsibility
//
//

import Foundation

class HotelExpensesReport: ReportGenerator {
    var next: ReportGenerator?
    
    func fillDetails(in report: inout ExpenseReport) {
        let detail = ExpenseGroupDetail(name: ExpenseCategory.hotel.name, items: randomItems)
        report.expenses.append(detail)
        // pass to next
        next?.fillDetails(in: &report)
    }
}
