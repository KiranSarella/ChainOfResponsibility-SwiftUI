//
//  ReportHandler.swift
//  ChainOfResponsibility
//
//

import Foundation

protocol ReportGenerator {
    func fillDetails(in report: inout ExpenseReport)
    // successor
    var next: ReportGenerator? { get set }
}

extension ReportGenerator {
    func fillDetails(in report: inout ExpenseReport) {
        // forwards the request to the successor by default. Subclasses can override this operation to provide fill details under the right circumstances; otherwise they can use the default implementation to forward the request.
        
        next?.fillDetails(in: &report)
    }
}
