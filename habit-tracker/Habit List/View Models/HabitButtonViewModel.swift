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
    }
    
    func buttonClicked() {
        habit.isDone.toggle()
        
        if (habit.isDone) {
            habit.streak += 1
        } else {
            habit.streak -= 1
        }
    }
    
    func deleteHabit() {
        if let index = DeveloperPreview.habits.firstIndex(where: {$0.id == habit.id}) {
            DeveloperPreview.habits.remove(at: index)
        }
        isDeleted = true
        buttonOpacity = 0.3
    }
}
