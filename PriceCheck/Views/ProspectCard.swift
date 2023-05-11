//
//  ProspectCard.swift
//  PriceCheck
//
//  Created by Frederic Hammer on 25.03.23.
//

import SwiftUI

struct ProspectCard: View {
    var prospect : Prospect
    var body: some View {
        
            VStack{
                Image(prospect.image)
                    .resizable()
                    .frame(width: 350, height: 600)
                Text(prospect.name).bold().font(.largeTitle)
                Divider()
            }
        
    }
}

struct ProspectCard_Previews: PreviewProvider {
    static var previews: some View {
        ProspectCard(prospect: Prospect.init(name: "Lidl", image: "LidlProspekt"))
    }
}
