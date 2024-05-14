//
//  EmployeeList.swift
//  ChainOfResponsibility
//
//

import SwiftUI
import Fakery

struct EmployeeList: View {
    var state = EmployeeState()
    
    @State var selection: Employee?
    
    var body: some View {
        List(state.employees, id: \.self, selection: $selection)  { emp in
            HStack {
                Text(emp.name)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundStyle(.blue)
            }
            
        }
        .navigationTitle("Employees")
        .navigationDestination(item: $selection) { emp in
            ExpenseReportView(emp: emp)
        }
    }
}
