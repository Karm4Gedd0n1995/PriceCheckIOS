//
//  ProspectCard.swift
//  PriceCheck
//
//  Created by Frederic Hammer on 25.03.23.
//

import SwiftUI

struct ProspectCard: View {
    @StateObject var dataModel = DataBase()
     var prospect : Prospect
    var body: some View {
        
            VStack{
                Image(prospect.image )
                    .resizable()
                    .frame(width: 350, height: 600)
                HStack{
                    Text(prospect.name).bold().font(.largeTitle)
                    Image(systemName: isFavorite ? "heart.fill" : "heart").foregroundColor(.red).onTapGesture {
                        if(prospect.isFavorite == false){
                        dataModel.saveData(isFavorite: true, name: prospect.name, image: prospect.image)
                        prospect.isFavorite.toggle()
                        } else {
                            prospect.isFavorite.toggle()
                            
                        }
                    }
                }
                Divider()
            }
        
    }
}

struct ProspectCard_Previews: PreviewProvider {
    static var previews: some View {
        ProspectCard(prospect: Prospect.init(name: "Lidl", image: "LidlProspekt"))
    }
}
