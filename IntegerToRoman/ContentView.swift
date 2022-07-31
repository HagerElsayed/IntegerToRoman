//
//  ContentView.swift
//  IntegerToRoman
//
//  Created by Hager Elsayed on 30/07/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var viewModel: ConvertorViewModel = ConvertorViewModel()
    @State private var display = false
    var body: some View {
        ScrollView {
            VStack {
                Text("Integer to Roman")
                    .font(.title)
                    .padding()
                    .padding(.top, 40)
                    .foregroundColor(Color.romanPrimaryFontColor)
                //Show RomanNumbers
                RomanNumber(romanNumbers: Convertor.numerals, values: Convertor.values)
                    .frame(maxHeight: display ? 300 : 0)
                
                
                HStack {
                    Image(systemName: "number")
                        .foregroundColor(.black)
                        .padding()
                    TextField("Give it a trial and type a number ..", text: $viewModel.number)
                }
                .background(Color.white)
                .cornerRadius(30)
                .padding(.horizontal, 25)
                .padding(.vertical)
                
                
            }
            Button(action: {
                viewModel.convertIntToRoman()
                withAnimation(.easeOut) { display = true }
            }){
                Text("Convert to Roman")
                    .foregroundColor(.white)
                
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width / 1.1)
            .background(Color.romanPrimaryColor)
            .cornerRadius(35)
            .padding()
            
            Text("\(viewModel.roman)")
                .font(.system(size: 150))
                .fontWeight(.bold)
                .foregroundColor(Color.romanAccentFontColor)
            Text("\(viewModel.message)")
                .font(.title)
                .foregroundColor(Color.romanPrimaryFontColor)
            
        }
        .background(Color.romanBackgroundColor)
        .edgesIgnoringSafeArea(.all)
    }
}

struct RomanNumber: View {
    var romanNumbers: [String]
    var values: [Int]
    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(0..<romanNumbers.count, id: \.self) { index in
                    HStack {
                        Divider()
                            .padding()
                        
                        VStack {
                            Text(romanNumbers[index])
                                .fontWeight(.bold)
                                .font(.title)
                                .foregroundColor(Color.romanAccentFontColor)
                                .padding(.bottom, 60)
                            
                            Text("\(values[index])")
                                .fontWeight(.bold)
                                .font(.title)
                                .foregroundColor(Color.romanAccentFontColor)
                                .padding(.bottom, 60)
                        }
                    }
                    .frame(width: 150)
                    
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
