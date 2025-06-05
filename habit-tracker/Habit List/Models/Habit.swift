//
//  Habit.swift
//  habit-tracker
//
//  Created by Liv Motley on 05/06/2025.
//

import Foundation

struct Habit: Identifiable, Encodable, Decodable {
    let id: String
    var emoji: String
    var title: String
    var description: String
    var streak: Int
    var isDone: Bool = false
}
