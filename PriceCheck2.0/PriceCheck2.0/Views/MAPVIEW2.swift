//
//  SwiftUIView.swift
//  PriceCheck2.0
//
//  Created by Frederic Hammer on 22.05.23.
//

import SwiftUI
import MapKit
import CoreLocation
import UIKit

struct MapView2: View {
    @StateObject var manager = LocationManager()
    
    
    
    var body: some View {
        Map(coordinateRegion: $manager.region)
        
        
            
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MapView2()
    }
}
