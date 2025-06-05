//
//  HabitButtonViewModel.swift
//  habit-tracker
//
//  Created by Liv Motley on 05/06/2025.
//

import Foundation

class HabitButtonViewModel: ObservableObject {
    @Published var habit: Habit
    @Published var isDeleted: Bool = false
    @Published var buttonOpacity: Double = 1.0
    
    
    init(habit: Habit) {
        self.habit = habit
        validateStreak()
    }
    
    func buttonClicked() {
        
    }
    
    
}

extension HabitButtonViewModel {
    func deleteHabit() {
        HabitService.shared.deleteHabits(habit)
        isDeleted = true
        buttonOpacity = 0.3
    }
}

extension HabitButtonViewModel {
    func buttonHabitClicked() {
        if(isLastDateSameAsToday()) {
            increaseStreak()
        }
    }
    
    func increaseStreak() {
        habit.lastDateDone = Date()
        habit.streak += 1
        HabitService.shared.increaseStreak(forHabit: habit)
    }
    
    func validateStreak() {
        guard let lastDateDone = habit.lastDateDone else { return }
        
        let calendar = Calendar(identifier: .iso8601)
        
        if(calendar.numberOfDaysBetween(lastDateDone, and: Date()) > 2) {
            habit.streak = 0
            HabitService.shared.resetStreak(forHabit: habit)
        }
    }
    
    func isLastDateSameAsToday()  -> Bool {
        if(habit.lastDateDone != nil) {
            let formatter = DateFormatter()
            formatter.timeStyle = .none
            formatter.dateStyle = .short
            
            let today = formatter.string(from: Date())
            let lastDateDone = formatter.string(from: habit.lastDateDone!)
            
            return today == lastDateDone
        }
        
        return false
    }
}

