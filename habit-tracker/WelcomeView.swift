//
//  ContentView.swift
//  habit-tracker
//
//  Created by Liv Motley on 04/06/2025.
//

import SwiftUI

struct WelcomeView: View {

    var body: some View {
        ZStack {
            // MARK: Background
            ZStack {
                Circle()
                    .foregroundStyle(.pink)
                    .frame(width: 300)
                    .offset(x: 165, y: 80)
                
                Circle()
                    .foregroundStyle(.yellow)
                    .frame(width: 200)
                    .offset(x: -30, y: 400)
                
                Circle()
                    .foregroundStyle(.green)
                    .frame(width: 500)
                    .offset(x: -90, y: -80)
            }
            
            
            // MARK: Content
            VStack (alignment: .leading, spacing: 15) {
                Text("in my")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("HABIT ERA")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Button(
                    action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/,
                    label: {
                        Text("Get Started")
                            .foregroundStyle(.black)
                            .padding()
                            .background(.white)
                            .fontWeight(.semibold)
                            .cornerRadius(10)
                            
                })
            }
            .padding()
        }
    }
}

#Preview {
    WelcomeView()
}
