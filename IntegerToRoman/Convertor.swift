//
//  Convertor.swift
//  IntegerToRoman
//
//  Created by Hager Elsayed on 30/07/2022.
//

import Foundation

struct Convertor {
    static let values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
    static let numerals = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
    static func intToRoman(_ num: Int) -> String {
        var number = num
        var result = ""
        guard number >= 1,
              number <= 3999 else { return "Please enter a number between 1 and 3999"}
        
        while number > 0 {
            for(index, value) in values.enumerated() {
                if number - value >= 0 {
                    number -= value
                    result += numerals[index]
                    break
                }
            }
        }
        return result
    }
}
