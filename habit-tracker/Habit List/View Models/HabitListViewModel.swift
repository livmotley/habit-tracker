//
//  HabitListViewModel.swift
//  habit-tracker
//
//  Created by Liv Motley on 05/06/2025.
//

import Foundation

class HabitListViewModel: ObservableObject {
    @Published var habits = [Habit]()
    @Published var dateString: String = ""
    
    init() {
        refreshHabits()
        dateString = updateDateString()
    }
    
    func updateDateString() -> String {
        let currentDate = Date()
        
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .long
        
        return formatter.string(from: currentDate)
    }
    
    func onAddHabitDismissed() {
        refreshHabits()
    }
    
    func refreshHabits() {
        habits = DeveloperPreview.habits
    }
}
