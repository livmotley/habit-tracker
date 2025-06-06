//
//  HabitService.swift
//  habit-tracker
//
//  Created by Liv Motley on 05/06/2025.
//

import Foundation
import SwiftUI

class HabitService {
    @AppStorage("HABITS_KEY") var savedHabits: Data = Data()
    private var habits: [Habit] = []
    
    static let shared = HabitService()
    
    init () {
        habits = retrieveHabits()
    }
    
}

// MARK: Data Storage
extension HabitService {
    func saveHabits() {
        guard let habitsJSON = try? JSONEncoder().encode(habits) else { return }
        
        self.savedHabits = habitsJSON
    }
    
    func retrieveHabits() -> [Habit] {
        guard let decodedHabits = try? JSONDecoder().decode([Habit].self, from: savedHabits) else { return [] }
        return decodedHabits
    }
}

// MARK: Data Queries
extension HabitService {
    func addHabits(_ habit: Habit) {
        habits.append(habit)
        saveHabits()
    }
    
    func deleteHabits(_ habit: Habit) {
        habits.removeAll(where: {$0.id == habit.id})
        saveHabits()
    }
    
    func increaseStreak(forHabit habit: Habit) {
        guard let index = habits.firstIndex(where: {$0.id == habit.id}) else { return }
        
        habits[index] = habit
        saveHabits()
    }
    
    func resetStreak(forHabit habit: Habit) {
        guard let index = habits.firstIndex(where: {$0.id == habit.id}) else { return }
        
        habits[index] = habit
        saveHabits()
    }
}
