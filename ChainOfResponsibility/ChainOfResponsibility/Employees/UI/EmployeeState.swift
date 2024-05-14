//
//  EmployeeState.swift
//  ChainOfResponsibility
//
//

import Foundation

struct Employee: Identifiable, Hashable {
    let id = UUID()
    let name = faker.name.name()
}

@Observable
class EmployeeState {
    var employees = [Employee]()
    
    init() {
        getEmployees()
    }
    
    func getEmployees() {
        let result = [Employee(), Employee(), Employee(), Employee(), Employee(), Employee(), Employee()]
        self.employees = result
    }
    
}
