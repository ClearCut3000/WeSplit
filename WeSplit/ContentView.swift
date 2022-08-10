//
//  ContentView.swift
//  WeSplit
//
//  Created by Николай Никитин on 09.08.2022.
//

import SwiftUI

struct ContentView: View {

  //MARK: - Properties
  @State private var checkAmount = 0.0
  @State private var numberOfPeople = 2
  @State private var tipPersentage = 20
  @FocusState private var amountIsFocused: Bool
  let tipPersentages = [5, 10, 15, 20, 25, 0]
  var totalAmount: Double {
    let tipSelection = Double(tipPersentage)
    let tipValue = checkAmount / 100 * tipSelection
    let grandTotal = checkAmount + tipValue
    return grandTotal
  }
  var totalPerPerson: Double {
    let peopleCount = Double(numberOfPeople + 2)
    let tipSelection = Double(tipPersentage)
    let tipValue = checkAmount / 100 * tipSelection
    let grandTotal = checkAmount + tipValue
    let amountPerPerson = grandTotal / peopleCount
    return amountPerPerson
  }
  var localCurrency: FloatingPointFormatStyle<Double>.Currency {
    if let localCurrency = Locale.current.currencyCode {
      return .currency(code: localCurrency)
    } else {
      return .currency(code: "USD")
    }
  }

  //MARK: - View
  var body: some View {
    NavigationView {
      Form {
        Section {
          TextField("Amount",
                    value: $checkAmount,
                    format: localCurrency)
            .keyboardType(.decimalPad)
            .focused($amountIsFocused)
          Picker("Number of people", selection: $numberOfPeople) {
            ForEach(2..<100) {
              Text("\($0) people")
            }
          }
        }  header: {
          Text("Specify the account and the number of people here")
        }
        Section {
          Picker("Tip persentage", selection: $tipPersentage) {
            ForEach(0..<101) {
              Text($0, format: .percent)
            }
          }
        } header: {
          Text("How much tip do you want to leave?")
        }
        Section {
          Text(totalAmount,
               format: localCurrency)
        } header: {
          Text("Total amount")
        }
        Section {
          Text(totalPerPerson,
               format: localCurrency)
        } header: {
          Text("Amount per person")
        }
      }
      .navigationTitle("WeSplit")
      .toolbar {
        ToolbarItemGroup(placement: .keyboard) {
          Spacer()
          Button("Done") {
            amountIsFocused = false
          }
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
