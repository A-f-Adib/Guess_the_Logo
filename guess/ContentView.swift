//
//  ContentView.swift
//  guess
//
//  Created by A.f. Adib on 9/24/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showScore : Bool = false
    @State private var scoreTitle = ""
    @State private var ansCount : Int = 0
    
    @State private var cars = ["bmw", "acura", "alfaRomeo", "cadillac", "chevrolet", "ferrari", "jaguar", "lamborghini", "maserati", "nissan", "porsche", "toyota", "volksWagon","volvo", "audi", "bentlay", "buick", "ford", "honda", "infinity", "lexus", "marcedes", "Suzuki", "tesla"].shuffled()
    
   @State private var carName = Int.random(in: 0..<3)
    
    var body: some View {
        ZStack {
//            Color(red: 0.8, green: 0.6, blue: 0.6)
            LinearGradient(gradient: Gradient(colors: [.purple, .indigo]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack{
                VStack{
                    Text("Tap the Logo")
                        .frame(width:300, height: 50)
                        .background(.white)
                        .cornerRadius(10)
                        
                        .foregroundColor(.primary)
                        .padding(1)
                        .font(.largeTitle.weight(.semibold))
                    Text(cars[carName].uppercased())
                        
                        .font(.title.weight(.heavy))
                        .padding()
                   
                }
               
                
                VStack {
                    ForEach(0..<3) { number in
                        Button{
                            logoTap(number)
                          
                           
                        } label: {
                            Image(cars[number])
                                .resizable()
                                .frame(width: 150, height: 150)
                                .shadow(radius: 20)
    //                            .clipShape(Capsule())
                        }
                        
                    }
                }
                .frame(maxWidth : .infinity)
                .padding(.vertical, 20)
//                .background(.regularMaterial)
//                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Text("Your Ans : \(scoreTitle)")
//                    .foregroundColor(.white)
                    .padding(.top,30)
                    .font(.headline)
            }
        }
        .alert(scoreTitle, isPresented: $showScore) {
            Button("Continue", action: askQues)
            
        }
//       message: {
//            Text("your score is...\(ansCount)")
//        }
    }
    
    func logoTap(_ number : Int){
        if number == carName {
            ansCount += 1
            scoreTitle = "Correct. your score : \(ansCount)"
           
            
        }
        else{
            scoreTitle = "Wrong. Game Over. Your score : \(ansCount)"
            ansCount = 0
        }
        showScore = true
    }
    
    func askQues() {
        carName = Int.random(in: 0..<3)
        cars.shuffle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
