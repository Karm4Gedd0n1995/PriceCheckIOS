//
//  ProspectsView.swift
//  PriceCheck
//
//  Created by Frederic Hammer on 25.03.23.
//

import SwiftUI

struct ProspectsView: View {
    var prospects : ProspectViewModel
    var body: some View {
        VStack{
            Text("Prospekte der Woche")
                .font(.title)
            ScrollView{
                ForEach(prospects.prospectList){ prospect in
                    NavigationLink {
                        ProspectView()
                    } label: {
                        ProspectCard(prospect: prospect)
                    }
                    
                }
            }
        }
    }
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(prospects: ProspectViewModel.init())
    }
}
