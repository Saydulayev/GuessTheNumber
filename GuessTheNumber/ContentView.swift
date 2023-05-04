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
    @State private var showAlert = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Guess a number between 1-100")
                    .foregroundColor(.white)
                    .font(.title)
                    .padding(10)
                TextField("Enter your guess", text: $guess)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad) // only allow numbers
                    .padding(.horizontal, 20)
                Button(action: {
                    if let guessNumber = Int(guess), 1...100 ~= guessNumber {
                        if guessNumber == targetNumber {
                            feedback = "Correct!"
                        } else if guessNumber < targetNumber {
                            feedback = "Too low!"
                        } else {
                            feedback = "Too high!"
                        }
                    } else {
                        showAlert = true // show alert if input is invalid
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
                    .font(.title.bold())
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Invalid input"), message: Text("Please enter a number between 1 and 100"), dismissButton: .default(Text("OK")))
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

