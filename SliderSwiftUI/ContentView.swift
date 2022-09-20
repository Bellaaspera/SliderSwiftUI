//
//  ContentView.swift
//  SliderSwiftUI
//
//  Created by Светлана Сенаторова on 20.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue = 0.0
    @State private var alertIsPresented = false
    @State private var alpha = 0.1
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер как можно ближе к: \(targetValue)")
                .font(.footnote)
            HStack {
                Text("0")
                UIKitSlider(targetValue: $targetValue, currentValue: $currentValue, alpha: $alpha)
                Text("100")
            }
            .padding()
            
            Button(action: {checkNumber()}) {
                Text("Проверь меня!")
            }
            .alert("Результат: \(lround(Double(alpha) * 100))", isPresented: $alertIsPresented, actions: {})
            .padding()
            
            Button(action: { startOver() }) {
                Text("Начать заново")
            }
            
        }
        
    }
    private func checkNumber() {
        alertIsPresented.toggle()
    }
    
    private func startOver() {
        targetValue = Int.random(in: 0...100)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
