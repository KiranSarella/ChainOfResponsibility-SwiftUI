//
//  Preferences.swift
//  ChainOfResponsibility
//

import SwiftUI

struct PreferencesView: View {
    @Environment(\.editMode) var editMode
    @Environment(\.dismiss) var dismiss
    @Binding var state: PreferencesState
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($state.categories) { $item in
                    Toggle(item.category.name, isOn: $item.enabled)
                }
                .onMove { (source: IndexSet, destination: Int) in
                    state.categories.move(fromOffsets: source, toOffset: destination)
                }
            }
            .environment(\.editMode, .constant(.active))
            .navigationTitle("Report Preferences")
            .onAppear {
                state.updateCategories()
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        state.updatePreferences()
                        dismiss()
                    } label: {
                        Text("Update")
                    }
                }
            }
        }
    }
}
