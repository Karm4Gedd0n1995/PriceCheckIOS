//
//  FavoritenView.swift
//  PriceCheck2.0
//
//  Created by Frederic Hammer on 15.05.23.
//

import SwiftUI

struct FavoritenView: View {
    @StateObject var dataModel : DataBase
    var body: some View {
        List{
            ForEach(dataModel.favData,id: \.self){ prospect in
                NavigationLink{
                    ProspectView() } label: {
                        Image(prospect.image ?? "").resizable()
                            .frame(width: 75, height: 100)
                        Text(prospect.name ?? "").bold().font(.largeTitle)
                    }
                    
                
            }.onDelete{indexSet in
                dataModel.deleteData(indexSet: indexSet)}
                
        }
            
        }
    }

    


struct FavoritenView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritenView(dataModel: DataBase())
    }
}
