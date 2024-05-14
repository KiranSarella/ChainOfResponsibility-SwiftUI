//
//  PreferencesState.swift
//  ChainOfResponsibility
//
//

import Foundation

@Observable
class PreferencesState {
    
    let business:ExpensesBusiness
    
    var categories = [CategoryItem]()
    
    init(business: ExpensesBusiness) {
        self.business = business
    }
    
    func updateCategories() {
        categories = business.categories
    }
    
    func updatePreferences() {
        business.updateCategoryPreferences(categories)
    }
    
}
