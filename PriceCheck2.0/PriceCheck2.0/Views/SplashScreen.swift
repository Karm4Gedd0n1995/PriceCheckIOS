//
//  SplashScreen.swift
//  PriceCheck
//
//  Created by Frederic Hammer on 26.04.23.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack {
            //Color(red: 6/255, green: 15/255, blue: //53/255).ignoresSafeArea()
            VStack {
                Image("logo")
                Text("bereitet Prospekte vor...").foregroundColor(.blue)
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
