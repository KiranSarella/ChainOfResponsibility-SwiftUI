//
//  ExpensesBusiness.swift
//  ChainOfResponsibility
//
//

import Foundation
import Fakery

let faker = Faker()

var itemsCount: Int {
    Int.random(in: 2..<5)
}

struct ExpenseItem: Identifiable {
    let id = UUID()
    let name: String = faker.lorem.words(amount: Int.random(in: 2..<4))
    let price: Double = faker.number.randomDouble(min: 250, max: 3000)
}

struct ExpenseGroupDetail: Identifiable {
    let id = UUID()
    let name: String
    let items: [ExpenseItem]
    var subtotal: Double {
        let res = items.reduce(0.0, { partialResult, expItem in
            partialResult + expItem.price
        })
        return res
    }
}



struct ExpenseReport {
    var expenses = [ExpenseGroupDetail]()
    var total: Double {
        let res = expenses.reduce(0.0, { partialResult, expGrp in
            partialResult + expGrp.subtotal
        })
        return res
    }
}

enum ExpenseCategory: String, CaseIterable {
    case travel
    case hotel
    case food
    case personal
    
    var name: String {
        "\(self.rawValue.capitalized) Expenses"
    }
}

struct CategoryItem: Identifiable {
    var id = UUID()
    var category: ExpenseCategory
    var enabled: Bool = true
}

class ExpensesBusiness {
    
    var categories = [CategoryItem]()
    
    init() {
        self.categories = ExpenseCategory.allCases.map({ c in
            CategoryItem(category: c)
        })
    }
    
    func getReportGenerator(for category: ExpenseCategory) -> ReportGenerator {
        switch category {
        case .travel:
            let r = TravelExpensesReport()
            let r2 = InternationalTransportExpensesReport()
            let r3 = LocalTransportExpensesReport()
            r2.next = r3
            r.next = r2
            return r
        case .hotel:
            return HotelExpensesReport()
        case .food:
            return FoodExpesnsesReport()
        case .personal:
            let r = PersonalExpensesReport()
            let withoutBills = WithoutBilssExpensesReport()
            withoutBills.next = OtherExpensesReport()
            
            r.next = withoutBills
            return r
        }
    }
    
    func generateExpenseReport(_ emp: Employee) -> ExpenseReport {
        
        var exportReport = ExpenseReport()
        for categoryItem in categories {
            if categoryItem.enabled {
                let generator = getReportGenerator(for: categoryItem.category)
                generator.fillDetails(in: &exportReport)
            }
        }
        return exportReport
    }
    
}

extension ExpensesBusiness {
    
    func updateCategoryPreferences(_ input: [CategoryItem]) {
        categories = input
    }
}

var randomItems: [ExpenseItem] {
    var items = [ExpenseItem]()
    for _ in 0..<itemsCount {
        items.append(ExpenseItem())
    }
    return items
}
