//
//  SignUpScreen.swift
//  PriceCheck
//
//  Created by Frederic Hammer on 11.05.23.
//

import SwiftUI

struct SignUpScreen: View {
    @EnvironmentObject var viewModel: FireBaseViewModel
    @State var passHidden = true
    var body: some View {
        VStack{
            Text("Sign up here").font(.headline)
            Image("logo")
                .resizable().frame(width: 250, height: 250)
                
            
            
            HStack{
                TextField("Email", text: $viewModel.email)
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.gray.opacity(0.3), radius: 3, x: 0, y: 7)
                    .frame(width:250, height: 35)
                
                Image("").frame(width:50)
            }.padding(10)
            
            HStack{
                if(passHidden){
                    SecureField("Password", text: $viewModel.password)
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.gray.opacity(0.3), radius: 3, x: 0, y: 7)
                        .frame(width:250, height: 35)
                    
                    Image(systemName: "eye")
                        .onTapGesture {
                            passHidden.toggle()
                        }.frame(width: 50)
                        .foregroundColor(Color.blue)
                }else {
                    TextField("Password", text: $viewModel.password)
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.gray.opacity(0.3), radius: 3, x: 0, y: 7)
                        .frame(width:250, height: 35)
                    
                    Image(systemName: "eye.slash")
                        .onTapGesture {
                            passHidden.toggle()
                        }.frame(width: 50)
                        .foregroundColor(Color.blue)
                    
                }
                
                
            }.padding(10)
            
            HStack{
                if(passHidden){
                    SecureField("Password", text: $viewModel.passwordCheck)
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.gray.opacity(0.3), radius: 3, x: 0, y: 7)
                        .frame(width:250, height: 35)
                    Image(systemName: "eye")
                        .onTapGesture {
                            passHidden.toggle()
                        }
                        .frame(width: 50)
                        .foregroundColor(Color.blue)
                }else {
                    TextField("Password", text: $viewModel.passwordCheck)
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.gray.opacity(0.3), radius: 3, x: 0, y: 7)
                        .frame(width:250, height: 35)
                    
                    Image(systemName: "eye.slash")
                        .onTapGesture {
                            passHidden.toggle()
                        }.frame(width: 50)
                        .foregroundColor(Color.blue)
                }
                
                
            }.padding(10)
            
            
            HStack{
                Button(action:{
                    
                    viewModel.clearAllLoginField()
                    viewModel.navPath.removeLast()
                    
                }){
                    Text("Cancel")
                        .foregroundColor(Color.white)
                        .frame(width: 150, height: 35)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .shadow(color: Color.gray.opacity(0.3), radius: 3, x: 0, y: 7)
                }
                
                Button(action:{
                    
                    viewModel.signUp()
                    
                }){
                    Text("Sign Up")
                        .foregroundColor(Color.white)
                        .frame(width: 150, height: 35)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .shadow(color: Color.gray.opacity(0.3), radius: 3, x: 0, y: 7)
                }
            }
            
            
        }
        
    }
    
}
    


struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreen().environmentObject(FireBaseViewModel())
    }
}
