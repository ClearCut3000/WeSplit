//
//  ContentView.swift
//  WeSplit
//
//  Created by Николай Никитин on 09.08.2022.
//

import SwiftUI

struct ContentView: View {
  @State private var checkAmount = 0.0
  @State private var numberOfPeople = 2
  @State private var tipPersentage = 20
  let tipPersentages = [5, 10, 15, 20, 25, 0]
  var body: some View {
    NavigationView {
      Form {
        Section {
          TextField("Amount",
                    value: $checkAmount,
                    format: .currency(code: Locale.current.currencyCode ?? "USD"))
            .keyboardType(.decimalPad)
          Picker("Number of people", selection: $numberOfPeople) {
            ForEach(2..<100) {
              Text("\($0) people")
            }
          }
        }
        Section {
          Text(checkAmount,
               format: .currency(code: Locale.current.currencyCode ?? "USD"))
        }
      }
      .navigationTitle("WeSplit")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
