//
//  LoginScreen.swift
//  PriceCheck
//
//  Created by Frederic Hammer on 03.05.23.
//

import SwiftUI
import FirebaseAuth


    

struct LoginScreen: View {
    @EnvironmentObject var viewModel: FireBaseViewModel
    @State var passHidden = true
    var body: some View {
        
        
        ZStack{
            
            
            VStack(spacing: 30){
                Text("Logge dich ein").font(.headline)
                Image("logo").resizable().frame(width: 250, height: 250)
                TextField("Email", text: $viewModel.email)
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.gray.opacity(0.3), radius: 3, x: 0, y: 7)
                    .frame(width:300, height: 40)
                VStack(alignment: .leading){
                    if(passHidden){
                        SecureField("Password", text: $viewModel.password)
                            .padding(10)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(color: Color.gray.opacity(0.3), radius: 3, x: 0, y: 7)
                            .frame(width:300, height: 40)
                        
                        Button(action: {passHidden.toggle()}){
                            HStack{
                                Image(systemName: "eye")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25)
                                    .padding(10)
                                Text("Show Password")
                            }.foregroundColor(Color.blue)
                        }
                        
                        
                    }else {
                        
                        TextField("Password", text: $viewModel.password)
                            .padding(10)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(color: Color.gray.opacity(0.3), radius: 3, x: 0, y: 7)
                            .frame(width:300, height: 40)
                        
                      
                        Button(action: {passHidden.toggle()}){
                            HStack{
                                Image(systemName: "eye.slash")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25)
                                    .padding(10)
                                   
                                
                                Text("Hide Password")
                                    
                            }.foregroundColor(Color.blue)
                        }
                           
                        
                    }
                }.padding(5)
                    Button {
                        viewModel.login()
                    } label: {
                        Text("Login")
                    }.buttonStyle(.borderedProminent)
                    
                    Button {
                        viewModel.clearAllLoginField()
                        viewModel.navPath.append("signUp")
                    } label: {
                        Text("Sign up")
                    }.buttonStyle(.borderedProminent)
                    
                }
            }
        }
    }


struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen().environmentObject(FireBaseViewModel())
    }
}
