//
//  MainCard.swift
//  PriceCheck
//
//  Created by Frederic Hammer on 10.05.23.
//

import SwiftUI

struct MainCard: View {
    var cardimage : String
    var cardText : String
    var body: some View {
        VStack{
            Image(cardimage)
                .resizable()
                .frame(width: 100, height: 100)
            Text(cardText).bold()
            
        }
        
    }
}


