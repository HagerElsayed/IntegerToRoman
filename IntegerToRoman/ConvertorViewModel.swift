//
//  ConvertorViewModel.swift
//  IntegerToRoman
//
//  Created by Hager Elsayed on 30/07/2022.
//

import Foundation

class ConvertorViewModel : ObservableObject {
    @Published var roman: String = ""
    @Published var number: String = "" {
        didSet {
            reset()
        }
    }
    @Published var message: String = ""
    
    func reset() {
        roman = ""
        message = ""
    }
    
    func convertIntToRoman() {
        guard let numberAsInteger = Int(number),
              numberAsInteger >= 1,
              numberAsInteger <= 3999 else {
                  message =  "Please enter a number between 1 and 3999"
                  roman = ""
                  return
              }
        message = ""
        roman = Convertor.intToRoman(numberAsInteger)
    }

}
