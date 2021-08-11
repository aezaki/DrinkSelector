//
//  ContentView.swift
//  Drink Selecter
//
//  Created by Andrew Z on 2021-08-10.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection = DrinkType.beer
    @State private var showDetails = false
    
    enum DrinkType: String, CaseIterable, Identifiable {
        static let shotArray = ["Tequila", "Vodka", "Rum", "Gin", "Whiskey"]
        static let beerArray = ["Corona", "Stella", "tequila Sunrise", "DosX"]
        static let cocktailArray = ["Pinacolada", "bahamamama", "Mohito"]
        
        case beer;
        case shots;
        case cocktails;
        var id: String { self.rawValue }
        
        var drinkOptions: [String] {
            switch self {
            case .shots:
                return ContentView.DrinkType.shotArray
            case .beer:
                return ContentView.DrinkType.beerArray
            case .cocktails:
                return ContentView.DrinkType.cocktailArray
            }
        }
        
        func drink() -> String {
            drinkOptions.randomElement() ?? ""
        }
    }
    
    var body: some View {
       
        VStack {
            Picker(selection: $selection, label:
                    Text("Drink Types")) {
                Text("Beer").tag(DrinkType.beer)
                Text("Cocktail").tag(DrinkType.cocktails)
                Text("Shots").tag(DrinkType.shots)
            }
            .padding(.top, 36.002)
            
            Button(action: {
                showDetails.toggle()
            }) {
                Text("Pick A Drink")
                    .font(.title)
                    .foregroundColor(.gray)
                    .bold()
                    .padding(20)
                    .background(
                        Color.white
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                            .shadow(color: .black.opacity(0.4), radius: 2, x: 0, y: 1)
                    )
            }
            
            .padding(.vertical, 100.0)
        
            if showDetails {
                Text( "Drink Type:  \(selection.rawValue)")
                    .padding()
                Text(selection.drink())
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.blue)

            }
            
    }
        
        
}
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
