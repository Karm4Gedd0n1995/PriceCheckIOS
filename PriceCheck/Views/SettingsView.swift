//
//  SettingsView.swift
//  PriceCheck
//
//  Created by Frederic Hammer on 11.05.23.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var viewModel: FireBaseViewModel
    var body: some View {
        VStack{
            List{
                // Todo Settings
            }
            Button {
                viewModel.logout()
            } label: {
                Text("Log out").foregroundColor(.red)
            }

        }}
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView().environmentObject(FireBaseViewModel())
    }
}
