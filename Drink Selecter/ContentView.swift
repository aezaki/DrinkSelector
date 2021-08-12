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
    @State private var skipDrink = false
    @State private var disableButton = false
    
    enum DrinkType: String, CaseIterable, Identifiable {
        static let shotArray = ["White Tequila", "Vodka", "Rum", "Gin", "Whiskey", "Gold Tequila"]
        static let mixedShot = ["SuperMan", "Pink Pussy", "Kamikazi", "Bob Marley", "Mango Shot"]
        static let beerArray = ["Corona", "Stella", "Tequila Sunrise", "DosX"]
        static let cocktailArray = ["Pinacolada", "Bahamamama", "Mohito", "Mango Tango", "Mango Majito", "Strawberry Daiquiri", "Blue Margarita", "Earnest Hemingway", "Vodka Lemonade"]
        static let gentlemenDrink = ["Whiskey Neat", "Whiskey Sour", "Whiskey on Ice", "Scotch Neat", "Scotch on Ice"]
        
        case beer;
        case shots;
        case cocktails;
        case mixed_shots
        case Gentlemen
        var id: String { self.rawValue }
        
        var drinkOptions: [String] {
            switch self {
            case .shots:
                return ContentView.DrinkType.shotArray
            case .beer:
                return ContentView.DrinkType.beerArray
            case .cocktails:
                return ContentView.DrinkType.cocktailArray
            case .mixed_shots:
                return ContentView.DrinkType.mixedShot
            case .Gentlemen:
                return ContentView.DrinkType.gentlemenDrink
            }
        }
        
        func drink() -> String {
            drinkOptions.randomElement() ?? ""
        }
    }
    
    var body: some View {
       
        VStack {
            Picker(selection: $selection, label:
                    Text("Drink Types")
                    .bold()
                    .font(.largeTitle)
            ) {
                
                Text("Beer").tag(DrinkType.beer)
                    .foregroundColor(.blue)
                Text("Cocktail").tag(DrinkType.cocktails)
                    .foregroundColor(.blue)
                Text("Shots").tag(DrinkType.shots)
                    .foregroundColor(.blue)
                Text("Flavoured Shots").tag(DrinkType.mixed_shots)
                    .foregroundColor(.blue)
                Text("Gentleman Drinks").tag(DrinkType.Gentlemen)
                    .foregroundColor(.blue)
            }
            .padding(.top, -22.0)
            
            
            
            Button(action: {
                showDetails.toggle()
                disableButton.toggle()
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
            .disabled(disableButton)
            .padding(.vertical, 60.0)
        
            if showDetails {
                if skipDrink {
                    Text("Drink Twice")
                }
                Text(selection.drink())
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.red)
            }
            if skipDrink {
                Text(selection.drink())
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.red)
            }
            
    }
        if #available(iOS 15.0, *) {
            HStack {
                
                Button(action: {
                    showDetails.toggle()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                    showDetails.toggle()
                    skipDrink.toggle()
                        
                     }
                })
                {
                    Text("Skip Drink")
                }
                Button(action: {
                    showDetails.toggle()
                    disableButton.toggle()
                    if skipDrink {
                        skipDrink.toggle()
                    }
                })
                {
                    Text("Play Again")
                }
            }
            .buttonStyle(.bordered)
        } else {
            // Fallback on earlier versions
        }
        
        
}
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
