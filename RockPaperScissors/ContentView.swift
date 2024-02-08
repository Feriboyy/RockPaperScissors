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
                        ForEach(1..<4) { index in
                                    Image(mapChoiceToImageName(index))
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                }
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
                        
                        Spacer()
                        
                        HStack {
                            Text("Your choice: ")
                            Image(mapChoiceToImageName(userChoice))
                                .resizable()
                                .frame(width: 40, height: 40)
                        }
                        Spacer()
                        
                        HStack{
                            Text("CPU: ")
                            Image(mapChoiceToImageName(computerChoice))
                                .resizable()
                                .frame(width: 40, height: 40)
                        }
                        Spacer()
                        HStack{
                            Text("Result: \(result)")
                        }
                        Spacer()
                        HStack{
                            Text("Score: \(userScore) - \(computerScore)")
                        }
                        Spacer()
                        if userScore == 3 || computerScore == 3 {
                            Text("Overall Winner: \(userScore == 3 ? "You" : "Computer")")
                            Spacer()
                        } else { Text("Overall Winner: ")
                            Spacer()                        }
                        
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
    
    func mapChoiceToImageName(_ choice: Int) -> String {
        switch choice {
        case 1:
            return "rock"
        case 2:
            return "paper"
        case 3:
            return "scissors"
        default:
            return "questionmark.square"
        }
    }
}

#Preview {
    ContentView()
}
