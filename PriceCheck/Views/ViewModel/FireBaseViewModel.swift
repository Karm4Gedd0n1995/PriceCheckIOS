//
//  FirebaseViewModel.swift
//  PriceCheck
//
//  Created by Frederic Hammer on 11.05.23.
//

import Foundation
import FirebaseAuth
import SwiftUI

class FireBaseViewModel: ObservableObject{
    
    // Variablen für Login und SignUp
    @Published var email = ""
    @Published var password = ""
    @Published var passwordCheck = ""
    
    // Navigation Path
    @Published var navPath = NavigationPath()
    
    // der aktuell eingeloggte User:
    @Published var currentUser: User? = nil
    
    
    func login(){
        
        if checkLoginFields(){
            
            Auth.auth().signIn(withEmail: email, password: password){ [weak self] authResult, error in
                
                guard let strongSelf = self else {return}
                
                if error == nil && authResult != nil{
                    strongSelf.clearAllLoginField()
                    strongSelf.navPath.append(authResult!.user)
                }else {
                    print (error?.localizedDescription)
                }

            }
            
        }else {
            print ("Please check the fields.")
        }
        
    }
    
    func signUp(){
        if checkSignUpFields(){
            
            Auth.auth().createUser(withEmail: email, password: password){ [weak self] authResult, error in
                
                guard let strongSelf = self else {return}
                
                if error == nil && authResult != nil {
                    strongSelf.navPath.removeLast()
                }else {
                    print (error?.localizedDescription)
                }
                
                
            }
             
        }else {
            
            print("Please check the fields")
            
        }
        
    }
    
    func checkUser(){
        if let user = Auth.auth().currentUser{
            navPath.append(user)
            currentUser = user
        }else {
            print ("User is not logged in")
        }
        
    }
    
    
    func logout(){
        
        do{
            try  Auth.auth().signOut()
            navPath.removeLast()
            currentUser = nil
        }catch let signError as NSError{
            print ("Error: \(signError)")
        }
       

    }
    
    // Hilfsfunktionen:
    
    
    
    func clearAllLoginField(){
        
        email = ""
        password = ""
        passwordCheck = ""
        
    }
    
    func checkLoginFields() -> Bool{
        if (!email.isEmpty && !password.isEmpty){
            return true
        }
        else {
            return false
        }
    }
    
    func checkSignUpFields() -> Bool {
        
        if (!email.isEmpty && !password.isEmpty){
            
            if (password != passwordCheck){
                return false
            }
            else {
                return true
            }
            
        }
        else {
            return false
        }
        
    }
}
