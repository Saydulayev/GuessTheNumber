//
//  ContentView.swift
//  GuessTheNumber
//
//  Created by Ahmad on 30.03.23.
//


import SwiftUI

struct ContentView: View {
    @State private var guess = ""
    let targetNumber = Int.random(in: 1...100)
    @State private var feedback = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Guess a number between 1 and 100")
                    .foregroundColor(.white)
                    .font(.title)
                TextField("Enter your guess", text: $guess)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 20)
                Button(action: {
                    let guessNumber = Int(guess) ?? 0
                    if guessNumber == targetNumber {
                        feedback = "Correct!"
                    } else if guessNumber < targetNumber {
                        feedback = "Too low!"
                    } else {
                        feedback = "Too high!"
                    }
                }) {
                    Text("Submit")
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.purple)
                        .clipShape(Capsule())
                        .padding(.horizontal, 20)
                }
                .padding()
                
                Text(feedback)
                    .foregroundColor(.white)
                    .font(.headline)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

