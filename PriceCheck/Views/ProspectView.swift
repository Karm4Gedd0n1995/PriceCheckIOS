//
//  ProspectView.swift
//  PriceCheck
//
//  Created by Frederic Hammer on 25.03.23.
//

import SwiftUI

struct ProspectView: View {
    var prospect = ProspectDetailViewModel()
    var body: some View {
        TabView{
        ForEach(prospect.detailList){ prosp in
            
            
                VStack{
                    Text(prosp.name)
                        .font(.title)
                    Image(prosp.image)
                        .resizable()
                        .frame(width: 400, height: 500)
                    Text(prosp.seite)
                }
                
            }
        }.tabViewStyle(.page)
    }
}

struct ProspectView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectView(prospect: ProspectDetailViewModel.init())
    }
}
