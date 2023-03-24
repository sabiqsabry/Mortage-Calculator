//
//  ContentView.swift
//  exam
//
//  Created by Sabiq Sabry on 23/03/2023.
//

import SwiftUI
import Foundation

struct ContentView: View {
    
    @AppStorage("value1") private var value1 = ""
    @AppStorage("value2") private var value2 = ""
    @AppStorage("value3") private var value3 = ""
    @AppStorage("finalValue") private var finalValue = ""
    @AppStorage("isInputAvailable") private var isInputAvailable = true
    
    var body: some View {
        VStack {
            Text("Mortage Calculator")
                .font(.system(size: 30, weight: .bold))
            HStack{
                Image(systemName: "sterlingsign.circle.fill")
                Text("Monthly Payment")
            }
            .padding()
        
            TextField("Monthly Payment...", text: $value1)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(Color.blue)
            HStack{
                Image(systemName: "clock.badge.questionmark")
                Text("Loan Period-Years")
            }
            .padding()
            
            TextField("Loan Period-Years...", text: $value2)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(Color.blue)
            
            HStack{
                Image(systemName: "percent")
                Text("Interest Rate")
            }
            .padding()
            
            TextField("Interest Rate...", text: $value3)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(Color.blue)
            
            
            Button{
                calculateMortage()
            } label: {
                Text("Calculate")
                    .font(.system(size: 16, weight: .semibold))
            }
            .padding()
            
            Text("Amount that can be borrowed: \(finalValue)")
        }
        .padding()
    }
    
    func calculateMortage(){
        guard
            let num1 = Double(value1),
            let num2 = Double(value2),
            let num3 = Double(value3)
        else{
            isInputAvailable = false
            return
        }
        
        let r = num3/100
        let a = r/12 + 1
        
        let p = (num1*(pow(a, (num2*12))-1)*pow(a, (-num2*12)))/(r/12)
        let roundedp = p.formatted(.number.precision(.fractionLength(2)))
        finalValue = "£\(roundedp)"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
