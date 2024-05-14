//
//  ExpenseReportView.swift
//  ChainOfResponsibility
//
//

import SwiftUI

struct ExpenseReportView: View {
    let emp: Employee
    @State var presentPreferences = false
    @State var state = ExpenseReportState()
    
    var body: some View {
        List {
            ForEach(state.expenseReport.expenses) { category in
                Section(category.name) {
                    ForEach(category.items) { item in
                        HStack {
                            Text(item.name)
                                .lineLimit(1)
                            Spacer()
                            Text(item.price.rupeeString)
                                .fontDesign(.monospaced)
                        }
                    }
                    HStack {
                        Text("subtotal")
                        Spacer()
                        Text(category.subtotal.rupeeString)
                            .fontDesign(.monospaced)
                    }
                    .fontWeight(.bold)
                }
            }
            
            HStack {
                Text("Total")
                Spacer()
                Text(state.expenseReport.total.rupeeString)
                    .fontDesign(.monospaced)
            }
            .fontWeight(.black)
        }
        .onAppear(perform: {
            state.generateExpenseReport(emp)
        })
        .environment(\.editMode, .constant(.active))
        .navigationTitle("Expense Report")
        .toolbar {
            ToolbarItem {
                Button("Preferences") {
                    presentPreferences = true
                }
            }
        }
        .sheet(isPresented: $presentPreferences, onDismiss: {
            state.generateExpenseReport(emp)
        }, content: {
            PreferencesView(state: .constant(PreferencesState(business: state.business)))
        })
    }
}



extension Double {
    var rupeeString:String {
        return String(format: "₹%.2f", self)
    }
}
