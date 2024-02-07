//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Mehdi on 2024-01-30.
//

import SwiftUI

struct ContentView: View {
    @State private var userChoice: Int?
    @State private var computerChoice: Int = Int.random(in: 1...3)
    @State private var result: String = ""
    @State private var userScore: Int = 0
    @State private var computerScore: Int = 0

    var body: some View {
        VStack {
            
            VStack{
                Spacer()
                Spacer()
                Image("background")
                    .resizable()
                    .frame(width: 100, height: 100)
                
                HStack {
                    
                    Spacer()
                    
                    VStack{
                        
                        Text("Player")
                            .font(.title)
                            .fontWeight(.heavy)
                        
                        Button(action: {
                            chooseOption(1) // Rock
                        }, label: {
                            Image("rock")
                        })
                        
                        Button(action: {
                            chooseOption(2) // Paper
                        }, label: {
                            Image("paper")
                        })
                        
                        Button(action: {
                            chooseOption(3) // Scissors
                        }, label: {
                            Image("scissors")
                        })
                    }
                    
                    Spacer()
                    
                    VStack{
                        
                        Text ("CPU")
                            .font(.title)
                            .fontWeight(.heavy)
                        
                        Image("rock")
                        Image("paper")
                        Image("scissors")
                    }
                    
                    Spacer()
                }
                
                Spacer()
            }
            .frame(maxHeight: 500)
            
            VStack{
                
                if userChoice == nil{
                    
                    Text("Your choice: ")
                        .padding()
                    
                    Text("CPU: ")
                        .padding()
                    
                    Text("Result: ")
                        .padding()
                    
                    Text("Score: ")
                        .padding()
                    
                    Text("Overall Winner: ")
                        .padding()
                }
                
                if let userChoice = userChoice {
                    
                    VStack{
                        
                        HStack {
                            Text("Your choice:")
                            Image(mapChoiceToString(userChoice))
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                        
                        HStack{
                            Text("CPU:")
                            Image(mapChoiceToString(computerChoice))
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                        
                        
                        Text("Result: \(result)")
                            .padding()
                        
                        Text("Score: \(userScore) - \(computerScore)")
                            .padding()
                        
                        if userScore == 3 || computerScore == 3 {
                            Text("Overall Winner: \(userScore == 3 ? "You" : "Computer")")
                                .padding()
                        }
                    }
                }
            }
            .frame(minHeight: 300)
            
        }
        .background(Color.orange)
    }

    func chooseOption(_ choice: Int) {
        userChoice = choice
        assignRandomChoice()

        if let userChoice = userChoice {
            switch (userChoice, computerChoice) {
            case (1, 3), (2, 1), (3, 2):
                result = "You win!"
                userScore += 1
            case (1, 2), (2, 3), (3, 1):
                result = "Computer wins!"
                computerScore += 1
            case (1, 1), (2, 2), (3, 3):
                result = "It's a tie!"
            default:
                break
            }
        }
    }

    func assignRandomChoice() {
        computerChoice = Int.random(in: 1...3)
    }

    func mapChoiceToString(_ choice: Int) -> String {
        switch choice {
        case 1:
            return "Rock"
        case 2:
            return "Paper"
        case 3:
            return "Scissors"
        default:
            return ""
        }
    }
}

#Preview {
    ContentView()
}
