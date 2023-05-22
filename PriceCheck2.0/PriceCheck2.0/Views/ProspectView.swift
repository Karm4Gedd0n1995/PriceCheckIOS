//
//  ProspectView.swift
//  PriceCheck
//
//  Created by Frederic Hammer on 25.03.23.
//

import SwiftUI

struct ProspectView: View {
   @ObservedObject var viewmodel = ApiViewModel()
    var body: some View {
        TabView{
            ForEach(viewmodel.apiprospect, id: \.self){ prosp in
            
            
                VStack{
                    
                    AsyncImage(url: URL(string: prosp.image))
                        
                    { image in image.resizable() } placeholder: { Color.red } .frame(width: 400, height: 700) .clipShape(RoundedRectangle(cornerRadius: 25))
                    
                    
                    Text(prosp.name)
                        .font(.footnote)
                }
                
            }
        }.task {
            await viewmodel.loadProspect()
         }
        .tabViewStyle(.page)
            
    }
}

struct ProspectView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectView()
    }
}
