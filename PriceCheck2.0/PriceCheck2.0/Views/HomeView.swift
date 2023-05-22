//
//  HomeView.swift
//  PriceCheck
//
//  Created by Frederic Hammer on 25.03.23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel : FireBaseViewModel
    var prospects = ProspectViewModel()
    let rows = [GridItem(.fixed(150)), GridItem(.fixed(150))]
    var body: some View {
        
    
            TabView{
                
                VStack{
                    
                    Text("PriceCheck")
                        .font(.title)
                    ScrollView{
                        LazyHGrid(rows: rows){
                            NavigationLink(value: "prospect", label: {
                                MainCard(cardimage: "LidlProspekt", cardText: "Prospekte")
                                    
                            })
                                
                            NavigationLink(value: "favorit", label: {
                                MainCard(cardimage: "favorit", cardText: "Favoriten")
                            })
                            
                        
                            NavigationLink(value: "map", label: {
                                MainCard(cardimage: "map", cardText: "Märkte in der Nähe")
                            }) 
                            
                            
                            
                        }
                        
                    }
                    
                }.tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                VStack{
                    
                    SettingsView()
                    
                }.tabItem {
                    Image(systemName: "gearshape")
                    Text("Settings")
                }
            }
            
            
        }
    }


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
