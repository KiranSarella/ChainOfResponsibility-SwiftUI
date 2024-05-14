//
//  FoodReport.swift
//  ChainOfResponsibility
//
//

import Foundation

class FoodExpesnsesReport: ReportGenerator {
    var next: ReportGenerator?
    
    func fillDetails(in report: inout ExpenseReport) {
        let detail = ExpenseGroupDetail(name: ExpenseCategory.food.name, items: randomItems)
        report.expenses.append(detail)
        // pass to next
        next?.fillDetails(in: &report)
    }
}

