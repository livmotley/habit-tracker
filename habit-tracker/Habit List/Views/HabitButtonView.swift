//
//  HabitButtonView.swift
//  habit-tracker
//
//  Created by Liv Motley on 05/06/2025.
//

import SwiftUI

struct HabitButtonView: View {
    
    @ObservedObject var viewModel: HabitButtonViewModel
    @Binding var isEditMode: Bool
    
    init(habit: Habit, isEditMode: Binding<Bool>) {
        viewModel = HabitButtonViewModel(habit: habit)
        self._isEditMode = isEditMode
    }
    var body: some View {
        Button(
            action: {
                viewModel.buttonClicked()
            },
            label: {
                HStack (alignment: .center, spacing: 15){
                    Text(viewModel.habit.emoji)
                        .font(Font.system(size: 55))
                        .padding(.leading)
                    
                    VStack (alignment: .leading){
                        Text(viewModel.habit.title)
                            .foregroundStyle(.yellow)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                        
                        Text(viewModel.habit.description)
                            .foregroundStyle(.primary)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                        
                        
                        Text("\(viewModel.habit.streak) day streak")
                            .foregroundStyle(.primary)
                            .font(.subheadline)
                    }
                    
                    Spacer()
                    
                    if (viewModel.habit.isDone && !isEditMode) {
                        Image(systemName: "checkmark.circle.fill")
                            .font(Font.system(size: 50))
                            .foregroundStyle(.pink)
                            .padding(.trailing)
                    }
                    
                    if (isEditMode && !viewModel.isDeleted) {
                        Button(
                            action: {
                                viewModel.deleteHabit()
                            },
                            label: {
                                Image(systemName: "minus.circle.fill")
                                    .font(Font.system(size: 50))
                                    .foregroundStyle(.red)
                                    .padding(.trailing)
                        })
                        
                    }
                    
                    
                }
                .frame(width: 320)
                .padding()
                .background(.background)
                .cornerRadius(15)
                .shadow(color: Color(.systemGray), radius: 3)
                .opacity(viewModel.buttonOpacity)
            }
        )
    }
}

#Preview {
    HabitButtonView(habit: DeveloperPreview.habits[0],
                    isEditMode: .constant(true))
}
