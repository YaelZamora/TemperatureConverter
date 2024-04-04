//
//  ContentView.swift
//  TemperatureConverter
//
//  Created by Yael Javier Zamora Moreno on 04/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var temperature = ""
    @State private var temperatura = 0.0
    @State var selectedType = "Celsius"
    var options = ["Celsius", "Fahrenheit"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    HStack {
                        TextField("Grados", text: $temperature).keyboardType(.decimalPad)
                        
                        Text((selectedType == "Celsius") ? "Fahrenheit" : "Celsius")
                    }
                    
                    Picker("Convert Type", selection: $selectedType) {
                        ForEach(options, id: \.self) {
                            Text($0)
                        }
                    }
                    
                }
                
                Section {
                    Button("Convert") {
                        convertType()
                    }
                }
                
                Text("\(temperatura, specifier: "%.2f")")
            }.navigationTitle("Converter")
        }
    }
    
    func convertType() {
        temperatura = Double(temperature)!
        
        if selectedType == "Celsius" {
            temperatura -= 32
            temperatura *= 0.5555
        } else {
            temperatura *= 1.8
            temperatura += 32
        }
    }
}

#Preview {
    ContentView()
}
