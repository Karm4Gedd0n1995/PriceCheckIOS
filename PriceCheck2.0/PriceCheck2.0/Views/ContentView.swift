//
//  ContentView.swift
//  PriceCheck
//
//  Created by Frederic Hammer on 25.03.23.
//

import SwiftUI
import FirebaseAuth


struct ContentView: View {
    @StateObject var viewModel = FireBaseViewModel()
   
    @State var dataLoaded: Bool = false
    var body: some View {
        VStack{
            if (dataLoaded){
                NavigationStack(path:$viewModel.navPath){
                    
                    LoginScreen()
                        .navigationDestination(for: String.self){
                            navDest in
                            
                            if (navDest == "signUp"){
                                SignUpScreen()
                            } else if (navDest == "prospect"){
                                ProspectsView(prospects: ProspectViewModel())
                            } else if (navDest == "map"){
                                MapView2()
                            } else if (navDest == "favorit"){
                                FavoritenView(dataModel: DataBase())
                            }
                        }
                        .navigationDestination(for: User.self){ user in
                            HomeView()
                        }
                        
                    
                }
                .onAppear(perform: {
                    
                    viewModel.checkUser()
                    
                })
                
                .environmentObject(viewModel)
                .padding()
                
            
            } else {
                SplashScreen()
            }
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                // Code wird nach angegebener Zeit in deadline ausgeführt
                withAnimation {
                    dataLoaded = true
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
